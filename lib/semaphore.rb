require "semaphore/version"
require "semaphore/net"
require "semaphore/user"
require "semaphore/default"
require "semaphore/projects"

module Semaphore

  extend Semaphore::Driver
  extend Semaphore::User
  extend Semaphore::Default

  def self.logged?
    !Semaphore.configuration.key.nil?
  end
end
