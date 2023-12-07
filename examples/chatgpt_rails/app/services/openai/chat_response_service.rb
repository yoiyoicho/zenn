module Openai
  class ChatResponseService < BaseService
    def call(input)
      body = {
        model: @model,
        messages: [
          { role: "user", content: input }
        ]
      }.to_json

      response = @connection.post('/v1/chat/completions') do |req|
        req.body = body
      end

      response_hash = JSON.parse(response.body)
      response_hash.dig("response", "choices", 0, "message", "content")
    end
  end
end
