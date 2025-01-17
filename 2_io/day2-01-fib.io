cache := list(1, 1)
fib_cache := method(n, while(cache size <= n, cache append(cache at(-1) + cache at(-2))); cache at(n))

fib_loop := method(n,
     x := 1
     y := 1
     for(i, 1, n, z := x + y; x = y; y = z)
     x
);

memo := Map clone
memo atPut("0", 1)
memo atPut("1", 1)
fib_rec := method(n,
    key := n asString
    memo hasKey(key) ifFalse(memo atPut(key, fib_rec(n - 1) + fib_rec(n - 2)))
    memo at(key)
)

n := System args at(1) asNumber
writeln(n, "th Fibonacci number");
writeln("  by iteration: ", fib_loop(n))
writeln("  by fib_cache: ", fib_cache(n))
writeln("  by recursion: ", fib_rec(n))
