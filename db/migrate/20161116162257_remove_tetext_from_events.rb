class RemoveTetextFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :tetext, :string
  end
end
