(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro   1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d)
     (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                     (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~a - ~,1f mora" (dominio-nome d) (recompensa-final d)))
                  possiveis)))
    textos))

(defun main ()
  (let ((dominios (list
                   (make-dominio :nome "Jardim dos Ventos" :elemento :anemo
                                 :dificuldade 1 :mora 500)
                   (make-dominio :nome "Caverna das Aguas" :elemento :hydro
                                 :dificuldade 2 :mora 800)
                   (make-dominio :nome "Templo das Chamas" :elemento :pyro
                                 :dificuldade 3 :mora 900)
                   (make-dominio :nome "Santuario do Trovao" :elemento :electro
                                 :dificuldade 4 :mora 1000)
                   (make-dominio :nome "Cripta do Gelo" :elemento :cryo
                                 :dificuldade 5 :mora 1200))))
    (format t "--- Rota ate dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "--- Total de mora ---~%")
    (format t "Total da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (first dominios))))
      (setf (dominio-mora copia) 9999)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (first dominios))))))

(main)
