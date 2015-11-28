require 'spec_helper'

feature 'User edits payment' do
  let!(:student_1) { create :student, first_name: 'Jan', last_name: 'Kowalski' }
  let!(:student_2) { create :student, first_name: 'Anna', last_name: 'Nowak' }
  let!(:payment) { create :payment, amount: 12.34, date: '2000-03-14', student: student_1}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments  » Jan Kowalski - 2000-03-14 - $12.34'
    end
  end

  scenario 'with valid input' do
    fill_in 'Amount', with: '23.45'
    click_button 'Update Payment'
    expect(page).to have_content 'Payment has been updated!'
    expect(page).to have_content '23.45'
  end

  scenario 'with invalid input' do
    fill_in 'Amount', with: ''
    click_button 'Update Payment'
    expect(page).to have_content "can't be blank"
  end

  scenario 'by changing date' do
    select '15', :from => 'payment_date_3i'
    select 'May', :from => 'payment_date_2i'
    select '2010', :from => 'payment_date_1i'
    click_button 'Update Payment'
    expect(page).to have_content '2010-05-15'
  end

  scenario 'by changing student' do
    select 'Anna Nowak', :from => 'payment_student_id'
    click_button 'Update Payment'
    expect(page).to have_content 'Anna Nowak'
  end
end
