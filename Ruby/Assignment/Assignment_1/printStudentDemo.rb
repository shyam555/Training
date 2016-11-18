$student_hash = Hash.new
loop do	  
	puts "\n___MENU____"
	puts "1.Add record."
	puts "2.Display records."
	puts "3.Display records in sorted order(by name)."
	puts "4.Display records in sorted order(by grade)."
	puts "5.Search student name, grade wise."
	puts "6.Search student grade, name wise."
	puts "7.Exit."
	puts "-------------\n\n"
	print "Enter option:\t"
	 case gets.to_i
		when 1
			 print "Enter Student Name:\t"
			 sname = gets.chomp
			 sname = sname.downcase
			 print "Enter Grade:\t"
			 sgrade = gets.chomp	
			def mergStudent(input)
			  case input
			  when Hash then $student_hash.merge!(input)
			  end
			end
			mergStudent(sname => sgrade)
			#some_method(sname)
			#puts "#{$some_hash}" 
			 next
		when 2 
				$student_hash.each {|k, v| print k, " ", v, "\n"} 			 
			 next
		
		when 3 
				$student_hash.sort.each do |key, value|
    				# Display the entry.
    				puts key + " " + String(value) 
				end			 
			 next
		when 4 
				result = $student_hash.sort{|x, y| x[1] <=> y[1]}
				result.each do |key, value| 
    			puts key + " " + String(value)
				end		 
			 next 
		when 5
				print "Enter grade:\t"
				pgrade = gets.chomp
				puts $student_hash.map {|k,v| v == pgrade ? k : nil} 	
			 next
		when 6
				print "Enter name:\t"
				pname = gets.chomp
				pname = pname.downcase				
				puts $student_hash.map {|k,v| k == pname ? v : nil}
			 next
		else
			break
	end
break if gets.to_i >= 7
end