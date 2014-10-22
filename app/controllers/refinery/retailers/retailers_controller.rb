module Refinery
  module Retailers
    class RetailersController < ::ApplicationController
      include ControllerHelper

      before_action :find_all_retailers
      before_action :find_page, only: :index

    end
  end
end