class Collaboration < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validate do
    errors.add(:user, "cannot be the owner of the project") if project.user == user
  end
end
