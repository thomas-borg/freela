class CreateCollaborations < ActiveRecord::Migration[7.1]
  def change
    create_table :collaborations do |t|
      t.boolean :accepted
      t.references :project, null: false, foreign_key: true, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
