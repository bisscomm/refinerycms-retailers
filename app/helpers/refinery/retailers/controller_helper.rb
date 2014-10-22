module Refinery
  module Retailers
    module ControllerHelper
      protected
        def find_all_retailers
          @retailers = Retailer.order('position ASC')
        end

        def find_page
          @page = Page.find_by(link_url: Refinery::Retailers.page_path_index)
        end
    end
  end
end