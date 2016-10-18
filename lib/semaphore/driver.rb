require "faraday"
require "semaphore/configuration"

module Semaphore
  module Driver

    def conn
      @conn ||=Faraday.new(:url => Semaphore.configuration.host) do |faraday|
        faraday.request  :url_encoded
        #faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

  end
end
