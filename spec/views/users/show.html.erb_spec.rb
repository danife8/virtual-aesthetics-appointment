# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  context "with doctor user" do
    before do
      assign(:user, User.create!(
                      first_name: 'First Name',
                      last_name: 'Last Name',
                      email: 'Email',
                      role: 'doctor'
                    ))
    end

    it 'renders attributes in <p>' do
      render
      expect(rendered).to match(/First Name/)
      expect(rendered).to match(/Last Name/)
      expect(rendered).to match(/Email/)
      expect(rendered).to match(/doctor/)
    end
  end
end
