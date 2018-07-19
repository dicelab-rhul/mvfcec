/*
 Author: Kostas Stathis
 Date: Nov 2015
*/

% Domain knowledge about ranking academics
next_rank(ra, lecturer).
next_rank(lecturer, senior_lecturer).
next_rank(senior_lecturer, reader).
next_rank(reader, professor).

% What promotes initiates.
initiates_at(promote(X), [], rank(X)=New, T):-
       happens_at(promote(X), T),
       holds_at(rank(X)=Old, T),
       next_rank(Old, New).

% What demotes initiates.
initiates_at(demote(X), [], rank(X)=New, T):-
       happens_at(demote(X), T),
       holds_at(rank(X)=Old, T),
       next_rank(New, Old).

% What demotes initiates.
initiates_at(illegal(X), [], stop(X)=true, T):-
       happens_at(illegal(X), T).

% Used as example of event recognition at present
causes_at(demote(X), illegal(demote(X)), T):- 
	happens_at(demote(X), T),
	happens_at(promote(X), T1),
	T1 < T,
	happens_at(promote(X), T2),
	T2 < T1.
