module Openai
  class BaseService
    attr_reader :model, :connection

    def initialize
      @model = 'gpt-3.5-turbo'
      @connection = Faraday.new(url: 'https://api.openai.com') do |f|
        f.headers['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
        f.headers['Content-Type'] = 'application/json'
        f.adapter Faraday.default_adapter
      end
    end
  end
end
