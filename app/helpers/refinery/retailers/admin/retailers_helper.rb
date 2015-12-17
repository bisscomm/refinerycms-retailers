module Refinery
  module Retailers
    module Admin
      module RetailersHelper
        def record_title_with_translations(record)
          record.title.presence || record.translations.detect { |t| t.title.present?}.title
        end
      end
    end
  end
end