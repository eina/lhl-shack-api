class BillsController < ApplicationController
  before_action :set_bills, only: [:show, :update, :destroy]
      # GET /Bills
      def index 
        household_id = params[:household_id]
        bill_uuid = params[:bill_uuid]

        if household_id.blank? 
          @bills = Bill.all
        else 
          @bills = Bill.where(household_id: household_id)
        end

        if bill_uuid.blank?
          @bills = Bill.all
        else 
          @bills = Bill.where(bill_uuid: bill_uuid)
        end

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
          params.require(:bill).permit(:total_amount, :due_date, :name, :interval, :user_amount, :household_id, :user_id, :bill_uuid)
        end
end
