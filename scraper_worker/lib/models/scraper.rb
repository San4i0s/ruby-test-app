require 'rubygems'
require 'active_record'

class Scraper < ActiveRecord::Base
  enum state: %i[
    opening
    processing
    completed
    failed
  ]
end
