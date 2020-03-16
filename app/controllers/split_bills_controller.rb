class SplitBillsController < ApplicationController
        # GET /Split_bills
        def index 
          @split_bills = Split_bill.all
        end
      
        def show
        end
      
        def create
          @split_bill = Split_bill.new(split_bill_params)
          if @split_bill.save
            render :show, status: :created, location: @split_bill
          else 
            render json: @split_bill.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @split_bill.update(split_bill_params)
            render :show, status: :ok, location: @split_bill
          else 
            render json: @split_bill.errors, status: unprocessable_entity
          end
        end
      
        def destroy
          @split_bill.destroy
        end
      
        private 
          def set_split_bills
            @split_bill = split_bill.find(params[:id])
          end
      
          def split_bill_params
            params.require(:split_bill).permit(:bill_portion, :bill_id, :user_id)
          end
end
