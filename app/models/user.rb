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
  # CONSTANTS
  ROLES = %w[doctor patient].freeze

  # VALIDATIONS
  validates :first_name, :last_name, :email, :role, presence: true
  validates :role, inclusion: { in: ROLES }
  validates :email, uniqueness: true
end
