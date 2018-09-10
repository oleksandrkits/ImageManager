module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :age,
                                                       :about,
                                                       :sex,
                                                       adress_attributes: [ :city,
                                                                            :street,
                                                                            :home_number,
                                                                            :zip
                                                       ]
    ]
    )
  end
end