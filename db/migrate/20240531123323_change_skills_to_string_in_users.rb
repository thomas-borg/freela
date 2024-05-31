class ChangeSkillsToStringInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :skills
    add_column :users, :skills, :string
  end
end
