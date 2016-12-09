class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :tickets, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5}
  validates :location, presence: true
  validates :category, presence: true
  ratyrate_rateable 'helpfulness', 'relevance', 'host', 'original_score'
def self.search(search)
  where("title LIKE ? OR text LIKE ? OR category LIKE ? OR location LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
end

end

