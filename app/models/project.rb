class Project < ApplicationRecord
  belongs_to :user

  has_many :collaborations
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 60, maximum: 960}
  validates :skill, presence: true, inclusion: { in: ['Front-End Developer', 'Back-End Developer', 'Full Stack Developer', 'UX/UI Designer', 'Graphic Designer'] }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :skill, :description ],
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }
end
