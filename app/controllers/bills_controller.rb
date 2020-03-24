class BillsController < ApplicationController
  before_action :set_bills, only: [:show, :update, :destroy]
      # GET /Bills
      def index 
        @bills = Bill.all
        render json: @bills
      end
    
      def show
        render json: @bill
      end
    
      def create
        @bill = Bill.new(bill_params)
        # @bill.split_bills.build        
        if @bill.save
          render json: @bill
          # render :show, status: :created, location: @bill
        else 
          render json: @bill.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @bill.update(bill_params)
          render json: @bill
          # render :show, status: :ok, location: @bill
        else 
          render json: @bill.errors, status: unprocessable_entity
        end
      end
    
      def destroy
        @bill.destroy
        render json: @bill
      end
    
      private 
        def set_bills
          @bill = Bill.find(params[:id])
        end
    
        def bill_params
          params.require(:bill).permit(:total_amount, :due_date, :name, :interval, :household_id, split_bills_attributes: [:id, :bill_portion, :user_id, :bill_id ])
        end
end
