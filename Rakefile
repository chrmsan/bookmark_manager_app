require 'data_mapper'
require './lib/my_app.rb'

namespace :db do
	desc "Non destructive upgrade"
	task :auto_upgrade do
		DataMapper.auto_upgrade!
		puts "Auto-upgrade complete (no data loss)"
	end

	task :auto_migrate do
		DataMapper.auto_migrate!
		puts "Auto-migrate complete (data was lost)"
	end

end