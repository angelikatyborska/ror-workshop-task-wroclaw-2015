class PaymentDecorator < BaseDecorator
  def formatted_amount
    h.number_to_currency(amount)
  end
end
