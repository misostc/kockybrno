# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items.
  # Defaults to 'selected' navigation.selected_class = 'your_selected_class'
  navigation.selected_class = 'active'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name, item| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = true

  # If this option is set to true, all item names will be considered as safe (passed through html_safe). Defaults to false.
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.items do |primary|
    primary.dom_class = 'nav nav-justified nav-pills'

    primary.item :sdruzeni, 'Sdružení', root_path

    primary.item :clanky, 'Články', education_articles_path, highlights_on: %r{.*education}

    primary.item :chov, 'Chov', tomcats_path do |chov|
      chov.dom_class = 'nav nav-justified nav-pills'
      chov.item :kocouri, 'Kocouři', tomcats_path, highlights_on: %r{/tomcat}
      chov.item :kotata, 'Koťata', kittens_path, highlights_on: %r{/kitten}
      chov.item :vyhody, 'Výhody členů', benefits_path, highlights_on: %r{/benefit}
    end

    primary.item :exhibitions, 'Výstavy', exhibitions_path

    primary.item :cleny, 'Členové', users_path, highlights_on: %r{/user}
  end
end
