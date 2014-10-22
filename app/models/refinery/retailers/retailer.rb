module Refinery
  module Retailers
    class Retailer < Refinery::Core::BaseModel
      self.table_name = 'refinery_retailers'


      validates :title, :presence => true, :uniqueness => true

      acts_as_indexed :fields => [:title, :contact, :address, :country_code, :state_code, :city]
    end
  end
end
