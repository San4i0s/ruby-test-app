require 'sidekiq-scheduler'

class ProducerJob
  include Sidekiq::Job

  def perform(*args)
    producer = RabbitMq::Producer.new(queue_name)
    
    objects.each do |obj|
      body = { url: obj.url, id: obj.id }
      producer.send_message(body.to_json)
    end
  end

  private

  def objects
    Scraper.publish!
  end

  def queue_name
    YAML.load_file(Rails.root.join('config/sidekiq.yml'))[Rails.env]['rabbitmq']['queue_name']
  end
end
