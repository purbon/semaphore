$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "semaphore"
require 'webmock/rspec'

Semaphore.configure
