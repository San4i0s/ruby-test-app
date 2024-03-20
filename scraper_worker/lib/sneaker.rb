# frozen_string_literal: true

require_relative '../config/environment.rb'

class Processor
  include Sneakers::Worker
  from_queue MqConfiguration.queue_subscribe

  # Need only for tests to call #work method for class
  delegate :work, to: :class

  def work(msg)
    body = Oj.load(msg)
    
    site = Scraper.find(body['id'])
    site.completed!

    Sneakers.logger.info("\nProcessing url: #{site['url']}\n")
    ack!
  rescue => error
      Sneakers.logger.error("ATTENTION Error: \n\n #{error} \n")
      requeue!
  end
end
