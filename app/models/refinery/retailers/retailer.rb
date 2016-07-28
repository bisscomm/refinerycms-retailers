module Refinery
  module Retailers
    class Retailer < Refinery::Core::BaseModel
      self.table_name = 'refinery_retailers'

      translates :title, :body, :contact, :website, :address, :city

      before_validation :smart_add_url_protocol

      validates :title, presence: true
      validates :address, presence: true, uniqueness: true

      acts_as_indexed fields: [:title, :contact, :address, :country_code, :state_code, :city] if defined?(Refinery::ActsAsIndexed::Engine)

      scope :published, -> { where draft: false }

      protected

      def smart_add_url_protocol
        if self.website.present?
          unless (self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//])
            self.website = "http://#{self.website}"
          end
        end
      end
    end
  end
end
