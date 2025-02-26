# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:role) }

    described_class.roles.each_value do |role|
      it { is_expected.to allow_value(role).for(:role) }
    end
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'scopes' do
    let(:doctor) { create(:user, :doctor) }
    let(:patient) { create(:user, :patient) }

    it 'returns only doctors' do
      expect(described_class.doctors).to include(doctor)
      expect(described_class.doctors).not_to include(patient)
    end

    it 'returns only patients' do
      expect(described_class.patients).to include(patient)
      expect(described_class.patients).not_to include(doctor)
    end
  end

  describe 'associations' do
    it { is_expected.to have_one(:doctor_profile).dependent(:destroy) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:doctor_profile) }
  end

  describe 'enum' do
    it 'has a patient role' do
      expect(described_class.roles[:patient]).to eq('patient')
    end

    it 'has a doctor role' do
      expect(described_class.roles[:doctor]).to eq('doctor')
    end
  end
end
