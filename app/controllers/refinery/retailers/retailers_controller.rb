module Refinery
  module Retailers
    class RetailersController < ::ApplicationController

      before_action :find_all_retailers
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @retailer in the line below:
        present(@page)
      end

      def show
        @retailer = Retailer.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @retailer in the line below:
        present(@page)
      end

    protected

      def find_all_retailers
        @retailers = Retailer.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/retailers").first
      end

    end
  end
end
