(defun zapytajUsera (pytanie) ( y-or-n-p pytanie ))

;; Funkcje do sprawdzania cech zwierzatek
(defmacro varnil (global)
	`(defvar ,global nil)
)

(defmacro cecha (nazwa global pytanie) 
	`(defun ,nazwa () 
		( if (eq ,global nil) 
			(setq ,global (if (eq (zapytajUsera ,pytanie) nil) 0 1)) 
			,global)
	)
)

;; Cechy zwierzatek
(varnil *duze*)
(varnil *egzotyczne*)
(varnil *towarzyskie*)
(varnil *latajace*)
(varnil *gryzon*)

;; Lista przechowujaca warunki akceptacji jako dany typ zwierzatka
(varnil warunki)

;; Funkcje do sprawdzania cech zwierzatek
(cecha duze *duze* "Czy masz w domu miejsce na duze zwierze? ")
(cecha towarzyskie *towarzyskie* "Czy chcesz by zwierze bylo towarzyskie? ")
(cecha egzotyczne *egzotyczne* "Czy lubisz egzotyke? ")
(cecha gryzon *gryzon* "Czy lubisz gryzonie? ")
(cecha latajace *latajace* "Czy zwierze moze byc latajace? ")

;; Funkcje do sprawdzania czy któres zwierzatko zostalo udowodnione
(defun Pyton () 	( if (and (eq (duze) 1) (eq (egzotyczne) 1)) "pyton" 0))
(defun Pies () 		( if (and (eq (duze) 1) (eq (egzotyczne) 0) (eq (towarzyskie) 1)) "pies" 0))
(defun Kot () 		( if (and (eq (duze) 1) (eq (egzotyczne) 0) (eq (towarzyskie) 0)) "kot" 0))
(defun Chomik () 	( if (and (eq (duze) 0) (eq (gryzon) 1)) "chomik" 0))
(defun Kanarek () 	( if (and (eq (duze) 0) (eq (gryzon) 0) (eq (latajace) 1)) "kanarek" 0))
(defun Rybki () 	( if (and (eq (duze) 0) (eq (gryzon) 0) (eq (latajace) 0)) "rybki" 0))

(defun sprawdzWarunki () 
	(dolist (war warunki) (if (not(eq (funcall war) 0)) 
		(format t "Twoje wymarzone zwierzatko to ~a." (funcall war)) nil)
	)
)

(defun inicjalizuj ()
	(progn
		(setq warunki (list #'Pyton #'Pies #'Kot #'Chomik #'Kanarek #'Rybki))
		(setq *duze* 		nil)
		(setq *egzotyczne* 	nil)
		(setq *towarzyskie* nil)
		(setq *gryzon* 		nil)
		(setq *latajace* 	nil)
	)
)

(defun start () 
	(progn
		(inicjalizuj)
		(sprawdzWarunki)
	)
)
