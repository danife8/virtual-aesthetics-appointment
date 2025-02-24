# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before do
    assign(:users, [
             User.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'doctor@email.com',
               role: 'doctor'
             ),
             User.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'patient@email.com',
               role: 'patient'
             )
           ])
  end

  it 'renders a list of users' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('First Name'), count: 2
    assert_select cell_selector, text: Regexp.new('Last Name'), count: 2
    assert_select cell_selector, text: Regexp.new('Email'), count: 2
    assert_select cell_selector, text: Regexp.new('doctor'), count: 2
    assert_select cell_selector, text: Regexp.new('patient'), count: 2
  end
end
