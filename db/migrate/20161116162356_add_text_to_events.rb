class AddTextToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :text, :string
  end
end
