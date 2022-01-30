class Category < ApplicationRecord
  has_many :ideas, dependent: :destroy

  validates_presence_of :name
  validates :name, uniqueness: true
end
