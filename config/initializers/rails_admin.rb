RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.excluded_models << "User"
  # config.excluded_models << "Tomcat"
  # config.excluded_models << "Kitten"

  config.model Article do
    label_plural Article.model_name.human(count: 2)
    edit do
      field :title
      field :text, :wysihtml5
    end
  end

  config.model Tomcat do
    edit do
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :name
      field :breed
      field :tests
      field :station
      field :image
      field :born_at
      field :description, :wysihtml5
    end
  end

  config.model Kitten do
    edit do
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :name
      field :sex
      field :breed
      field :station
      field :image
      field :description, :wysihtml5
    end
  end


end