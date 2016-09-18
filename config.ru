require "./app.rb"
require "./Worker.rb"
require "sidekiq"
require 'sidekiq/web'

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379', namespace: 'sidekiq' }
end

run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
