# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  %w[edit update show destroy].each do |method|
    define_method("#{method}?") do
      record.user_id == user.id
    end
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
