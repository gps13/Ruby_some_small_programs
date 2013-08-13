require "csv"
puts "EventManager Initialized!"

unless File.exist? "event_attendees.csv"
	raise "no file found"
end
################
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
	puts "#{row[:first_name]} #{row[:zipcode]}"
end