# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  context "with doctor user" do
    let(:user) do
      User.create!(
        first_name: 'MyString',
        last_name: 'MyString',
        email: 'MyString',
        role: 'doctor'
      )
    end

    before do
      assign(:user, user)
    end

    it 'renders the edit user form' do
      render

      assert_select 'form[action=?][method=?]', user_path(user), 'post' do
        assert_select 'input[name=?]', 'user[first_name]'

        assert_select 'input[name=?]', 'user[last_name]'

        assert_select 'input[name=?]', 'user[email]'

        assert_select 'input[name=?]', 'user[role]'
      end
    end
  end

  context "with patient user" do
    let(:user) do
      User.create!(
        first_name: 'MyString',
        last_name: 'MyString',
        email: 'MyString',
        role: 'patient'
      )
    end

    before do
      assign(:user, user)
    end

    it 'renders the edit user form' do
      render

      assert_select 'form[action=?][method=?]', user_path(user), 'post' do
        assert_select 'input[name=?]', 'user[first_name]'

        assert_select 'input[name=?]', 'user[last_name]'

        assert_select 'input[name=?]', 'user[email]'

        assert_select 'input[name=?]', 'user[role]'
      end
    end
  end
end
