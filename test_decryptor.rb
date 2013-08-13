require 'openssl'
require 'Base64'
require 'digest/sha1'
require 'digest/sha2'
data = "Very, very confidential data"

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

encrypted = cipher.update(data) + cipher.final
...
decipher = OpenSSL::Cipher::AES.new(128, :CBC)
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final

puts data == plain #=> true
key = key = Digest::SHA2.hexdigest("skroutz")

# aes.encrypt
# aes.key = key
# encrypted_text= aes.update(payload) + aes.final

# puts encrypted_text
encrypted_text = "P03N18212427F11V22H15E011016232629I081725R13A02T14Z09G07C1928O04061220W00L05"
aes.decrypt
aes.key = key
puts aes.update(encrypted_text) + aes.final
# encrypt
# your pass is what is used to encrypt/decrypt
# key = key = Digest::SHA1.hexdigest("skroutz")
 
# decipher = OpenSSL::Cipher.new('AES-128-CBC')
# decipher.decrypt
# encrypted_text = "P03N18212427F11V22H15E011016232629I081725R13A02T14Z09G07C1928O04061220W00L05"
# # decipher.key = "P03N18212427F11V22H15E011016232629I081725R13A02T14Z09G07C1928O04061220W00L05"
# plain = decipher.update(Base64.decode64(encrypted_text))
# plain << decipher.final

# puts plain