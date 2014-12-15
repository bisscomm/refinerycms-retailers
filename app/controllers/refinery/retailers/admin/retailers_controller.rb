module Refinery
  module Retailers
    module Admin
      class RetailersController < ::Refinery::AdminController
        crudify :'refinery/retailers/retailer',
                :xhr_paging => true

        helper :'refinery/retailers/retailers'

        def subregion_options
          render partial: 'subregion_select'
        end

        private

          def retailer_params
            params.require(:retailer).permit(:title, :body, :contact, :address, :country_code,
              :state_code, :city, :zipcode, :phone, :fax, :email, :website, :draft)
          end
      end
    end
  end
end
