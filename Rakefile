require 'data_mapper'
require './app/app.rb'

namespace :db do

  desc "Non-destructive update"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts 'Upgrade complete (no data lost)'
  end

  desc "Destructive update"
  task :migrate do
    DataMapper.auto_migrate!
    puts 'Migration complete (terminal data loss)'
  end

end
