class ChatController < ApplicationController
  def create
    response = Openai::ChatResponseService.new.call(params[:message])

    render json: { response: response }
  end
end
