List myAverage := method(
  (size == 0) ifTrue(return nil)
  map(type) map(=="Number") reduce(and) ifFalse(Exception raise("list elements must be numbers"))
  sum / size
)
