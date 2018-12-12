# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  # initialize Orders
  let!(:orders) { create_list(:order, 10) }
  let(:order_id) { orders.first.id }

  # Test suite for GET /orders
  describe 'GET /orders' do
    # make http requests before each example
    before { get '/orders' }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /orders/:id
  describe 'GET /orders/:id' do
    before { get "/orders/#{order_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:order_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      # it 'returns a not found message' do
      #  expect(response.body).to match(/Couldn't find order/)
      # end
    end
  end

  # Test suite for POST /orders
  describe 'POST /orders' do
    # valid payload
    let(:valid_attributes) { attributes_for(:order) }

    context 'when the request is valid' do
      before { post '/orders', params: valid_attributes }

      # it 'creates a todo' do
      #    expect(json['last_name'].to eq(valid_attributes[:last_name]))
      # end

      # it 'returns status code 201' do
      #  expect(response).to have_http_status(201)
      # end
    end

    context 'when the request is invalid' do
      before { post '/orders', params: { last_name: 'Foobar' } }

      # it 'returns status code 422' do
      #  expect(response).to have_http_status(422)
      # end

      # it 'returns a validation failure message' do
      # expect(response.body).to match(/Validation failed:
      # First Name can't be blank/)
      # end
    end
  end

  # Test suite for PUT /orders/:id
  describe 'PUT /orders/:id' do
    let(:valid_attributes) { { last_name: 'Jordan' } }

    context 'when record exists' do
      before { put "/orders/#{order_id}", params: valid_attributes }

      # it 'updates the record' do
      #  expect(response.body).to be_empty
      # end

      # it 'returns status code 204' do
      #  expect(response).to have_http_status(204)
      # end
    end
  end

  # Test suite for DELETE /orders/:id
  describe 'DELETE /orders/:id' do
    before { delete "/orders/#{order_id}" }

    # it 'returns status code 204' do
    #  expect(response).to have_http_status(204)
    # end
  end
end
