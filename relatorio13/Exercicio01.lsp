(defstruct erva
  nome
  preco-por-grama
  toxicidade)


(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))


(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))


(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva) (erva-preco-por-grama erva) (classifica-erva erva)))


(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar a erva em si mesma antes."
      "Liberada para o paciente."))


(defun main ()
  (let* ((camomila (make-erva :nome "Camomila" :preco-por-grama 0.5 :toxicidade 1))
         (datura   (make-erva :nome "Datura" :preco-por-grama 2.75 :toxicidade 5))
         (aconito  (make-erva :nome "Aconito" :preco-por-grama 8.0 :toxicidade 9))
         (ervas    (list camomila datura aconito)))

    (format t "--- Estoque da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "  ~a~%" (aviso e)))

    (format t "--- Dose de Datura ---~%")
    (format t "15 gramas: R$~,2f~%" (preco-da-dose datura 15))))


(main)
