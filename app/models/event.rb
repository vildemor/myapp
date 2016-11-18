class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5}
  validates :location, presence: true
  validates :category, presence: true


def self.search(search)
  where("title LIKE ? OR text LIKE ?", "%#{search}%", "%#{search}%")
end

end

