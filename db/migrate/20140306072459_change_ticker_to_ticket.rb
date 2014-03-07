class ChangeTickerToTicket < ActiveRecord::Migration
  def change
    rename_column :stubs, :ticker_id, :ticket_id
  end
end
