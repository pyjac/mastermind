file

open('myfile.out', 'a') do |f|
  f.puts "Hello, world."
end


open('myfile.out', 'a') { |f|
  f << "Four score\n"
  f << "and seven\n"
  f << "years ago\n"
}