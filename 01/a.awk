$0 == "" {
  if (c > result) {
    result = c
  }

  c = 0
}

$0 != "" {
  c = c + $1
}

END {
  print result
}
