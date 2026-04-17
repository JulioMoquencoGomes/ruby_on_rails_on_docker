require 'swagger_helper'

RSpec.describe 'SQS API', type: :request, swagger_doc: 'v1/swagger.yaml' do

    path '/sqs/{message}' do

    get 'Create a queue sqs (Amazon AWS)' do
      tags 'Amazon AWS - Sqs'
      produces 'application/json', 'application/xml'
      parameter name: :message, :in => :path, :type => :string

      response '200', 'Queue Sqs created' do
        run_test!
      end

      response '404', 'Queue Sqs not created' do
        run_test!
      end
    end
  end

end