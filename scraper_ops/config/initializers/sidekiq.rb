class SidekiqSetting
  attr_accessor :env

  class << self
    def redis
      new.redis
    end
  end

  def initialize
    @env = Rails.env
  end

  def redis
    host = config('redis')['host']
    port = config('redis')['port']
    db   = config('redis')['db']

    { url: "redis://#{host}:#{port}/#{db}" }
  end

  private

  def config(type)
    file_path[env][type]
  end

  def file_path
    YAML.load_file(Rails.root.join('config/sidekiq.yml'))
  end
end

Sidekiq.configure_server do |config|
  config.redis = SidekiqSetting.redis
end

Sidekiq.configure_client do |config|
  config.redis = SidekiqSetting.redis
end