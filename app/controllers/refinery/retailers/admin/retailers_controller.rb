module Refinery
  module Retailers
    module Admin
      class RetailersController < ::Refinery::AdminController

        crudify :'refinery/retailers/retailer',
                :xhr_paging => true

      end
    end
  end
end
