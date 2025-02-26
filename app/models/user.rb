# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string           not null
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  # DEVISE MODULES
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # SCOPES
  scope :doctors, -> { where(role: 'doctor') }
  scope :patients, -> { where(role: 'patient') }

  # CONSTANTS/ENUMS
  enum :role, { patient: 'patient', doctor: 'doctor' }

  # VALIDATIONS
  validates :first_name, :last_name, :email, :role, presence: true
  validates :role, inclusion: { in: roles.values }
  validates :email, uniqueness: true
  validates :doctor_profile, presence: true, if: -> { role == 'doctor' }

  # ASSOCIATIONS
  has_one :doctor_profile, dependent: :destroy

  # NESTED ATTRIBUTES
  accepts_nested_attributes_for :doctor_profile
end
