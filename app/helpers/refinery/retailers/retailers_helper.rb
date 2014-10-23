module Refinery
  module Retailers
    module RetailersHelper
      def country_name(country_code)
        country = Carmen::Country.coded(country_code)
        country.name unless country.nil?
      end

      def subregion_name(country_code, state_code)
        subregion = Carmen::Country.coded(country_code).subregions.coded(state_code)
        subregion.name unless subregion.nil?
      end

      def inline_address(retailer)
        [retailer.address, retailer.city, retailer.state_code, retailer.zipcode, country_name(retailer.country_code)].reject(&:blank?).join(", ")
      end
    end
  end
end