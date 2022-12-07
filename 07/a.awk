$1 == "$" && $2 == "ls" {
  delete dir
}

$1 ~ /^[0-9]+$/ {
  dir[$2] = $1
}

$1 == "$" && $2 != "ls" {
  count()
}

$1 == "$" && $2 == "cd" {
  if ($3 == "/") {
    pwd = "/"
  } else if ($3 == "..") {
  gsub(/[^\/]+\/$/, "", pwd)
} else {
pwd = pwd $3 "/"
  }
}

END {
  count()

  result = 0
  for (key in tree) {
    if (tree[key] <= 100000) {
      result += tree[key]
    }
  }

  print result
}

function count() {
  if (!visited[pwd]) {
    sum = 0

    for (key in dir) {
      sum += dir[key]
    }

    path = pwd
    while (path != "") {
      before = tree[path]
      tree[path] += sum
      gsub(/[^\/]*\/$/, "", path)
    }
  }

  visited[pwd] = 1
}
