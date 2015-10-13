class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.decimal :strile_price
      t.string :contract_name
      t.decimal :last
      t.decimal :bid
      t.decimal :ask
      t.decimal :change
      t.decimal :percent_change
      t.integer :volume
      t.integer :open_interest
      t.decimal :implied_volatility

      t.timestamps null: false
    end
  end
end
