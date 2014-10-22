module Refinery
  module Retailers
    module Admin
      class RetailersController < ::Refinery::AdminController

        crudify :'refinery/retailers/retailer',
                :xhr_paging => true

        def subregion_options
          render partial: 'subregion_select'
        end
      end
    end
  end
end
