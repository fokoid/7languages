# highly random
target := 63

lastGuess := nil
won := false
for(i, 0, 10,
  guess := File standardInput readLine asNumber
  if (guess == target) then (won = true; break)
  if (lastGuess) then(if((target - guess) abs < (target - lastGuess) abs, "warmer", "colder") println)
  lastGuess = guess
)
if (won, "Well done, you got it in #{i + 1} guesses!" interpolate, "You're out of guesses. Better luck next time!") println