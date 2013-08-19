require "csv"
require 'sunlight/congress'
require 'erb'

puts "EventManager Initialized!"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

unless File.exist? "event_attendees.csv"
	raise "no file found"
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

# REFACTOR
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end
################
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
	id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/thanks_#{id}.html"
  File.open(filename,'w') do |file|
    file.puts form_letter
  end

  puts form_letter
end