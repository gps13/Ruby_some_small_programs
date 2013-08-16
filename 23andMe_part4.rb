require 'rest-client'
require 'json'

base_url = "https://api.23andme.com/1/demo"
token = "fdab6a6892b198e40c2484bf2121f761"
headers = {Authorization: "Bearer #{token}"}

response = RestClient.get base_url + "/risks/", headers=headers
data = JSON.load response

risks = data[0]["risks"]
risks.each { 
	|risk|
    # Fill out the code below
    formatted_risk = "%.1f" % (risk["risk"] * 100)
    puts "#{risk['description']}: #{formatted_risk}%"
}