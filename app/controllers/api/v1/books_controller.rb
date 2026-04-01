module Api
  module V1
    class BooksController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
      
      def index
        books = Book.all
        render json: { books: books, length: books.count }, status: :ok
      end

      def show
        render json: Book.find(params[:id])
      end

      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :created
        else
          render json: { error: "Não foi possível criar o livro requisitado!" }, status: :error
        end
      end

      def update
        book = Book.find(params[:id])
        if book.update!(book_params)
          render json: book, status: :ok
        else
          render json: { error: "Não foi possível atualizar o livro requisitado!" }, status: :error
        end
      end

      def destroy
        Book.find(params[:id]).destroy
        head :no_content
      end

      def generate_ten_books_automatic
        FillBooksJob.perform_async(1)
        render json: { message: "Ok" }, status: :ok
      end

      def render_not_found_response
        render json: {
            error: "Infelizmente não foi encontrado essa request!"
        }
      end

      private

      def book_params
        params.permit(:name, :author, :year)
      end

    end
  end
end