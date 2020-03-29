class MessagesController < ApplicationController
  before_action :set_messages, only: [:show, :update, :destroy]

  # GET /messages
  def index 
    if params.values_at(:household_id,:limit_by).all?(&:present?) 
      @messages = Message.filter_by_household_with_limit(params)
    elsif params.values_at(:household_id).all?(&:present?) 
      @messages = Message.filter_by_household(params)    
    else
      @messages = Message.all
    end
    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created
      # render :show, status: :created, location: @message
    else 
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH /messages/1
  # PUT 
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
      params.require(:message).permit(:message_text, :message_title, :author, :household_id)
    end  
end
