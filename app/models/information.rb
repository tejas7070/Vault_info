require "active_support/message_encryptor"

class Information < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  before_create :generate_key


  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :main, presence: true, length: { minimum: 10 }

  pg_search_scope :search_by_title_and_user_id,
                  against: [ :title, :user_id ],
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }

  # Encrypt before saving
  # def encrypt_main
  #   cipher = ActiveSupport::MessageEncryptor.new(derive_encryption_key(self.key))
  #   self.main = cipher.encrypt_and_sign(self.main)
  # end

  # def decrypt_main()
  #   begin
  #     crypt = ActiveSupport::MessageEncryptor.new([encrypt_main].pack("H*"))
  #     crypt.decrypt_and_verify(self.main_encrypted)
  #   rescue
  #     nil # wrong key or tampered data
  #   end
  # end

  private

  def generate_key
    special_chars = [ "!", "@", "#", "$", "%", "^", "&", "*" ]
    self.key = SecureRandom.alphanumeric(2) + special_chars.sample + SecureRandom.alphanumeric(5)
  end

  # def derive_encryption_key(raw_key)
  #   Digest::SHA256.digest(raw_key) # Derives 256-bit encryption key
  # end
end
