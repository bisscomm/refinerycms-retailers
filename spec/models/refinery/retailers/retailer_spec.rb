require 'spec_helper'

module Refinery
  module Retailers
    describe Retailer, type: :model do
      describe "validations" do
        subject do
          FactoryGirl.create(:retailer, {
            title: "Acme Inc.",
            address: "1 Acme st"
          })
        end

        it { is_expected.to be_valid }

        describe '#errors' do
          subject { super().errors }
          it { is_expected.to be_empty }
        end

        describe '#title' do
          subject { super().title }
          it { is_expected.to eq("Acme Inc.") }
        end

        describe '#address' do
          subject { super().address }
          it { is_expected.to eq("1 Acme st") }
        end

        describe "validations" do
          it "requires address" do
            expect(FactoryGirl.build(:retailer, address: "")).not_to be_valid
          end

          it "won't allow duplicate address" do
            expect(FactoryGirl.build(:retailer, address: subject.address)).not_to be_valid
          end
        end

        describe "published" do
          before do
            @retailer1 = FactoryGirl.create(:retailer, draft: true)
            @retailer2 = FactoryGirl.create(:retailer, draft: false)
          end

          it "returns all posts which aren't in draft" do
            published_retailers = described_class.published
            expect(published_retailers.count).to eq(1)
            expect(published_retailers).to include(@retailer2)
          end
        end
      end
    end
  end
end