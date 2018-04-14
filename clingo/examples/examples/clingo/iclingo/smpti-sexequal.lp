%inputs
men(a;b;c;d;e;f;g;h).
women(a;b;c;d;e).
rank(1..8).
giv(a, a, 1; a, b, 2; a, c, 2; a, d, 3; a, e, 3).
giv(b, a, 1; b, b, 2; b, c, 2; b, d, 3; b, e, 3).
giv(c, a, 1; c, b, 2; c, c, 2; c, d, 3; c, e, 3).
giv(d, a, 1; d, b, 2; d, c, 3; d, d, 3; d, e, 3).
giv(e, a, 1; e, b, 2; e, c, 3; e, d, 3; e, e, 3).
giv(f, a, 1; f, b, 2; f, c, 3; f, d, 3; f, e, 3).
giv(g, a, 1; g, b, 2; g, c, 3; g, d, 3; g, e, 3).
giv(h, a, 1; h, b, 2; h, c, 3; h, d, 3; h, e, 3).

giv1(a, a, 1; a, b, 2; a, c, 3; a, d, 3; a, e, 5; a, f, 5; a, g, 7; a, h, 8).
giv1(b, a, 1; b, b, 2).
giv1(c, b, 1; c, a, 2).
giv1(d, a, 1; d, b, 2; d, c, 3; d, d, 4).
giv1(e, a, 4; e, b, 3; e, c, 2, d, d, 1).

1{wed(A,B):women(B),men(A)}.%map for marriage
:-wed(A,B),wed(A1,B),A!=A1.
:-wed(A,B),wed(A,B1),B!=B1.

mpun(-1).
wpun(-1).

% 2 married
prefer(A,D,B) :- giv(A,D,R),giv(A,B,R1),R<R1.
prefer1(D,A,C) :- giv1(D,A,R2),giv1(D,C,R3),R2<R3.
:- wed(A,B), wed(C,D), prefer(A,D,B), prefer1(D,A,C).

% 2 singles
singles(A,B):-women(A),men(B),not wed(B,_),not wed(_,A).
:-women(A),men(B),giv(B,A,R),giv1(A,B,R1),singles(A,B).

% 1 single, 1 married
:-women(A),men(B),not wed(B,_),wed(A,C),prefer1(C, B, A), giv(B, A, _).
:-women(A),men(B),not wed(_,A),wed(B,C),prefer(B, A, C), giv1(A, B, _).

% finding acceptable
pgiv(M, F) :- giv(M, F, _).
pgiv1(F, M) :- giv1(F, M, _).
bpref(M, F) :- pgiv(M, F), pgiv1(F, M).
:-women(F), men(M), wed(M, F), not bpref(M, F).

% OPTIMIZATION

% single rank, given punishment

c_man(M, P) :- mpun(P), P != -1, men(M), not wed(M,_).
c_woman(F, P) :- wpun(P), P != -1, women(F), not wed(_,F).

% single rank, not given punishment

c_man(M, C+1) :- C = #count{F : giv(M, F, R)}, men(M),not wed(M,_), mpun(P), P = -1.
c_woman(F, C+1) :- C = #count{M : giv1(F, M, R)}, women(F), not wed(_,F), wpun(P), P = -1.

% pair rank

c_man(M, R) :- wed(M, F), giv(M, F, R).
c_woman(F, R) :- wed(M, F), giv1(F, M, R).

% total rank

mtot(T) :- T = #sum{R, M: c_man(M, R)}.
wtot(T) :- T = #sum{R, F: c_woman(F, R)}.

% weak constraint

:~ mtot(M), wtot(F). [|M-F|]
#show wed/2.