# frozen_string_literal: true

class ExperiencePolicy < ApplicationPolicy
  %w[new create edit update destroy].each do |method|
    define_method("#{method}?") do
      record.profile.user_id == user.id
    end
  end
end
