class Project < ApplicationRecord
  belongs_to :user

  has_many :collaborations
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 60, maximum: 240}
  validates :skill, presence: true, inclusion: { in: ['Front-End Developer', 'Back-End Developer', 'Full Stack Developer', 'UX/UI Designer', 'Graphic Designer'] }
end
