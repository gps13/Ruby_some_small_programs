puts "EventManager Initialized!"
################
# input = File.open("event_attendees.csv", "r")
# puts input.read
################
# if File.exist? "event_attendees.csv"
# 	contents = File.read "event_attendees.csv"
# 	puts contents
# else
# 	puts "no file found"
# end
################
unless File.exist? "event_attendees.csv"
	raise "no file found"
end
################
# contents = File.read "event_attendees.csv"
# puts contents
################
lines = File.readlines "event_attendees.csv"
 # each_with_index assumes that the header row is first row within the file.
lines.each_with_index do |line,index|
	next if index == 0
	puts line.split(",")[2]
	index
end