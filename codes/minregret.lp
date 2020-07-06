% OPTIMIZATION

%:~ T = #max{R1: marry(M, F), mrank(M, F, R1); R2:  marry(M, F),  wrank(F, M, R2)}, T>#inf. [T]

% minimizes the maximum regret
regret(K) :- marry(M,W), mrank(M,W,K).
regret(K) :- marry(M,W), wrank(W,M,K).
:~ T = #max{R: regret(R)}, T > #inf. [T@1]
