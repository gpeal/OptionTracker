class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.decimal :strike_price
      t.string :contract_name
      t.decimal :last
      t.decimal :bid
      t.decimal :ask
      t.decimal :change
      t.decimal :percent_change
      t.integer :volume
      t.integer :open_interest
      t.decimal :implied_volatility
      t.integer :option_type, default: 0
      t.integer :expiration_time_seconds, default: 0

      t.belongs_to :stock, index: true

      t.timestamps null: false
    end
  end
end
