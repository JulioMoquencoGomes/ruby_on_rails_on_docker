module Api
  module V1
    class SqsController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
      
      def index
        render json: {
            error: "Faltando conteudo de mensagem para o SQS" }, 
            status: :error if params[:message].nil?
        
        result = Aws::SQS::Client.new.send_message(
            queue_url: ENV['AWS_QUEUE_URL'],
            message_body: { message: params[:message] }.to_json
        )

        render json: { data: result }, status: :ok
      end
    end
  end
end