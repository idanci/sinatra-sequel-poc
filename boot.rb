require 'sequel'

Sequel::Model.plugin :json_serializer

DB = Sequel.connect('postgres://localhost/users_api_dev')

Dir[File.expand_path('../models/**/*.rb', __FILE__)].each do |file|
  dirname = File.dirname(file)
  file_basename = File.basename(file, File.extname(file))
  require "#{dirname}/#{file_basename}"
end

require File.expand_path('../api',  __FILE__)
