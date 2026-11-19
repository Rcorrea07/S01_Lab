(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((mami (make-garota-magica :nome "Mami" :escuridao 30 :bruxas 15))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 4))
         (kyoko (make-garota-magica :nome "Kyoko" :escuridao 45 :bruxas 9))
         (grupo (list mami sayaka kyoko))
         (madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 1))
         (grupo-novo (cons madoka grupo))
         (sayaka-limpa (purifica sayaka 40)))
    (format t "--- Grupo ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Madoka faz o contrato ---~%")
    (format t "Escuridao do grupo antigo: ~a~%" (escuridao-total grupo))
    (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))

    (format t "--- Purificacao da Sayaka ---~%")
    (format t "Escuridao da original: ~a~%" (garota-magica-escuridao sayaka))
    (format t "Escuridao da nova: ~a~%" (garota-magica-escuridao sayaka-limpa))))

(main)
