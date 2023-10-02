# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, :start_date, :end_date, presence: true
end
