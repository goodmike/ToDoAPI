class ChangeValueToDescription < ActiveRecord::Migration
  def change
      rename_column :todos, :value, :description
  end
end
