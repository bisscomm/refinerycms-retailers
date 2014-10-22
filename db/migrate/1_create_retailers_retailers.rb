class CreateRetailersRetailers < ActiveRecord::Migration

  def up
    create_table :refinery_retailers do |t|
      t.string :title
      t.string :contact
      t.string :address
      t.string :country_code, :limit => 2
      t.string :state_code
      t.string :zipcode
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.boolean :draft, default: true
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-retailers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/retailers/retailers"})
    end

    drop_table :refinery_retailers

  end

end
