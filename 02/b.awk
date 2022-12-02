$2 == "X" {
  if ($1 == "A") {
    result += 3
  }
  if ($1 == "B") {
    result += 1
  }
  if ($1 == "C") {
    result += 2
  }
}

$2 == "Y" {
  result +=  3
  if ($1 == "A") {
    result += 1
  }
  if ($1 == "B") {
    result += 2
  }
  if ($1 == "C") {
    result += 3
  }
}

$2 == "Z" {
  result += 6
  if ($1 == "A") {
    result += 2
  }
  if ($1 == "B") {
    result += 3
  }
  if ($1 == "C") {
    result += 1
  }
}


END {
  print result
}
