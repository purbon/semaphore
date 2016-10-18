require "semaphore/net"

module Semaphore
  module User

    def login(auth, password)
      body = { "auth" => auth, "password" => password }
      response = Semaphore::Net.post("/api/auth/login", body)
      Semaphore.configuration.key = response.headers["set-cookie"] if response.status == 204
      response.status
    end

    def logout
      response = Semaphore::Net.post("/api/auth/logout")
      Semaphore.configuration.key = nil if response.status == 204
      response.status
    end

    def tokens
      Semaphore::Net.get("/api/user/tokens")
    end

    def users
      Semaphore::Net.get("/api/users")
    end

  end
end
