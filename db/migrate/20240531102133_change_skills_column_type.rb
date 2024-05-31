class ChangeSkillsColumnType < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :skills
    add_column :users, :skills, :string, array: true, default: []
  end
end
