require 'rails_helper'

RSpec.describe Payment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :student }
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :date }
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
