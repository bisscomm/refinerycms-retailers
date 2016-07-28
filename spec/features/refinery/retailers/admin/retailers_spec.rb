# encoding: utf-8
require "spec_helper"

module Refinery
  module Retailers
    module Admin
      describe Retailer, type: :feature do
        refinery_login

        describe "retailers list" do
          before do
            FactoryGirl.create(:retailer, title: "UniqueTitleOne")
            FactoryGirl.create(:retailer, title: "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.retailers_admin_retailers_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.retailers_admin_retailers_path

            click_link "Add New Retailer"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", with: "This is a test of the title string field"
              fill_in "Address", with: "This is a test of the address string field"
              click_button "Save"

              expect(page).to have_content("'This is a test of the title string field' was successfully added.")
              expect(subject.class.count).to eq(1)
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              expect(page).to have_content("Title can't be blank")
              expect(page).to have_content("Address can't be blank")
              expect(subject.class.count).to eq(0)
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:retailer, address: "UniqueTitle") }

            it "should fail" do
              visit refinery.retailers_admin_retailers_path

              click_link "Add New Retailer"

              fill_in "Address", with: "UniqueTitle"
              click_button "Save"

              expect(page).to have_content("There were problems")
              expect(subject.class.count).to eq(1)
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:retailer, title: "A title") }

          it "should succeed" do
            visit refinery.retailers_admin_retailers_path

            within ".actions" do
              click_link "Edit this retailer"
            end

            fill_in "Title", with: "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).to have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:retailer, title: "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.retailers_admin_retailers_path

            click_link "Remove this retailer forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(subject.class.count).to eq(0)
          end
        end

      end
    end
  end
end