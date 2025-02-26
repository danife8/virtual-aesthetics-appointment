# frozen_string_literal: true

# == Schema Information
#
# Table name: doctor_profiles
#
#  id             :integer          not null, primary key
#  specialization :string
#  location       :string
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_doctor_profiles_on_user_id  (user_id)
#

class DoctorProfile < ApplicationRecord
  # VALIDATIONS
  validates :specialization, :location, presence: true

  # ASSOCIATIONS
  belongs_to :user
end
