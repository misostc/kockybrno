require "i18n/backend/pluralization"
I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)

RailsAdmin.config do |config|

  # == Devise ==
  config.authenticate_with do
    render status: :forbidden, text: 'Zakázaný přístup' unless current_user.try(:admin?)
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancancan

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    show_in_app
    toggle
  end

  config.excluded_models << 'Punch'

  config.model Article do
    label_plural Article.model_name.human(count: 2)
    edit do
      field :title
      field :kind, :enum
      field :text, :wysihtml5
    end

    list do
      field :title
      field :kind, :enum
      field :text
      field :created_at
    end
  end

  config.model Tomcat do
    label_plural Tomcat.model_name.human(count: 2)
    edit do
      field :confirmed
      field :user
      field :name
      field :breed
      field :tests
      field :station
      field :ems
      field :image
      field :born_at
      field :description, :wysihtml5
    end

    list do
      field :confirmed, :toggle
      field :user
      field :name
      field :description
      field :created_at
      field :image
    end
  end

  config.model Kitten do
    label_plural Kitten.model_name.human(count: 2)
    edit do
      field :confirmed
      field :user
      field :born_at
      field :sex
      field :breed
      field :station
      field :image
      field :description, :wysihtml5
    end

    list do
      field :confirmed, :toggle
      field :user
      field :sex
      field :description
      field :created_at
      field :image
    end
  end

  config.model User do
    label_plural User.model_name.human(count: 2)
    edit do
      field :email
      field :password
      field :password_confirmation
      field :admin
      field :first_name
      field :last_name
      field :prefix_title
      field :suffix_title
      field :location
      field :website
      field :species
    end

    list do
      field :email
      field :last_name
      field :first_name
    end

    object_label_method do
      :nice_name
    end
  end

  config.model Region do
    label_plural Region.model_name.human(count: 2)
    edit do
      field :name
      field :content, :wysihtml5
    end

    list do
      field :name
      field :content
    end
  end

  config.model Document do
    label_plural Document.model_name.human(count: 2)
    list do
      field :title
      field :url do
        formatted_value do
          bindings[:view].content_tag(:code,  bindings[:view].main_app.document_url(bindings[:object]))
        end
      end
      field :visible, :toggle
    end

    edit do
      field :title
      field :document
      field :visible
    end
  end

  config.model Photo do
    label_plural Photo.model_name.human(count: 2)
    list do
      field :photogallery
      field :title
      field :image
    end
  end

  config.model Photogallery do
    label_plural Photogallery.model_name.human(count: 2)
    list do
      field :name
      field :created_at
    end
  end

end
