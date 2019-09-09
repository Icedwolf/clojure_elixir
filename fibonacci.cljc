(ns fibonacci)

(defn compute
  [n]
  (cond 
    (= n 0) 0
    (= n 1) 1
    :else (+ (compute (- n 1))
             (compute (- n 2)))))
(println (time (fibonacci/compute 25)))

(ns fibonacci2)

;defn- = private function
(defn- helper ;recur to tail-call-optimization
  [n]
  (loop [current-index 2 ;p-1
         current-value 1 ;p-2
         previous-value 1] ;p-3
    (if (= n current-index) ;termination clause
      current-value ;return result
      (recur (inc current-index) ;p-1 else recur increase current-index
             (+' current-value previous-value) ;p-2 new current value | '+ cast numbers to clojure.lang.BigInt when necessary 
             current-value)))) ;p-3 old current-value = new previous-value

(defn compute
  [n]
  (cond (= n 0) 0
        (= n 1) 1
        :else (helper n)))
(println (time (fibonacci2/compute 25)))

(ns fibonacciI)

(defn compute
  [n]
  (let [fib (map first (iterate (fn [[a b]] [b (+' a b)]) [0 1]))]
    (nth fib n)))
(println (time (fibonacciI/compute 25)))
