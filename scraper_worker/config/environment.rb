# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require(:default)

require_relative "environments/#{ENV['RACK_ENV']}"

# Load application.
require File.expand_path('../application', __FILE__)

# database.yml
ActiveRecord::Base.establish_connection(FREE_DB_CONFIG)
ActiveRecord::Base.logger = Logger.new(STDOUT) unless %w[test development].include? ENV['RACK_ENV']

require 'sneakers/metrics/logging_metrics'
Sneakers.configure metrics: Sneakers::Metrics::LoggingMetrics.new

Sneakers.logger.level = Logger::DEBUG

# mq.yml
Sneakers.configure(
  amqp:            MqConfiguration.amqp,
  vhost:           MqConfiguration.vhost,
  exchange:        MqConfiguration.exchange,
  exchange_type:   MqConfiguration.exchange_type,
  heartbeat:       MqConfiguration.heartbeat,
  ack:             MqConfiguration.ack,
  prefetch:        MqConfiguration.prefetch,
  durable:         MqConfiguration.durable,
  daemonize:       MqConfiguration.daemonize,
  retry_max_times: MqConfiguration.retry_max_times,
  retry_timeout:   MqConfiguration.retry_timeout,
  threads:         MqConfiguration.threads,
  workers:         MqConfiguration.workers,
  log:             MqConfiguration.log,
  pid_path:        MqConfiguration.pid_path,
  timeout_job_after: MqConfiguration.timeout_job_after
)
