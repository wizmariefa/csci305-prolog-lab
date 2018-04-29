% Marie Morin
% CSCI 305 Prolog Lab 2

% Sets the mothers and fathers for each child.
mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).

% Sets the married couples as each other's spouses.
spouse(H,W):- married(H,W).
spouse(H,W):- married(W,H).

% Sets the child for parents, and sets gender. Or sex.
child(C,P) :- parent(P,C).
son(S, P):- child(S,P), male(S).
daughter(D,P):- child(D,P), female(D).

% Sets the siblings and brother/sisters for the people passed in.
sibling(X,Y):- parent(P,X), parent(P,Y), dif(X,Y).
brother(B,S):- sibling(B,S), male(B).
sister(S,X):- sibling(S,X), female(S).

% Sets who is who's uncle and who are aunts. This part was tricky because
%  I didn't realize that the uncle needed to be next to the uncle, and the
%  aunt had to be under the aunt.
uncle(U,N):- parent(P,N), brother(U,P).
uncle(U,N):- parent(P,N), sibling(P,A), spouse(U,A), male(U).
aunt(A,N):- parent(P,N), sister(A,P).
aunt(A,N):- parent(P,N), sibling(P,U), spouse(A,U), female(A).

% Sets grand-relationships for each person.
grandparent(G,C):- parent(P,C), parent(G,P).
grandfather(G,C):- grandparent(G,C), male(G).
grandmother(G,C):- grandparent(G,C), female(G).
grandchild(C,G):- grandparent(G,C).

% Uses recursion to print out the entire list of ancestors.
ancestor(A,X):- parent(A,X).
ancestor(A,X):- parent(P,X), ancestor(A,P).

% Returns true if D is a descendant of P.
descendant(D,P):- ancestor(P,D).

% Determines if person X is older than person Y.
older(X,Y):- born(X,B), born(Y,C), B < C.
younger(X,Y):- born(X,B), born(Y,C), B > C.

% Prints who was the regent when P was born.
regentWhenBorn(R,P):- reigned(R,S,F), born(P,B), B > S, B < F.

% EXTRA CREDIT
% Sets people as cousins.
cousin(C,X):- parent(P,C), parent(Y,X), sibling(P,Y).
