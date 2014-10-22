module Refinery
  module Retailers
    include ActiveSupport::Configurable

    config_accessor :country_priority, :page_path_index

    self.country_priority = %w(US CA)
    self.page_path_index = "/retailers"
  end
end