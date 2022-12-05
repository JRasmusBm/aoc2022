NR == 1{ ntrays =  (length + 1) / 4 }
/\[/ {
  for (i = 0; i <= length; i++) {
    char = substr($0, i, 1)
    if (char ~ /[A-Z]/) {
      tray = int(i / 4) + 1
      size =trays[tray"size"]
      trays[tray"size"] += 1
      trays[tray","size] = char
      if (size > maxsize) {
        maxsize = size
      }
      print tray char}
    }
  }

  END { 
    for (row = maxsize; row > 0; row--){
      out = ""
      for (tray = 1; tray <= ntrays; tray++) {
        out = out " " (trays[tray","row] ? trays[tray","row]: " ")
      }
      print out
    }
  }
