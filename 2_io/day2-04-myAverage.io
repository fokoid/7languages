List myAverage := method(xs, if (size == 0, nil, sum / size))

xss := list(list(1, 2, 3), list(), list(1, 2, "a"), list("a", "b", "c"))
xss foreach(xs, writeln("The average of ", xs, " is ", xs myAverage))