class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title,       presence: true
  validates :catch_copy,  presence: true
  validates :concept,     presence: true
  validates :image,       presence: true
end
