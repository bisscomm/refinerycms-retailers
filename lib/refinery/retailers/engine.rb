module Refinery
  module Retailers
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Retailers

      engine_name :refinery_retailers

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "retailers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.retailers_admin_retailers_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Retailers)
      end
    end
  end
end
