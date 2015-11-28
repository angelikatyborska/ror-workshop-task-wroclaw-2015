require 'rails_helper'

RSpec.describe Student do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }

    context 'with a birthdate in the future' do
      subject { build :student, first_name: 'Jan', last_name: 'Nowak', birthdate: Date.today + 1000 }

      it { is_expected.to_not be_valid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :birthdate }
  end

  describe 'associations' do
    it { is_expected.to have_many :subject_items }
    it { is_expected.to have_many :subject_item_notes }
    it { is_expected.to have_many :participations }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :subject_items }
  end

  describe '#paid_tuition_for_this_month?' do
    context 'having paid too little this month' do
      let(:student) { create :student }
      let(:today) { Date.today }
      let!(:payment) { create :payment, student: student, amount: Payment::TUITION / 2, date: today }
      subject { student.paid_tuition_for_given_month?(today) }

      it { is_expected.to eq false }
    end

    context 'having paid enough this month' do
      let(:student) { create :student }
      let(:today) { Date.today }
      let!(:payment) { create :payment, student: student, amount: Payment::TUITION / 0.7, date: today }
      let!(:payment) { create :payment, student: student, amount: Payment::TUITION / 0.7, date: today }
      subject { student.paid_tuition_for_given_month?(today) }

      it { is_expected.to eq true }
    end

    context 'having paid enough, but not this month' do
      let(:student) { create :student }
      let(:today) { Date.today }
      let!(:payment) { create :payment, student: student, amount: Payment::TUITION, date: today - 60}
      subject { student.paid_tuition_for_given_month?(today) }

      it { is_expected.to eq false }
    end
  end
end
