;; Cechy zwierzatek
(defvar *duze* nil)
(defvar *egzotyczne* nil)
(defvar *towarzyskie* nil)
(defvar *latajace* nil)
(defvar *gryzon* nil)

(defvar warunki nil)

;; Funkcje do sprawdzania cech zwierzatek
(defun duze () 			( if (eq *duze* nil)  
	(setq *duze* (if (eq (zapytajUsera "Czy masz w domu miejsce na duze zwierze?: ") nil) 0 1))
	*duze* ))
(defun egzotyczne () 	( if (eq *egzotyczne* nil)  
	(setq *egzotyczne* (if (eq (zapytajUsera "Czy lubisz egzotyke?: ") nil) 0 1))
	*egzotyczne* ))
(defun towarzyskie () 		( if (eq *towarzyskie* nil)  
	(setq *towarzyskie* (if (eq (zapytajUsera "Czy chcesz by zwierze bylo towarzyskie?: ") nil) 0 1))
	*towarzyskie* ))
(defun gryzon () 		( if (eq *gryzon* nil)  
	(setq *gryzon* (if (eq (zapytajUsera "Czy lubisz gryzonie?: ") nil) 0 1))
	*gryzon* ))
(defun latajace () 		( if (eq *latajace* nil)  
	(setq *latajace* (if (eq (zapytajUsera "Czy zwierze moze byc latajace?: ") nil) 0 1))
	*latajace* ))

;; Funkcje do sprawdzania czy któres zwierzatko zostalo udowodnione
(defun Pyton () 		( if (and (eq (duze) 1) (eq (egzotyczne) 1)) "pyton" 0))
(defun Pies () 		( if (and (eq (duze) 1) (eq (egzotyczne) 0) (eq (towarzyskie) 1)) "pies" 0))
(defun Kot () 		( if (and (eq (duze) 1) (eq (egzotyczne) 0) (eq (towarzyskie) 0)) "kot" 0))
(defun Chomik () 	( if (and (eq (duze) 0) (eq (gryzon) 1)) "chomik" 0))
(defun Kanarek () 	( if (and (eq (duze) 0) (eq (gryzon) 0) (eq (latajace) 1)) "kanarek" 0))
(defun Rybki () 		( if (and (eq (duze) 0) (eq (gryzon) 0) (eq (latajace) 0)) "rybki" 0))

(setq warunki (list #'Pyton #'Pies #'Kot #'Chomik #'Kanarek #'Rybki))

(defun sprawdzWarunki () 
	(dolist (war warunki) (if (not(eq (funcall war) 0)) 
		(format t "Twoim wymarzonym zwierzatkiem jest ~a." (funcall war)) nil)))

(defun zapytajUsera (pytanie) ( y-or-n-p pytanie ))