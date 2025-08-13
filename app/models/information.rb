class Information < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  before_create :generate_key

  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :main, presence: true, uniqueness: true, length: { minimum: 10 }


  pg_search_scope :search_by_title_and_user_id,
                  against: [ :title, :user_id ],
                  using: {
                    tsearch: { prefix: true, any_word: true }  # prefix allows partial matches
                  }


  private

  def generate_key
  special_chars = [ "!", "@", "#", "$", "%", "^", "&", "*" ]
  self.key = SecureRandom.alphanumeric(2) + special_chars.sample + SecureRandom.alphanumeric(5)
  end
end
