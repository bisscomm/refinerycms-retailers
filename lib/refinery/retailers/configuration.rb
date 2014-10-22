module Refinery
  module Retailers
    include ActiveSupport::Configurable

    config_accessor :country_priority

    self.country_priority = %w(US CA)
  end
end