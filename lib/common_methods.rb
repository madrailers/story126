def random_string(length=126)
  (1..length).inject(""){|sum,c|sum+(rand(122-97)+97).chr}
end