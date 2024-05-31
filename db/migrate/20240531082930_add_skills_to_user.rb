class AddSkillsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :skills, :string, array: true, default: []
  end
end
