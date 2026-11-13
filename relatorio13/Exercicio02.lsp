(defstruct criatura
  nome
  bioma
  profundidade
  perigo)


(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Recife Raso"
                  :profundidade 20 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Algas"
                  :profundidade 80 :perigo :agressiva)
   (make-criatura :nome "Crabsquid" :bioma "Cavernas Cogumelo"
                  :profundidade 300 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunas"
                  :profundidade 250 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Vazio"
                  :profundidade 600 :perigo :leviata)))


(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))


(defun descreve-criatura (c)
  (format nil "~a - ~a - ~am - ~a"
          (criatura-nome c) (criatura-bioma c)
          (criatura-profundidade c) (texto-do-perigo (criatura-perigo c))))


(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))


(defun main ()
  (format t "--- Scanner de 4546B ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (format t "--- Abaixo de 200m ---~%")
  (dolist (texto (mapcar #'descreve-criatura (abaixo-de 200 *catalogo*)))
    (format t "~a~%" texto))

  (format t "Criaturas abaixo de 200m: ~a~%" (length (abaixo-de 200 *catalogo*))))


(main)
