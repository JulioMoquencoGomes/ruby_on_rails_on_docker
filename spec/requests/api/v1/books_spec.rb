require 'rails_helper'

RSpec.describe "Api::V1::BooksController", type: :request do

  let!(:book) { build(:book) }
  
  describe "GET /api/v1/books" do
    it "espera retornar status 200" do

      get api_v1_books_path
      expect(response).to have_http_status(200)
      
    end
  end

  describe "POST /api/v1/books" do

    it "espera retornar status 201" do

      post api_v1_books_path, params: book, as: :json
      expect(response).to have_http_status(201)

    end
  end

  describe "PUT /api/v1/books/:id" do
    it "espera retornar status 200 e atualizar o registro com sucesso" do

      book_database = create(:book)

      new_name = "#{Faker::Name.prefix} #{Faker::Name.first_name}"
      new_author = Faker::Name.name
      new_year = Faker::Number.between(from: 1700, to: 2026)

      put api_v1_book_path(book_database.id), params: {
        "id": book_database.id,
        "name": new_name,
        "author": new_author,
        "year": new_year
      }

      expect(response).to have_http_status(200)

      book_database.reload

      expect(book_database.name).to eq new_name
      expect(book_database.author).to eq new_author
      expect(book_database.year).to eq new_year

    end
  end
  
end
