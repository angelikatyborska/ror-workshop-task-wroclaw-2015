require 'spec_helper'

describe PaymentDecorator do
  let(:student) { create :student }
  let(:payment) { create :payment, amount: 45, student: student}

  describe "#formatted_amount" do
    subject { payment.decorate.formatted_amount }
    it { is_expected.to eq '$45.00' }
  end
end
