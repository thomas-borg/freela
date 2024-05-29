class SetCollaborationAcceptedDefault < ActiveRecord::Migration[7.1]
  def change
    change_column :collaborations, :accepted, :boolean, default: false
  end
end
