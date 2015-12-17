require 'refinerycms-core'

module Refinery
  autoload :RetailersGenerator, 'generators/refinery/retailers/retailers_generator'

  module Retailers
    require 'refinery/retailers/engine'
    require 'refinery/retailers/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  require 'carmen-rails'
  require 'globalize'
end