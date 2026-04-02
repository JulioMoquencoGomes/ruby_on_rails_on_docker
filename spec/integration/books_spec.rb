require 'swagger_helper'

RSpec.describe 'Books API', type: :request, swagger_doc: 'v1/swagger.yaml' do
#describe 'Books API' do

  path '/books' do

    post 'Creates a book' do
      tags 'Books'
      consumes 'application/json', 'application/xml'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          author: { type: :string },
          year: { type: :integer }
        },
        required: [ 'name', 'author', 'year' ]
      }

      response '201', 'Book created' do
        let(:book) { { name: 'Doo', author: 'Mr Pele', year: 1980 } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:book) { { name: 'Foo' } }
        run_test!
      end
    end
  end

  path '/books/{id}' do

    get 'Retrieves a book' do
      tags 'Books'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Book found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            author: { type: :string },
            year: { type: :integer }
          },
          required: [ 'id', 'name', 'author', 'year' ]

        let(:id) { book.create(name: 'Foo', author: 'Britney', year: 1975).id }
        run_test!
      end

      response '404', 'Book not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end