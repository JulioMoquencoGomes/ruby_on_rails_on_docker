require 'rails_helper'

RSpec.describe "Api::V1::BooksController", type: :request do
  describe "GET /api/v1/books" do
    it "works!" do
      get api_v1_books_path
      expect(response).to have_http_status(200)
    end
  end
end
