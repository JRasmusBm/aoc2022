main = do
  contents <- getContents
  print contents

split :: Char -> String -> [String]
split sep xs = case (==sep) xs do
  ("", xs) -> xs
