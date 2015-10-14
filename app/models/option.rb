class Option < ActiveRecord::Base
  belongs_to :stock

  enum option_type: [:put, :call]

  def to_s
    "type: #{option_type}
stock: #{stock.name},
strike_price: #{strike_price},
contract_name: #{contract_name},
last: #{last},
bid: #{bid},
ask: #{ask},
change: #{change},
percent_change: #{percent_change},
volume: #{volume},
open_interest: #{open_interest},
implied_volatility: #{implied_volatility}"
  end
end
