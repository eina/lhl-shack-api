class BillsController < ApplicationController
      # GET /Bills
      def index 
        @bills = Bill.all
      end
    
      def show
      end
    
      def create
        @bill = Bill.new(bill_params)
        if @Bill.save
          render :show, status: :created, location: @bill
        else 
          render json: @bill.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @bill.update(bill_params)
          render :show, status: :ok, location: @bill
        else 
          render json: @bill.errors, status: unprocessable_entity
        end
      end
    
      def destroy
        @bill.destroy
      end
    
      private 
        def set_bills
          @bill = bill.find(params[:id])
        end
    
        def bill_params
          params.require(:bill).permit(:total_amount, :due_date, :name, :interval, :household_id)
        end
end
