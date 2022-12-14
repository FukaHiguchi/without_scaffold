class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        added_attrs = [ :name, :email, :password ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
    def after_sign_up_path_for(resource)
        my_threads_path
    end

    def after_sign_in_path_for(resource)
        my_threads_path
    end
end
