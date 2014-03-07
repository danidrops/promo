class CreateStubs < ActiveRecord::Migration
  def change
    create_table :stubs do |t|
      t.string :code
      t.integer :ticker_id

      t.timestamps
    end
  end
end
