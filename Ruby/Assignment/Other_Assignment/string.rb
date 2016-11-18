puts "Enter string"
org_str = gets.to_s
#org_str = "min12$%^&*()_-+=checkk"
string = org_str.gsub(/[A-Za-z0-9]/,' ')

string_1 = org_str.scan(/[A-Za-z0-9]/)

string_2 = string_1.reverse
length = string_2.length
	#for j in length-1..0
#			while length >= 0
# 					if ( org_str[i] =~ /[A-Za-z0-9]/ && org_str[length] =~ /[A-Za-z0-9]/ )
#						temp = org_str[i]
#						org_str[length-i] = org_str[i]
#						org_str[i] = temp						
#					end
# 				length=length-1
#  				break
#			end
# 		end
#	end
for i in 0...length
	str = string_2[i]
	string.sub!(" ",str)
	#str.gsub!(" ") { |str| block }
end
puts "\n"
print string
