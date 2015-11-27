class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :subject_items

  validates :first_name, :last_name, presence: true
  validate :birthdate_cannot_be_in_the_future

  def birthdate_cannot_be_in_the_future
    if birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, I18n.t('activerecord.errors.in_the_future'))
    end
  end

  def paid_tuition_for_this_month?
    this_month_payments = payments.select do |payment|
      today = Date.today
      payment.date.month == today.month && payment.date.year == today.year
    end

    this_month_amount = this_month_payments.inject(0) { |sum, payment| sum += payment.amount }
    this_month_amount >= Payment::TUITION
  end
end
