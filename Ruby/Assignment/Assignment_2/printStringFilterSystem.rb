doctor_map = "One: William Hartnell
Two:Patrick Troughton
Three:: Jon Pertwee
Four: Tom Baker (longest run)
5: Peter Davison
six: Colin Baker
Seven:   Sylvester McCoy
Eight: Paul McGann
Nine: Christopher Eccleston *series reboot*
Ten: David Tennant <- personal fav
Eleven: Matthew Robert Smith - the current doctor "

puts doctor_map
puts "_______________________________"

doctor = doctor_map.scan(/([\w\d]+)[:]*+([\s\w\d(\*\<\-)\s])/)


	puts "Enter the array index"
	index_one = gets.to_i
	index_two = gets.to_i
	puts "doctor[#{index_one}][#{index_two}] " +doctor[index_one][index_two]
#puts doctor

