class TransactionRequest < ActiveRecord::Base
  belongs_to :input_address
  belongs_to :output_address_cryptocurrency
end
