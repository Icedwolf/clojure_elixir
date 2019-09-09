(ns fibonacci)

(defn compute
  [n]
  (cond 
    (= n 0) 0
    (= n 1) 1
    :else (+ (compute (- n 1))
             (compute (- n 2)))))
(println (fibonacci/compute 25))
