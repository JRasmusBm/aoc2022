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
  key_length = 14
  for (k = 0; k < length && !done; k++) {
    window = substr($0, k , key_length)
    if (allUnique(window) == 1) {
      print k - 1 + key_length
      break
    }
  }
}
