module Refinery
  class RetailersGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_retailers_initializer
      template 'config/initializers/refinery/retailers.rb.erb', File.join(destination_root, 'config', 'initializers', 'refinery', 'retailers.rb')
    end

    def rake_db
      rake "refinery_retailers:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Retailers extension
Refinery::Retailers::Engine.load_seed
        EOH
      end
    end
  end
end
