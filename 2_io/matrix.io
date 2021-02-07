MatrixIndexOutOfRange := Exception clone

Matrix := Object clone
Matrix dim := method(m, n,
  self _m := m
  self _n := n
  self _data := List clone
  self _data setSize(m * n)
  self _transpose := false
  self
)

Matrix nRows := method(if(_transpose, _n, _m))
Matrix nCols := method(if(_transpose, _m, _n))

Matrix rangeCheck := method(i, j,
  (1 <= i and i <= nRows) ifFalse(MatrixIndexOutOfRange raise("row index #{i}" interpolate))
  (1 <= j and j <= nCols) ifFalse(MatrixIndexOutOfRange raise("column index #{j}" interpolate))
)

Matrix index := method(i, j,
  rangeCheck(i, j)	
  if(_transpose, (i - 1) * nCols + j - 1, i - 1 + (j - 1) * nRows)
)

Matrix get := method(i, j, _data at(index(i, j)))
Matrix set := method(i, j, x, _data atPut(index(i, j), x))
Matrix transpose := method(self _transpose = _transpose not)

Matrix copy := method(
  // copy matrix; if transposed, copy in transposed orientation
  m := Matrix clone dim(nRows, nCols)
  for(i, 1, nRows, for(j, 1, nCols, m set(i, j, get(i, j))))
  m
)

Matrix toFile := method(filename,
  file := File clone open(filename)
  for(i, 1, nRows, for(j, 1, nCols, file write(get(i, j) asString, ",")); file write("\n"))
  file close
)

Matrix fromFile := method(filename,
  file := File clone openForReading(filename)
  data := file readLines() map(split(","))
  file close
  m := data size
  n := data at(0) size
  data map(size) map(==n) reduce(and) ifFalse(Exception raise("mismatched row sizes"))
  // data is read in row-orientation, so transposing the matrix gives us a shortcut
  m := Matrix clone dim(n, m)
  m transpose
  m _data = data flatten map(asNumber)
  m
)

Matrix == = method(m,
  (nRows == m nRows) ifFalse(return false)
  (nCols == m nCols) ifFalse(return false)
  for(i, 1, nRows, for(j, 1, nCols, (get(i, j) == m get(i, j)) ifFalse(return false)))
  true
)
