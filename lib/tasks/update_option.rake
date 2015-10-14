require 'nokogiri'
require 'open-uri'

task :update_option, [:ticker] => :environment do |t, args|
  stock = Stock.find_by(ticker: args[:ticker])
  ticker = stock.ticker

  doc = Nokogiri::HTML(open("http://finance.yahoo.com/q/op?s=#{ticker}"))

  expiration_time_seconds = doc.xpath("//*[contains(@id, 'options_menu')]//option[1]/@value").to_s.to_i

  old_count = Option.count
  create_options_for_xpath(stock, doc, "//*[contains(@id, 'optionsCallsTable')]//tbody/tr", Option.option_types[:call], expiration_time_seconds)
  create_options_for_xpath(stock, doc, "//*[contains(@id, 'optionsPutsTable')]//tbody/tr", Option.option_types[:put], expiration_time_seconds)
  new_count = Option.count
  puts "Created #{new_count - old_count} options for #{stock.name}"


end

def create_options_for_xpath(stock, doc, xpath, type, expiration_time_seconds)
  rows = doc.xpath(xpath)
  rows.collect do |row|
    strike_price = row.at_xpath("td[1]/strong/a/text()").to_s
    contract_name = row.at_xpath("td[2]/*/a/text()").to_s
    last = row.at_xpath("td[3]/div/text()").to_s
    bid = row.at_xpath("td[4]/div/text()").to_s
    ask = row.at_xpath("td[5]/div/text()").to_s
    change = row.at_xpath("td[6]/div/text()").to_s
    percent_change = row.at_xpath("td[7]/div/text()").to_s.sub!('%', '')
    volume = row.at_xpath("td[8]/strong/text()").to_s
    open_interest = row.at_xpath("td[9]/div/text()").to_s
    implied_volatility = row.at_xpath("td[10]/div/text()").to_s.sub!('%', '')

    option = Option.new(
      stock: stock,
      strike_price: strike_price,
      contract_name: contract_name,
      last: last,
      bid: bid,
      ask: ask,
      change: change,
      percent_change: percent_change,
      volume: volume,
      open_interest: open_interest,
      implied_volatility: implied_volatility,
      option_type: type,
      expiration_time_seconds: expiration_time_seconds
    )
    option.save!
  end
end