class SqsService

    def initialize
        @clientSqs = Aws::SQS::Client.new
    end

    def producer(message)
        @clientSqs.send_message(
            queue_url: ENV['AWS_QUEUE_URL'],
            message_body: { message: message }.to_json
        )
    end

    def consumer
        resp = @clientSqs.receive_message(
            queue_url: ENV['AWS_QUEUE_URL'],
            max_number_of_messages: 1
        )

        resp.messages.each do |msg|
            puts "Message: #{msg.body}"
            self.delete_message(msg)
        end
        
        return resp
    end

    private

    def delete_message(msg)
        @clientSqs.delete_message(
            queue_url: ENV['AWS_QUEUE_URL'],
            receipt_handle: msg.receipt_handle
        )
    end

end