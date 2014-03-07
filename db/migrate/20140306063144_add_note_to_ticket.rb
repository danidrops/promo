class AddNoteToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :note, :string
  end
end
