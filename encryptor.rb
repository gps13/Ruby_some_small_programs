class Encryptor
	def cipher(rotation)
		chars = (' '..'z').to_a
		rotated_chars = chars.rotate(rotation)
		Hash[chars.zip(rotated_chars)]
  	end
  	def encrypt_letter(letter,rotation)
  		cipher(rotation)[letter]
  	end
  	def decrypt_letter(letter,rotation)
  		cipher(rotation).invert[letter]
  	end
  	def encrypt(string,rotation)
  		letters = string.split("")
  		results = letters.collect {|letter| encrypt_letter(letter,rotation)}
  		results.join
  	end
  	def decrypt(string,rotation)
  		letters = string.split("")
  		results = letters.collect {|letter| decrypt_letter(letter,rotation)}
  		results.join
  	end
  	# def encrypt(string)
  	# 	results =[]
  	# 	letters = string.split("")
  	# 	letters.each do |letter|
  	# 		results << encrypt_letter(letter)
  	# 	end
  	# 	results.join
  	# end
end