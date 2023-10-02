# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def create
    @profile = find_profile
    @experience = @profile.experiences.create(exp_params)
    redirect_to profile_path(@profile)
  end

  def edit
    record
    @profile = find_profile
  end

  def update
    if record.update(exp_params)
      redirect_to profile_path(find_profile), notice: 'Update Successfull!'
    else
      render :edit, notice: 'Update Unsuccessfull!'
    end
  end

  def destroy
    if record.destroy
      redirect_to profile_path(find_profile), notice: 'Experience Deleted Successfully!'
    else
      redirect_to profile_path(find_profile), notice: 'Could not delete Experience!'
    end
  end

  private

  def exp_params
    params.require(:experience)
          .permit(%i[title description start_date end_date skills])
  end

  def find_profile
    Profile.find(params[:profile_id])
  end
end
