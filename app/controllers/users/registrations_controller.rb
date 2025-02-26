# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    def new
      build_resource
      resource.role = params[:role] || 'patient'
      resource.build_doctor_profile if resource.doctor?
      respond_with(resource) do |format|
        format.html { render template: "users/registrations/new_#{resource.role}" }
      end
    end

    def create
      build_resource(sign_up_params)
      resource.role = params[:user][:role] || 'patient'

      template_path = if resource.doctor?
                        'users/registrations/new_doctor'
                      else
                        'users/registrations/new_patient'
                      end

      if resource.save
        redirect_to root_path
      else
        clean_up_passwords(resource)
        render template: template_path
      end
    end

    protected

    def configure_permitted_parameters
      # Common parameters for all users
      common_params = %i[email password password_confirmation first_name last_name role]
      # Add profile params only for doctors
      doctor_params = [doctor_profile_attributes: %i[specialization location]]

      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        if user_params[:role] == 'doctor'
          user_params.permit(*common_params, *doctor_params)
        else
          user_params.permit(common_params)
        end
      end
    end
  end
end
