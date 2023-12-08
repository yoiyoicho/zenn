class ChatController < ApplicationController
  def create
    response = Openai::ChatResponseService.new.call(params[:message])
    render json: { response: response }
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
