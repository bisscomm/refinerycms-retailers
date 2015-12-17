class AddBodyToRetailers < ActiveRecord::Migration
  def change
    add_column :refinery_retailers, :body, :text
  end
end