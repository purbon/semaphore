require "json"
require "semaphore/net"

module Semaphore
  class Project

    attr_reader :project_id

    def initialize(project_id)
      @project_id = project_id
    end

    def run_task(task_id)
      body = { "template_id" => task_id }
      response = Semaphore::Net.post("/api/project/#{project_id}/tasks", body)
      response.status
    end

    def templates
      Semaphore::Net.get("/api/project/#{project_id}/templates")
    end

  end
end
