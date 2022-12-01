$0 == "" {
  if (current > a) {
    temp = a
    a = current
    current = temp
  }

  if (current > b) {
    temp = b
    b = current
    current = temp
  }

  if (current > c) {
    temp = c
    c = current
    current = temp
  }

  current = 0
}

$0 != "" {
  current = current + $1
}

END {
  print a +b + c
}
