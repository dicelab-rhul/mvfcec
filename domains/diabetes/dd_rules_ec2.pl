/** ---- DOMAIN SPECIFIC ACTIVITY DEFNS ---- */

/** Started activities */
causes_at(walks(P),  start(activity(walking, P, G)), T):- 
	happens_at(walks(P), T),
	holds_at(goal(G, P)=active, T),
	\+ holds_at(activity(walking, P, G)=active, T),
	\+ holds_at(activity(walking, P, G)=suspended, T).
causes_at(stands(P), start(activity(standing, P, G)), T):- 
	happens_at(stands(P), T),
	holds_at(goal(G, P)=active, T),
	\+ holds_at(activity(standing, P, G)=active, T),
	\+ holds_at(activity(standing, P, G)=suspended, T).
causes_at(lies(P), start(activity(lying, P, G)), T):- 
	happens_at(lies(P), T),
	holds_at(goal(G, P)=active, T),
	\+ holds_at(activity(lying, P, G)=active, T),
	\+ holds_at(activity(lying, P, G)=suspended, T).

/* suspended activities */
causes_at(stands(P), suspend(activity(walking, P, G)), T):- 
	happens_at(stands(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(walking, P, G)=active, T).
causes_at(lies(P), suspend(activity(standing, P, G)), T):- 
	happens_at(lies(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(standing, P, G)=active, T).
causes_at(stands(P), suspend(activity(lying, P, G)), T):- 
	happens_at(stands(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(lying, P, G)=active, T).
causes_at(walks(P), suspend(activity(standing, P, G)), T):- 
	happens_at(walks(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(standing, P, G)=active, T).

/* resumed activities */
causes_at(walks(P), resume(activity(walking, P, G)), T):- 
	happens_at(walks(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(walking, P, G)=suspended, T).
causes_at(stands(P),  resume(activity(standing, P, G)), T):- 
	happens_at(stands(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(standing, P, G)=suspended, T).
causes_at(lies(P), resume(activity(lying, P, G)), T):- 
	happens_at(lies(P), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(lying, P, G)=suspended, T).

/* Add your own defns here */
causes_at(drop(G, P), interrupt(activity(A, P, G)), T):-
        happens_at(drop(G, P), T),
        holds_at(activity(A, P, G)=active, T).
causes_at(arrived(P, L), complete(activity(A, P, G)), T):-	
	happens_at(arrived(P, L), T),
	holds_at(goal(G, P)=active, T),
	holds_at(activity(A, P, G)=active, T).

/* GOALS DD Defns */
causes_at(adopt_goal_fromGUI(P, G), adopt(goal(G, P)), T):-
	happens_at(adopt_goal_fromGUI(P, G), T),
	\+ holds_at(goal(G, P)=active, T),
	\+ holds_at(goal(G, P)=deactivated, T).
		
causes_at(deactivate_goal_fromGUI(P, G), deactivate(goal(G, P)), T):-
	happens_at(deactivate_goal_fromGUI(P, G), T),
	holds_at(goal(G, P)=active, T).

causes_at(reactivate_goal_fromGUI(P, G), reactivate(goal(G, P)), T):-
	happens_at(reactivate_goal_fromGUI(P, G), T),
	holds_at(goal(G, P)=deactivated, T).

causes_at(drop_goal_fromGUI(P, G), drop(goal(G, P)), T):-
	happens_at(drop_goal_fromGUI(P, G), T),
	holds_at(goal(G, P)=active, T).

causes_at(complete(activity(A, P, G)), achieve(goal(G, P)), T):-
   	happens_at(complete(activity(A, P, G)), T).

/* Falls event with activity theory */
causes_at(lies(Person), falls(Person), T):-
	happens_at(lies(Person), T),
	holds_at(activity(standing, Person, G)=active, T),
	holds_at(activity(walking, Person, G)=suspended, T).

/* Faint event */
causes_at(no_response(Person, WaitingTime), faints(Person), T):-
        happens_at(no_response(Person, WaitingTime), T),
        happens_at(raises_alert(Person, hypoglycemia), T1),
        happens_at(falls(Person), T2),
        lt(T1, T2),
        happens_at(requests(Person, confirm_status), T3),
        lt(T2, T3),
        T4 is T3 + WaitingTime,
        holds_at(goal(_Goal, Person)=active, T),
        ge(T, T4).

% Low level event definitions
initiates_at(measurement(P, glucose, Val), [], glucose(P)=Val, T):-
        happens_at(measurement(P, glucose, Val), T).
initiates_at(walks(P), [], status_of(P)=ok, T):-
        happens_at(walks(P), T).
initiates_at(arrived(P,L), [], location_of(P)=L, T):-
        happens_at(arrived(P, L), T).
initiates_at(falls(P), [], status_of(P)=fallen, T):-
        happens_at(falls(P), T).
initiates_at(faints(P), [], status_of(P)=fainted, T):-
        happens_at(faints(P), T).
