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
      errors.add(:birthdate, I18n.t('student.errors.birthdate.in_the_future'))
    end
  end
end
