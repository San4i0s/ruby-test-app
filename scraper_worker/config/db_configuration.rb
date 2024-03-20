require 'yaml'
require 'erb'

FREE_DB_CONFIG = YAML.load(ERB.new(File.read(File.expand_path('../database.yml', __FILE__))).result)[ENV['RACK_ENV']]
