class Payment < ActiveRecord::Base
  TUITION = 42
  belongs_to :student

  validates :student, :amount, :date, presence: true
  validates :amount, numericality: { greater_than: 0 }

  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, I18n.t('activerecord.errors.in_the_future'))
    end
  end
end
