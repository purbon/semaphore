module Semaphore

  class << self
    attr_accessor :configuration
  end

  def self.configure(&block)
    self.configuration ||= Configuration.new
    block.call(configuration) if block_given?
  end

  class Configuration
    attr_accessor :host, :key

    def initialize
      @host = "http://localhost:3000"
      @key  = nil
    end
  end

end
