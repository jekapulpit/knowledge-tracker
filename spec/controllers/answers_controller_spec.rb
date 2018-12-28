require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'GET #answer' do
    it 'returns http success' do
      get :answer
      expect(response).to have_http_status(:success)
    end
  end
end
