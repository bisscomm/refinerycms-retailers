module Refinery
  module Retailers
    module Admin
      class RetailersController < ::Refinery::AdminController

        crudify :'refinery/retailers/retailer',
                :xhr_paging => true

        def subregion_options
          render partial: 'subregion_select'
        end

        private

          def retailer_params
            params.require(:retailer).permit(:title, :contact, :address, :country_code,
              :state_code, :zipcode, :phone, :fax, :email, :website, :draft)
          end
      end
    end
  end
end
