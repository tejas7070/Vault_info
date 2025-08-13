require 'openssl'
require 'base64'

class EncryptionService
  ALGO = 'aes-256-gcm'

  def self.encrypt(plaintext, key)
    cipher = OpenSSL::Cipher.new(ALGO)
    cipher.encrypt
    cipher.key = [key].pack("H*")
    iv = cipher.random_iv
    cipher.auth_data = ""

    encrypted = cipher.update(plaintext) + cipher.final
    tag = cipher.auth_tag

    Base64.urlsafe_encode64(iv + tag + encrypted)
  end

  def self.decrypt(encrypted_data, key)
    raw = Base64.urlsafe_decode64(encrypted_data)
    iv = raw[0..11]
    tag = raw[12..27]
    ciphertext = raw[28..-1]

    cipher = OpenSSL::Cipher.new(ALGO)
    cipher.decrypt
    cipher.key = [key].pack("H*")
    cipher.iv = iv
    cipher.auth_tag = tag
    cipher.auth_data = ""

    cipher.update(ciphertext) + cipher.final
  rescue
    nil
  end
end

