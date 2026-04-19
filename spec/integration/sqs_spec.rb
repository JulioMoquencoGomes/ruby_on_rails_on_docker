require 'swagger_helper'

RSpec.describe 'SQS API', type: :request, swagger_doc: 'v1/swagger.yaml' do

    path '/sqs' do
      post 'Create a queue sqs (Amazon AWS)' do
        tags 'Amazon AWS - Sqs'
        consumes 'application/json', 'application/xml'

        parameter name: :params, in: :body, schema: {
          type: :object,
          properties: {
            message: { type: :string }
          },
          required: [ 'message' ]
        }

        response '200', 'Queue Sqs created' do
          run_test!
        end

        response '404', 'Queue Sqs not created' do
          run_test!
        end
      end
    end

    path '/sqs' do
      get 'Retrieves a queue sqs (Amazon AWS)' do
        tags 'Amazon AWS - Sqs'
        produces 'application/json', 'application/xml'

        response '200', 'Retrieves Sqs' do
          run_test!
        end

        response '404', 'Not Retrieves' do
          run_test!
        end
      end
    end

end