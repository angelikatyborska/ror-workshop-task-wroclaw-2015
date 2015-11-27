require 'rails_helper'

RSpec.describe Payment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :student }
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :date }

    context 'with a date in the future' do
      let(:student) { create :student }
      subject { build :payment, amount: 40, student: student, date: Date.today + 1000 }

      it { is_expected.to_not be_valid }
    end

    context 'with a non-positive amount' do
      let(:student) { create :student }
      subject { build :payment, amount: 0, student: student, date: Date.today }

      it { is_expected.to_not be_valid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :amount }
    it { should have_db_column :date }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
