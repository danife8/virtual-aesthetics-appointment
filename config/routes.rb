# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/patients/sign_up', to: 'users/registrations#new', defaults: { role: 'patient' }
    get '/doctors/sign_up', to: 'users/registrations#new', defaults: { role: 'doctor' }
  end
end
