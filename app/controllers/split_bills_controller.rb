class SplitBillsController < ApplicationController
  before_action :set_split_bills, only: [:show, :update, :destroy]
        # GET /Split_bills
        def index 
          @split_bills = SplitBill.all
          render json: @split_bills
        end
      
        def show
          render json: @split_bills
        end
      
        def create
          @split_bill = SplitBill.new(split_bill_params)
          if @split_bill.save
            render json: @split_bills, status: :created
            # render :show, status: :created, location: @split_bill
          else 
            render json: @split_bill.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @split_bill.update(split_bill_params)
            render json: @split_bills, status: :ok
            # render :show, status: :ok, location: @split_bill
          else 
            render json: @split_bill.errors, status: unprocessable_entity
          end
        end
      
        def destroy
          @split_bill.destroy
          render json: @split_bills, status: :ok
        end
      
        private 
          def set_split_bills
            @split_bill = SplitBill.find(params[:id])
          end
      
          def split_bill_params
            params.require(:split_bill).permit(:bill_portion, :bill_id, :user_id)
          end
end
