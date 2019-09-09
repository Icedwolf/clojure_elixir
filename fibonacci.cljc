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
  (let ;local bind
    [fib ;map result to this
     (map
       first ; (0 1 1 2) get only the first element of each list gen. by iterate
       (iterate ;([0 1] [1 1] [1 2] [2 3]) lazy evalueted 
                  (fn [[a b]] [b (+' a b)]) [0 1]))] ;lambda for creating the lazy eval. list
    (nth fib n))) ;calculate the position of our lazy list to retrieve which will be equals to the arg of the func
(println (time (fibonacciI/compute 25)))
