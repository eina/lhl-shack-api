class MessagesController < ApplicationController
  before_action :set_messages, only: [:show, :update, :destroy]

  # GET /messages
  def index 
    @messages = Message.all
    render json: @messages
  end

  def show
    render json: @message
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created
      # render :show, status: :created, location: @message
    else 
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      render json: @message, status: :ok
      # render :show, status: :ok, location: @message
    else 
      render json: @message.errors, status: unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    render json: @messages, status: :ok
  end

  private 
    def set_messages
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:message, :author, :household_id)
    end  
end
