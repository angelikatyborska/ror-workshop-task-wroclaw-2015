class PaymentDecorator < Draper::Decorator
  delegate_all

  def formatted_amount
    h.number_to_currency(amount)
  end
end
