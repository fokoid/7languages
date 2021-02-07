fib := Object clone

fib cache := list(0, 1)
fib compute := method(n, if(n >= cache size, m := compute(n-1) + compute(n-2); cache append(m)); cache at(n))
fib compute_loop := method(n, a := 0; b := 1; for(i, 1, n, c := a + b; a = b; b = c); a)
