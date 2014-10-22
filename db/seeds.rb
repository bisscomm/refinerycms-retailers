Refinery::User.find_each do |user|
  user.plugins.where(name: 'refinerycms-retailers').first_or_create!(
    position: (user.plugins.maximum(:position) || -1) +1
  )
end if defined?(Refinery::User)

if defined?(::Refinery::Page)
  retailers_index_page = Refinery::Page.find_by(:link_url => Refinery::Retailers.page_path_index)

  unless retailers_index_page
    retailers_index_page = ::Refinery::Page.create({
      :title => "Retailers",
      :link_url => Refinery::Retailers.page_path_index,
      :menu_match => "^(/retailers.*)|#{Refinery::Retailers.page_path_index}$",
      :deletable => false
    })
    retailers_index_page.parts.create({
      :title => "Body",
      :body => "<p>Contact our retailers.</p>",
      :position => 0
    })
    retailers_index_page.parts.create({
      :title => "Side Body",
      :body => "",
      :position => 1
    })
  end
end