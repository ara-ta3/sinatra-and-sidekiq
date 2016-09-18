require "sinatra"
require "json"
require "redis"

class App < Sinatra::Base

    @@redis = Redis.new(:url => "redis://localhost/10")
    get '/' do
        content_type :json
        all = {}
        @@redis.keys.each {|k| 
            all[k] = @@redis.get(k)
        }
        all.to_json
    end

    post '/' do
        d = params[:x]
        @@redis.set(d, false)
        EventWorker.perform_async(d)
        content_type :json
        res = {
            result: "ok"
        }
        res.to_json
    end
end

