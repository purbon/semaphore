require "json"
require "semaphore/driver"
require "semaphore/configuration"

module Semaphore
  module Net

    extend Semaphore::Driver
    extend self

    def get(url)
      response = conn.get do |req|
        req.url url
        req.headers['Cookie'] = Semaphore.configuration.key
      end
      JSON.parse(response.body)
    end

    def post(url, body={})
      conn.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.headers['Cookie'] = Semaphore.configuration.key if Semaphore.logged?
        req.body = body.to_json
      end
    end
  end
end
