class RemoveBookedFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :booked, :integer
  end
end
