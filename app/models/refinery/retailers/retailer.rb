module Refinery
  module Retailers
    class Retailer < Refinery::Core::BaseModel
      self.table_name = 'refinery_retailers'

      before_validation :smart_add_url_protocol

      validates :address, :presence => true, :uniqueness => true


      default_scope { order('lower(title) ASC') }
      acts_as_indexed fields: [:title, :contact, :address, :country_code, :state_code, :city] if defined?(Refinery::ActsAsIndexed::Engine)

      scope :published, -> { where :draft => false }

      protected

        def smart_add_url_protocol
          unless self.website.empty?
            unless (self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//])
              self.website = "http://#{self.website}"
            end
          end
        end
    end
  end
end
