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
    def encrypt_file(filename,rotation)
      file_to_encrypt = File.open(filename, "r")  #Create the file handle to the input file
      content = file_to_encrypt.read                #Read the text of the input file
      file_to_encrypt.close
      results = encrypt(content,rotation)                    #Encrypt the text
      encrypted_file = File.open("#{filename}.encrypted", "w")    #Create a name for the output file & an output file handle
      encrypted_file.write(results)      #Write out the text
      encrypted_file.close      #Close the file
    end
    def decrypt_file(filename,rotation)
      file_to_decrypt = File.open(filename, "r")  #Create the file handle to the encrypted file
      content = file_to_decrypt.read                #Read the encrypted text
      file_to_decrypt.close
      results = decrypt(content,rotation)                    #Decrypt the text by passing in the text and rotation
      decrypted_file = File.open("#{filename}.decrypted", "w")    #Create a name for the decrypted file & an output file handle
      # OR    decrypted_file = filename.gsub("encrypted", "decrypted")  -- alternate gsub methos for filename
      decrypted_file.write(results)      #Write out the text
      decrypted_file.close      #Close the file
    end

    # CONINUE OF http://tutorials.jumpstartlab.com/projects/encryptor.html
    # Cracking Encryption
  	# def encrypt(string)
  	# 	results =[]
  	# 	letters = string.split("")
  	# 	letters.each do |letter|
  	# 		results << encrypt_letter(letter)
  	# 	end
  	# 	results.join
  	# end
end