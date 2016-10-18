require "spec_helper"

describe Semaphore do

  it "log in to a semaphore server" do
    stub_request(:post, "http://localhost:3000/api/auth/login").
      with(:body => "{\"auth\":\"sem\",\"password\":\"foobar\"}",
           :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/json' }).
    to_return(:status => 204, :body => "", :headers => { "set-cookie" => "semaphore=MTQ3"})
    Semaphore.login("sem", "foobar")
    expect(Semaphore.logged?).to be true
  end
end
