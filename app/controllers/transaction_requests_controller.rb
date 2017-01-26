class TransactionRequestsController < ApplicationController
  before_action :set_transaction_request, only: [:show]

  # GET /transaction_requests/1
  # GET /transaction_requests/1.json
  def show
    inputID = @transaction_request.input_address_id
    @input_address = InputAddress.find(inputID)
  end

  # GET /transaction_requests/new

  def new
    @transaction_request = TransactionRequest.new
  end

  def newbtl
    @transaction_request = TransactionRequest.new
  end

  def newltb
    @transaction_request = TransactionRequest.new
  end

  # POST /transaction_requests
  # POST /transaction_requests.json
  def create
    @transaction_request = TransactionRequest.new(transaction_request_params)

    if @transaction_request.output_address_cryptocurrency_id == 2
      inputObj = InputAddress.bit_to_lit
      inputObj.update(status: '1')
    else
      inputObj = InputAddress.lit_to_bit
      inputObj.update(status: '1')
    end

    @transaction_request.input_address_id = inputObj.id
    @transaction_request.date = Time.now

    respond_to do |format|
      if @transaction_request.save
        format.html { redirect_to @transaction_request, notice: 'Transaction request was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_request }
      else
        format.html { render :new }
        format.json { render json: @transaction_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_request
      @transaction_request = TransactionRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_request_params
      params.require(:transaction_request).permit(:input_address_id, :output_address, :output_address_cryptocurrency_id, :date)
    end

    def input_address_params
      params.require(:input_address).permit(:address, :cryptocurrencyID, :status)
    end
end
