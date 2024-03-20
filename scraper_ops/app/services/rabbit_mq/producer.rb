require 'bunny'
require 'yaml'

class RabbitMq::Producer
  attr_accessor :queue_name

  def initialize(queue_name)
    @queue_name = queue_name
    load_config
  end

  def send_message(message)
    channel = connection.create_channel
    queue = channel.queue(queue_name, durable: true)

    queue.publish(message, persistent: true)
    puts " [x] Sent #{message}"
  end

  private

  def load_config
    path = Rails.root.join('config', 'rabbitmq.yml')
    @config ||= YAML.load_file(path)[Rails.env]
  end

  def connection
    @connection ||= Bunny.new(@config).tap { |c| c.start }
  end
end
