# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  protected

  def authorize_records
    @records.each do |record|
      authorize record
    end
  end

  def record
    @record ||= authorize model.find(params[:id])
  end

  private

  def redirect_to_home
    redirect_to new_user_session_path, alert: 'Please Login to your Account'
  end

  def unauthorized
    redirect_to profiles_path, alert: 'Access Denied'
  end

  def model
    controller_path.classify.constantize
  end
end
