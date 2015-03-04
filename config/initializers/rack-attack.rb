class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 
  Rack::Attack.throttle('/api/', :limit => 60, :period => 60.seconds) do |req|
    req.ip
    end
end
