require 'spec_helper'

feature 'User visits payments page'  do
  let(:student) { create :student }
  let!(:payment_1) { create :payment, amount: 12.34, date: '2000-03-14', student: student}
  let!(:payment_2) { create :payment, amount: 56.78, date: '2009-01-12', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content '12.34'
    expect(page).to have_content '56.78'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
