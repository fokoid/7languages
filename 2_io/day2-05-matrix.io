Matrix := Object clone
Matrix _data := nil

Matrix dim := method(m, n,
  matrix := self clone

  data := List clone
  m repeat(
    row := List clone
    n repeat(row append(0))
    data append(row)
  )
  matrix _data = data
  matrix
)

Matrix numRows := method(_data size)
Matrix numCols := method(_data at(0) size)

Matrix get := method(i, j, _data at(i) at(j))
Matrix set := method(i, j, x, _data at(i) atPut(j, x))
Matrix transpose := method(
  result := dim(numCols, numRows)
  for(i, 0, numCols - 1,
    for(j, 0, numRows - 1,
      result set(i, j, get(j, i))
    )
  )
  result
)

Matrix == := method(other,
  for(i, 0, numRows - 1,
    for(j, 0, numCols - 1,
      (get(i, j) != other get(i, j)) ifTrue(return false)
    )
  )
  return true
)

Matrix copy := method(
  new := dim(numRows, numCols)
  for(i, 0, numRows - 1,
    for(j, 0, numCols - 1,
      new set(i, j, get(i, j))
    )
  )
  new
)

Matrix dump := method(path,
  f := File with(path) openForAppending
  f write(_data map(join(",")) join(";"))
  f close
)

Matrix load := method(path,
  matrix := self clone
  f := File with(path) openForReading
  matrix _data = f readLine split(";") map(split(",")) map(map(asNumber))
  matrix
)

m1 := Matrix dim(2, 2)
m1 set(0, 0, 4)
m1 set(1, 1, 5)
m1t := m1 transpose

m2 := Matrix dim(2, 2)
m2 set(0, 1, 5)
m2 set(1, 0, 4)
m2t := m2 transpose

writeln("m1 is symmetric: ", m1, "m1 == m1t = ", m1 == m1t)
writeln("m2 is not symmetric: ", m2, "m2 == m2t = ", m2 == m2t)