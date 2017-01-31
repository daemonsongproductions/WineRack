shared_db_env = ENV['DATABASE_URL']

ActiveRecord::Base.establish_connection(
  shared_db_env
)