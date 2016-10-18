require "json"
require "semaphore/net"
require "semaphore/project"

module Semaphore
  module Projects

    extend self

    def all
      Semaphore::Net.get("/api/projects")
    end

    def find(project_id)
      Semaphore::Project.new(project_id)
    end

  end
end
