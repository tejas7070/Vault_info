require 'openssl'
require 'base64'

class EncryptionService
  def self.encrypt(data, key)
    key ||= SecureRandom.hex(16) # fallback if nil
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = Digest::SHA256.digest(key)
    iv = cipher.random_iv
    encrypted = cipher.update(data) + cipher.final
    Base64.strict_encode64(iv + encrypted)
  end

  def self.decrypt(encrypted_data, key)
    raw_data = Base64.strict_decode64(encrypted_data)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.decrypt
    cipher.key = Digest::SHA256.digest(key)
    cipher.iv = raw_data[0..15]
    cipher.update(raw_data[16..]) + cipher.final
  rescue
    nil
  end
end
