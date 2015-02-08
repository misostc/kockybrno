RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    render :status => :forbidden, :text => "Zakázaný přístup" unless current_user.try(:admin?)
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
  end

  config.excluded_models << "Punch"

  config.model Article do
    label_plural Article.model_name.human(count: 2)
    edit do
      field :title
      field :text, :wysihtml5
    end
  end

  config.model Tomcat do
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
  end

  config.model Kitten do
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
  end

  config.model User do
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
    object_label_method do
      :nice_name
    end
  end

  config.model Region do
    edit do
      field :name
      field :content, :wysihtml5
    end
  end


end
