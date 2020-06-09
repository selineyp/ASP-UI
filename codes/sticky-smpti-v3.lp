% GENERATE

{msingle(M)} :- man(M).
{wsingle(F)} :- woman(F).

% M prefers F to single
m2single(M, F) :- man(M), woman(F), mrank(M, F, X).

% F prefers M to single
w2single(F, M) :- man(M), woman(F), wrank(F, M, X).

% acceptability
acceptable(M,F) :- m2single(M, F), w2single(F, M).

{marry(M,F) : woman(F), acceptable(M,F), not wsingle(F)} = 1 :- man(M), not msingle(M).
:- {marry(M, F) : man(M)} > 1, woman(F).
:- not wsingle(F), {marry(M,F) : man(M)}0, woman(F).

% DEFINE

% M prefers DF to CF.
mprefer(M, DF, CF) :- mrank(M, CF, CUR), mrank(M, DF, DEV), DEV < CUR.

% F prefers DM to CM.
wprefer(F, DM, CM) :- wrank(F, CM, CUR), wrank(F, DM, DEV),  DEV < CUR.

% TEST

% it is assumed that marriage to an acceptable partner is preferred over being single

% m1-f1, m2-f2 -- m1 and f2 block - sticky stability

:- marry(M1, F1), marry(M2, F2), k_man(M1,K1), mrank(M1,F1,R), mrank(M1,F2,R1), R - R1 > K1,
                                 k_woman(F2,K2), wrank(F2,M2,R), wrank(F2,M1,R1), R - R1 > K2 .


% m-f1, f2 single -- m and f2 block
:- man(M), woman(F1), woman(F2), acceptable(M,F2), wsingle(F2), marry(M,F1), k_man(M,K), mrank(M,F1,R), mrank(M,F2,R1), R - R1 > K.

% m1-f, m2 single -- m2 and f block
:- man(M1), man(M2), woman(F), acceptable(M2,F), msingle(M2), marry(M1,F), k_woman(F,K), wrank(F,M1,R), wrank(F,M2,R1), R - R1 > K.

% m, f single -- m and f block
:- man(M), woman(F), msingle(M), wsingle(F), acceptable(M,F).


% SHOW

#show marry/2.
#show msingle/1.
#show wsingle/1.
