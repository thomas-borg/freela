class RenameProjectSkillsToSkill < ActiveRecord::Migration[7.1]
  def change
    rename_column(:projects, :skills, :skill)
  end
end
