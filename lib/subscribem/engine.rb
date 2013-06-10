require "warden"
require "dynamic_form"

module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
    end

    config.generators do |g|
      g.test_framework :rspec, view_specs: false
    end

    config.to_prepare do
      root = Subscribem::Engine.root
      extenders_path = root + "app/extenders/**/*.rb"
      Dir.glob(extenders_path) do |file|
        Rails.configuration.cache_classes ? require(file) : load(file)
      end
    end

  end
end