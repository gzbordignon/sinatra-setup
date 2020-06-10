ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'


configure :production do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/database')
	ActiveRecord::Base.establish_connection(
	  adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
	  host: db.host,
	  username: db.user,
	  password: db.password,
	  database: db.path[1..-1],
	  encoding: 'utf8'
	)
end