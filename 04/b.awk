($1>=$3&&$1<=$4)||($2>=$3&&$2<=$4)||($3>=$1&&$3<=$2)||($4>=$1&&$4<=$2){r+=1}END{print r}