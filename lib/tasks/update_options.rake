task :update_options => :environment do
  Stock.find_each do |s|
     Rake::Task['update_option'].reenable
    Rake::Task['update_option'].invoke(s.ticker)
  end
end
