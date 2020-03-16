class DocumentsController < ApplicationController
  # GET /Documents
  def index 
    @documents = Documents.all
  end

  def show
  end

  def create
    @document = Document.new(document_params)
    if @Document.save
      render :show, status: :created, location: @document
    else 
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def update
    if @document.update(document_params)
      render :show, status: :ok, location: @document
    else 
      render json: @document.errors, status: unprocessable_entity
    end
  end

  def destroy
    @document.destroy
  end

  private 
    def set_households
      @document = document.find(params[:id])
    end

    def household_params
      params.require(:document).permit(:s3_identifier)
    end
end
