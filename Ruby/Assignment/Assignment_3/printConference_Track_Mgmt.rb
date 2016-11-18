require 'date'
arr = IO.readlines("demo.txt")
#p arr
b = arr.sort_by! { |x| -x[/\d+/].to_i }
puts b.class
array = b.map {|x| x[/\d+/].to_i}
#print c
puts ""
limit = array.length;
for counter in 0...limit
 	if array[counter] == 0;
 			array[counter] = 5;
 	end
end
p array
m_time = Time.local(2016,11,16,9,00,00)
afternoon_time = Time.local(2016,11,16,7,00,00)
puts "Track 1"
i = 0
begin
	puts "#{m_time.strftime("%I:%M%p")} #{b[i]}"
	m_time = m_time + m_time*60
	if m_time.strftime("%I:%M%p") == "12:00PM"
		
	end
	i = i+1
end while true
#puts time
