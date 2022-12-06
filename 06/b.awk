function allUnique(v) {
  for (i = 1; i <= length(v); i++) {
    for (j = i - 1; j >= 1; j--) {
      if (substr(v, i, 1) == substr(v, j, 1))  {
        return 0
      }
    }
  }
  return 1
}

{
  for (k = 0; k < length && !done; k++) {
    window = substr($0, k , 14)
    if (allUnique(window) == 1) {
      print k + 13
      break
    }
  }
}
