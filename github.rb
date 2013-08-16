require 'httparty'

token = "e6a75d6b6d7b0fdd0eee93fd3c141d808852a0e9"

user = HTTParty.get "https://api.github.com/user", 
        :headers => { 
                        "Authorization" => "token #{token}",
                        "User-Agent" => "codecademy"    
                    }

puts "Hi, my username is #{user["login"]}"