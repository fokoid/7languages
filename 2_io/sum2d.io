// modified sum which returns 0 not nil on empty list and errors on non numbers
List sum1d := method(if(size == 0, 0, sum))

sum2d := method(xss,
  // determine summation error message
  errorMessage := try(list(1, "1") sum1d) error
  e := try(
    result := xss map(sum1d) sum1d
  )
  e catch (Exception,
    if(
      e error == errorMessage,
      Exception raise("list entries must be numbers"),
      e pass
    )
  )
  result
);
