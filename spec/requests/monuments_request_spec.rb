# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monuments API', type: :request do
  # initialize Monuments
  let!(:monuments) { create_list(:monument, 10) }
  let(:monument_id) { monuments.first.id }

  # Test suite for GET /monuments
  describe 'GET /monuments' do
    before { get '/monuments' }

    it 'returns monuments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /monuments/:id
  describe 'GET /monuments/:id' do
    before { get "/monuments/#{monument_id}" }

    context 'when the record exists' do
      it 'returns the monument' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(monument_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:monument_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      # it 'returns a not found message' do
      #    expect(response.body).to match(/Couldn't find order/)
      # end
    end
  end

  # Test suite for POST /monuments
  describe 'POST /monuments' do
    # valid payload
    let(:valid_attributes) { attributes_for(:monument) }

    context 'when the request is valid' do
      before { post '/monuments', params: valid_attributes }

      # it 'creates a monument' do
      #    expect(json['last_name'].to eq(valid_attributes[:last_name]))
      # end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/monuments', params: { monument_type: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # it 'returns a validation failure message' do
      # expect(response.body).to
      # match(/Validation failed: First Name can't be blank/)
      # end
    end
  end

  # Test suite for PUT /monuments/:id
  describe 'PUT /monuments/:id' do
    let(:valid_attributes) { { monuent_type: 'Jordan' } }

    context 'when record exists' do
      before { put "/monuments/#{monument_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /monuments/:id
  describe 'DELETE /monuments/:id' do
    before { delete "/monuments/#{monument_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
