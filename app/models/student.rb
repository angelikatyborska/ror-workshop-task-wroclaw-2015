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

  def paid_tuition_for_given_month?(date)
    payments_for_given_month = payments.select do |payment|
      payment.date.month == date.month && payment.date.year == date.year
    end

    amount_for_given_month = payments_for_given_month.inject(0) { |sum, payment| sum += payment.amount }
    amount_for_given_month >= Payment::TUITION
  end
end
