NR == 1 {
  ntrays =  (length + 1) / 4;
  id = 1 
}

/\[/, !/\[/ {
  for (i = 0; i <= length; i++) {
    char = substr($0, i, 1)
    if (char ~ /[A-Z]/) {
      id++
      items[id] = char
      tray = int(i / 4) + 1
      if (trays[tray] == "") {
        trays[tray] = id
      } else {
      bottom = trays[tray]
      while (links[bottom] != "") {
        bottom = links[bottom]
      }
      links[bottom] = id
    }
  }
}
  }

  $1 == "move" {
    first = trays[$4]
    last = trays[$4]
    for (i = 0; i < $2 - 1; i++) {
      last = links[last]
    }
    trays[$4] = links[last]
    top = trays[$6]
    trays[$6] = first
    links[last] = top
}

END { 
    for (tray = 1; tray <= ntrays; tray++) {
      out = out items[trays[tray]]
      # out = ""
      # current= trays[tray]
      # while (current != "") {
      #   out = out " " items[current]
      #   current = links[current]
      # }
      # print out
    }
    print out
  }

