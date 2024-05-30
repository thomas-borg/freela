class RenameProjectskillToSkill < ActiveRecord::Migration[7.1]
  def change
    rename_column(:projects, :skill, :skill)
  end
end
