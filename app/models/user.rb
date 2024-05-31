class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :about, length: {maximum: 480}
  # validates :skills, inclusion: { in: [
  #   'Android',
  #   'iOS',
  #   'HTML',
  #   'CSS',
  #   'JavaScript',
  #   'Ruby',
  #   'Python',
  #   'Java',
  #   'SQL',
  #   'PHP',
  #   'C#',
  #   'C++',
  #   'Swift',
  #   'Kotlin',
  #   'TypeScript',
  #   'Go',
  #   'Rust',
  #   'Dart',
  #   'Objective-C'
  #   ] }
end
