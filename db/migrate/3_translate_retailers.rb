class TranslateRetailers < ActiveRecord::Migration
  def self.up
    begin
      ::Refinery::Retailers::Retailer.create_translation_table!({
        title: :string,
        body: :text,
        contact: :string, 
        website: :string,
        address: :string,
        city: :string
      }, {
        migrate_data: true
      })
    rescue NameError
      warn "Refinery::Retailers was not defined!"
    end
  end

  def self.down
    begin
      ::Refinery::Retailers::Retailer.drop_translation_table! migrate_data: true
    rescue NameError
      warn "Refinery::Retailers was not defined!"
    end
  end
end