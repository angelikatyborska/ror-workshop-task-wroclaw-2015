require 'spec_helper'

feature 'User checks payment details' do
  let(:student) { create :student, first_name: 'Jan', last_name: 'Kowalski' }
  let!(:payment) { create :payment, amount: 12.34, date: '2000-03-14', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments » Jan Kowalski - 2000-03-14 - $12.34'
    end
  end
end
