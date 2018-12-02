# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :monuments
  get 'orders/new'
  get 'monuments/new'
end
