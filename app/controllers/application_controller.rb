class ApplicationController < ActionController::Base

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  def validate_params
    activity = Validate::Location.new(params)
    if !activity.valid?
      render json: { error: activity.errors }
    end
  end

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error: { unknown_parameters: pme.params } }, 
           status: :bad_request
  end
end
