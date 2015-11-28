require 'spec_helper'

feature 'User deletes payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Kowalski' }
  let!(:payment) { create :payment, amount: 12.34, date: '2000-03-14', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content 'Payment has been deleted!'
    expect(page).to have_no_content '12.34'
  end
end
