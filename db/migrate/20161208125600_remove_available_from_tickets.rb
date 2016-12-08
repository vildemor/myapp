class RemoveAvailableFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :available, :integer
  end
end
