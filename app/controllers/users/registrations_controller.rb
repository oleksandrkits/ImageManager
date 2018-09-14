class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_adress
    respond_with self.resource
  end
end