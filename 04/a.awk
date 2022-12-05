$1 <= $3 && $2 >= $4 {result +=1}
$1 >= $3 && $2 <= $4 {result +=1}
$1 == $3 && $2 == $4 {result -=1}

END {
  print result
}
