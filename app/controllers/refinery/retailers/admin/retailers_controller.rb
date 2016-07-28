module Refinery
  module Retailers
    module Admin
      class RetailersController < ::Refinery::AdminController
        crudify :'refinery/retailers/retailer',
                paging: false,
                include: [:translations],
                order: "lower(title) ASC"

        helper :'refinery/retailers/retailers'

        def subregion_options
          render partial: 'subregion_select'
        end

        protected

        def retailer_params
          params.require(:retailer).permit(permitted_retailer_params)
        end

        private

        def permitted_retailer_params
          [
            :title, :body, :contact, :address, :country_code,
            :state_code, :city, :zipcode, :phone, :fax, :email, :website, :draft
          ]
        end
      end
    end
  end
end