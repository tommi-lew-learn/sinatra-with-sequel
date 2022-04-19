require 'sinatra'
require 'sequel'

# require dotenv only in development environment
if Sinatra::Application.settings.environment == :development
  require 'dotenv'
  Dotenv.load
end

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/api/heartbeat' do
  'Pong'
end

get '/api/persons' do
  if DB.table_exists?(:persons)
    persons = DB.from(:persons)
    result = persons.all

    if result.size > 0
      result.map { |row| "#{row[:first_name]} #{row[:last_name]}" }
      .join(', ')
    else
      'Populate table and retry'
    end
  
  else
    "Create table and retry"
  end
end

post '/api/create_persons_table' do
  DB.create_table :persons, if_not_exists: true do
    primary_key :id
    text :first_name, null: false
    text :last_name, null: false
  end
end

post '/api/populate_persons_table' do
  persons = DB.from(:persons)
  
  persons.insert(first_name: 'Haiden', last_name: 'Rush')
  persons.insert(first_name: 'Rohan', last_name: 'Swift')
  persons.insert(first_name: 'Elizabeth', last_name: 'Macias')
end

delete '/api/delete_persons_table' do
  DB.drop_table :persons
end
