module Refinery
  module Retailers
    class RetailersController < ::ApplicationController
      include ControllerHelper

      before_action :find_all_retailers
      before_action :find_page, only: :index

      def index
        @retailer_countries = @retailers.group_by { |t| t.country_code }
      end
    end
  end
end