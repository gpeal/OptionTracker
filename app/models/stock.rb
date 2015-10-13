class Stock < ActiveRecord::Base
  has_many :options

  def ticker=(value)
    write_attribute(:ticker, value.downcase)
  end
end
