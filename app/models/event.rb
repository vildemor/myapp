class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5}


def self.search(search)
  where("title LIKE ? OR text LIKE ?", "%#{search}%", "%#{search}%")
end

end

