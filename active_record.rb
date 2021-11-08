require "pry"
require "active_record"

# Setup a database connection
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  # the database symbol is LITERALLY pointing to the file for our database,
  # which lives in the db folder and is named students.sqlite
  database: "db/students.sqlite"
)

# Create a Students table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have the Student class inherit from ActiveRecord::Base
class Student < ActiveRecord::Base
end

binding.pry
""
