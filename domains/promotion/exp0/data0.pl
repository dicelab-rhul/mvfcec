/*
 Promotions example
 Date: Nov 2015
*/

observed_at(initially(rank(john)=lecturer),0).
observed_at(initially(rank(mary)=ra), 0).
observed_at(promote(mary), 1).
observed_at(promote(john), 3).
observed_at(promote(john), 4).
observed_at(promote(mary), 5).
observed_at(promote(mary), 6).
observed_at(promote(mary), 7).
observed_at(demote(mary), 9).
