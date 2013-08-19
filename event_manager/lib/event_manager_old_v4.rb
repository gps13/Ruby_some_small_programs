require "csv"
require 'sunlight/congress'
template_letter = File.read "form_letter.html"
puts "EventManager Initialized!"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

unless File.exist? "event_attendees.csv"
	raise "no file found"
end

# REFACTOR
def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end
################
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol


contents.each do |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)	
	# puts "#{name} #{zipcode} #{legislators}"


# USUAL ARRAY ###################################
# legislator_names = []
# legislators.each do |Legislator|
# 	legislator_name = "#{Legislator.first_name} #{Legislator.last_name}"
# 	legislator_names << legislator_name
# end

	legislator_names = legislators.collect do |legislator|
		"#{legislator.first_name} #{legislator.last_name}"
	end
	legislators_string = legislator_names.join(", ")
	
	puts "#{name} #{zipcode} #{legislators_string}"

end