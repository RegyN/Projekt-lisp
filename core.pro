:- dynamic trait/2.
:- dynamic pet/1.
:- dynamic no/2.
:- dynamic yes/2.


/* data */
pet(pyton) :- duzy, egzotyczny, !.
pet(pies) :- duzy, przyjazny, !.
pet(kot) :- duzy, !.
pet(chomik) :- gryzon, !.
pet(kanarek) :- latajacy, !.
pet(rybki).

/* attributes */
egzotyczny :- trait(egzotyczny, 'Czy lubisz egzotyke').
duzy :- trait(duzy, 'Czy masz w domu dosc miejsca na duze zwierze').
przyjazny :- trait(przyjazny, 'Czy chcesz by zwierze bylo towarzyskie').
gryzon :- trait(gryzon, 'Czy lubisz gryzonie').
latajacy :- trait(latajacy, 'Czy zwierze moze byc latajace').

queryUser(X, Y) :-
	write(Y),
	write('? '),
	read(Reply),
	nl,
	((Reply == yes ; Reply = y) -> asserta(yes(X, Y)) ; asserta(no(X,Y)), fail).

trait(X, Y) :-  (yes(X, Y) -> true ; (no(X, Y) -> fail ; queryUser(X, Y))).

start :- pet(X),
	   write('Najlepszy zwierzak dla ciebie to '), write(X),
	   (retract(yes(_, _)),fail ; retract(no(_, _)),fail).
