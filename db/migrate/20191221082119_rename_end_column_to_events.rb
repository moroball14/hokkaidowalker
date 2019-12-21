class RenameEndColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :end, :end_on
  end
end
