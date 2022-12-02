$2 == "X" {
  result +=  1
  if ($1 == "A") {
    result += 3
  }
  if ($1 == "C") {
    result += 6
  }
}

$2 == "Y" {
  result +=  2
  if ($1 == "A") {
    result += 6
  }
  if ($1 == "B") {
    result += 3
  }
}

$2 == "Z" {
  result +=  3
  if ($1 == "B") {
    result += 6
  }
  if ($1 == "C") {
    result += 3
  }
}

END {
  print result
}
