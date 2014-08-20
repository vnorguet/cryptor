require 'logger'

module Loggable
  def log_level (level = Logger::DEBUG)
    @level = level
  end

  def logger
    @logger ||= Logger.new($stdout)
    @logger.level = @level || Logger::DEBUG
    @logger
  end
end
