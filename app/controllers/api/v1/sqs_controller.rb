module Api
  module V1
    class SqsController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
      
      def producer
        if !params[:message].present?
          render json: { data: "Faltando mensagem produzida para o SQS" }, status: :ok
        else
          message = params[:message]
          result = SqsService.new.producer(message)
          render json: { data: result }, status: :ok
        end
      end

      def consumer
          result = SqsService.new.consumer
          render json: { data: result }, status: :ok
      end

    end
  end
end