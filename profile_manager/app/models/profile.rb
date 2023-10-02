# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  has_many :experiences, dependent: :destroy

  has_one_attached :image, dependent: :purge

  validates :first_name, :last_name, :serial_number, :phone_number, :email, presence: true
  validates :description, length: { maximum: 500 }
end
