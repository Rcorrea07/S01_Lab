(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a) - ~am de profundidade - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                  :profundidade 15 :perigo :inofensiva)
   (make-criatura :nome "Bone Shark" :bioma "Kelp Forest"
                  :profundidade 50 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunes"
                  :profundidade 120 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Lost River"
                  :profundidade 350 :perigo :leviata)))

(defun main ()
  (format t "--- Catalogo do Scanner ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (format t "--- Abaixo de 100 metros ---~%")
  (dolist (texto (mapcar #'descreve-criatura (abaixo-de 100 *catalogo*)))
    (format t "~a~%" texto))
  (format t "Total: ~a criaturas~%" (length (abaixo-de 100 *catalogo*))))

(main)
