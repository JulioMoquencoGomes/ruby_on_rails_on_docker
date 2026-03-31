require 'rails_helper'

RSpec.describe "Api::V1::BooksController", type: :request do
  
  describe "GET /api/v1/books" do
    it "espera retornar status 200" do

      get api_v1_books_path
      expect(response).to have_http_status(200)
      
    end
  end

  describe "POST /api/v1/books" do
    it "espera retornar status 201" do

      post api_v1_books_path, params: {
        "name": "#{Faker::Name.prefix} #{Faker::Name.first_name}",
        "author": Faker::Name.name,
        "year": Faker::Number.between(from: 1700, to: 2026)
      }

      expect(response).to have_http_status(201)

    end
  end

  describe "PUT /api/v1/books/:id" do
    it "espera retornar status 200 e atualizar o registro com sucesso" do

      book = Book.create!(name: "#{Faker::Name.prefix} #{Faker::Name.first_name}",
        author: Faker::Name.name, year: Faker::Number.between(from: 1700, to: 2026))

      new_name = "#{Faker::Name.prefix} #{Faker::Name.first_name}"
      new_author = Faker::Name.name
      new_year = Faker::Number.between(from: 1700, to: 2026)

      put api_v1_book_path(book.id), params: {
        "id": book.id,
        "name": new_name,
        "author": new_author,
        "year": new_year
      }

      expect(response).to have_http_status(200)

      book.reload

      expect(book.name).to eq new_name
      expect(book.author).to eq new_author
      expect(book.year).to eq new_year

    end
  end

end
