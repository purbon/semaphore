require "json"

module Semaphore
  module Default

    def events
      response = conn.get do |req|
        req.url "/api/events"
        req.headers['Cookie'] = Semaphore.configuration.key
      end
      JSON.parse(response.body)
    end

  end
end
