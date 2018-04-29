% Marie Morin
% CSCI 305 Prolog Lab 2

mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).

spouse(H,W):- married(H,W).

child(C,P) :- parent(C,P).
son(S,P) :- parent(S,P), male(S).
daughter(D,P) :- parent(D,P), female(D).

sibling(X,Y):- parent(P,X), parent(P,Y), dif(X,Y).
brother(B,S):- sibling(B,S), male(B).
sister(S,X):- sibling(S,X), female(S).

uncle(U,N):- parent(P,N), brother(U,P).
aunt(A,N):- parent(P,N), sister(A,N).

uncle(U,N):- parent(P,N), sibling(P,A), spouse(U,A), male(U).
aunt(A,X):- parent(P,X), sibling(P, U), spouse(A,U), female(A).

grandparent(G,C):- parent(P,C), parent(G,P).
grandfather(G,C):- grandparent(G,C), male(G).
grandmother(G,C):- grandparent(G,C), female(G).
grandchild(C,G):- grandparent(G,C).

%ancestor(A,P) :-
