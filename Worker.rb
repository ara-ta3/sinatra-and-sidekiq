require "redis"
require "sidekiq"

class Worker
    include Sidekiq::Worker
    sidekiq_options queue: :event
    @@redis = Redis.new(:url => "redis://localhost/10")

    def perform(key)
        sleep(2)
        # ほんとは重いSQLを発行したりしてMySQLに書き込んだりするものを想定
        @@redis.set(key, true)
    end
end
