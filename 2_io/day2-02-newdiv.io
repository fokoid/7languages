writeln("Before change, 5 / 0 = ", 5 / 0)

Number real_div := Number getSlot("/")
Number / = method(denominator, if(denominator == 0, 0, real_div(denominator)))

writeln("After change, 5 / 0 = ", 5 / 0)