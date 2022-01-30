class Category < ApplicationRecord
  has_many :ideas, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end