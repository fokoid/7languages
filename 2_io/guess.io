guesser := Object clone
guesser max := 100
guesser target := Random value(1, guesser max) round
guesser lastScore ::= guesser max
guesser guess := method(n,
  (n == target) ifTrue("You got it!" println; return true)
  score := (target - n) abs
  if(score < lastScore) then("Hotter!" println) elseif(score > lastScore) then("Colder" println) else("What are the chances?" println)
  lastScore = score
  false
)

stdin := File standardInput
maxGuesses := 10

for(i, 0, maxGuesses - 1,
  "Guess a number (#{maxGuesses - i} guesses remaining)." interpolate println
  n := stdin readLine asNumber
  if(guesser guess(n)) then(break)
)

stdin close
