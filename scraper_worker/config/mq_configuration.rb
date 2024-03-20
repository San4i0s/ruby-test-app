class MqConfiguration
  DB_CONFIG = YAML.load_file(File.expand_path('../sneakers.yml', __FILE__))[ENV['RACK_ENV']]

  class << self
    def username
      DB_CONFIG['username']
    end

    def password
      DB_CONFIG['password']
    end

    def host
      DB_CONFIG['host']
    end

    def port
      DB_CONFIG['port']
    end

    def max_priority
      DB_CONFIG['max_priority']
    end

    def amqp
      "amqp://#{username}:#{password}@#{host}:#{port}"
    end

    def queue
      DB_CONFIG['queue']
    end

    def queue_subscribe
      queue['subscribe']
    end

    def vhost
      DB_CONFIG['vhost']
    end

    def exchange
      DB_CONFIG['exchange']
    end

    def exchange_type
      DB_CONFIG['exchange_type']
    end

    def heartbeat
      DB_CONFIG['heartbeat']
    end

    def ack
      DB_CONFIG['ack']
    end

    def prefetch
      DB_CONFIG['prefetch']
    end

    def durable
      DB_CONFIG['durable']
    end

    def daemonize
      DB_CONFIG['daemonize']
    end

    def retry_max_times
      DB_CONFIG['retry_max_times']
    end

    def retry_timeout
      DB_CONFIG['retry_timeout']
    end

    def threads
      DB_CONFIG['threads']
    end

    def workers
      DB_CONFIG['workers']
    end

    def log
      DB_CONFIG['log']
    end

    def pid_path
      DB_CONFIG['pid_path']
    end

    def timeout_job_after
      DB_CONFIG['timeout_job_after']
    end
  end
end
