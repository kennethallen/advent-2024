sed "s/$1/$2/g" "lib/day$1.rb" > "lib/day$2.rb"
sed "s/$1/$2/g" "test/test_day$1.rb" > "test/test_day$2.rb"
