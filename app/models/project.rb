class Project < ApplicationRecord
  belongs_to :user

  has_many :collaborations
  validates :name, presence: true
  validates :description, presence: true
end
