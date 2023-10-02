# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :redirect_to_home, if: -> { current_user.blank? }

  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    @records = policy_scope(Profile)
    authorize_records
  end

  def new
    @record = authorize Profile.new
  end

  def create
    if (@profile = current_user.profiles.create(profile_params))
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    record
  end

  def update
    if record.update(form_params)
      attach_image
      redirect_to record
    else
      render 'edit'
    end
  end

  def show
    record
    @total_experience = total_experience
  end

  def destroy
    if record.destroy
      redirect_to profiles_path, notice: 'Profile Deleted Successfully'
    else
      redirect_to profiles_path, notice: 'Can not delete Profile'
    end
  end

  private

  def profile_params
    form_params.merge(serial_number:
                      "PM-#{current_user.id}-#{current_user.profiles.last.id + 1}")
  end

  def form_params
    params.require(:profile)
          .permit(%i[first_name last_name description email
                     phone_number address designation skills])
  end

  def total_experience
    total = 0
    record.experiences.each do |exp|
      total += (exp.end_date - exp.start_date)
    end
    total.to_i
  end

  def attach_image
    image = params.dig(:profile, :image)
    record.image.attach(image) if image.present?
  end
end
