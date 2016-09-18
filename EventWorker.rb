require "redis"
require "sidekiq"

class EventWorker
    include Sidekiq::Worker
    sidekiq_options queue: :event
    @@redis = Redis.new(:url => "redis://localhost/10")

    def perform(id)
        sleep(2)
        @@redis.set(id, true)
    end
end
