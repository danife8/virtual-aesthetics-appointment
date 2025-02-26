# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DoctorProfile, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:specialization) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
