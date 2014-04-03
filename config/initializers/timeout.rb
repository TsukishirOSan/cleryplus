RACK_TIMEOUT = Integer(ENV['RACK_TIMEOUT'] || 15)
Rails.logger.info("Setting Rack::Timeout.timeout = #{RACK_TIMEOUT}")
Rack::Timeout.timeout = RACK_TIMEOUT  # seconds
