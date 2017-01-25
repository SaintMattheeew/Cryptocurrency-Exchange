class InputAddress < ActiveRecord::Base
  belongs_to :cryptocurrency

  def self.bit_to_lit
    InputAddress.where(status:  '1', cryptocurrency_id: '1').first
  end

  def self.lit_to_bit
    InputAddress.where(status:  '1', cryptocurrency_id: '2').first
  end

end
