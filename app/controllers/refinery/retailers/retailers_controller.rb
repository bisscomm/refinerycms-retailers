module Refinery
  module Retailers
    class RetailersController < ::ApplicationController
      include ControllerHelper

      before_action :find_all_retailers, only: :index
      before_action :find_page, only: :index

      def index
        @retailers = @retailers.group_by { |r| r.country_code }.sort_by{ |country_code, r| Carmen::Country.coded(country_code).name.parameterize }
      end
    end
  end
end