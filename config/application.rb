require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rack/throttle'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mox
  class Application < Rails::Application
    config.generators do |g|
        g.test_framework :rspec, fixture: true
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.view_specs false
        g.helper_specs false
        g.stylesheets = false
        g.javascripts = false
        g.helper = false
  end

  config.autoload_paths += %W(\#{config.root}/lib)
  config.active_record.raise_in_transactional_callbacks = true
  config.middleware.use Rack::Throttle::Interval, :rules => {:url => /api/, :method => :get}
  end
end
