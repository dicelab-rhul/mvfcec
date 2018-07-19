observed_at(initially(status_of(john)=ok), 0).
observed_at(initially(home_of(john)=h1), 0).
observed_at(initially(location_of(h1)=homeAddress), 0).
observed_at(initially(location_of(john)=busStop),0).
observed_at(initially(glucose(john)=3.8),0).
observed_at(adopt_goal_fromGUI(john, at_home), 1).
observed_at(walks(john), 3).
observed_at(stands(john), 4).
observed_at(walks(john), 5).
observed_at(stands(john), 6).
observed_at(raises_alert(john, hypoglycemia), 6).
observed_at(lies(john), 7).
observed_at(requests(john, confirm_status), 8).
observed_at(no_response(john, 2), 11).
