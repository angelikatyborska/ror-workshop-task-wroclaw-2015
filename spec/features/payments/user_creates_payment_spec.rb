require 'spec_helper'

feature 'User creates payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Kowalski' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    select 'Jan Kowalski', :from => 'payment_student_id'
    select '14', :from => 'payment_date_3i'
    select 'March', :from => 'payment_date_2i'
    select '2000', :from => 'payment_date_1i'
    fill_in 'Amount', with: '12.34'
    click_button 'Create Payment'
    expect(page).to have_content 'Payment has been created!'
  end

  scenario 'without amount' do
    select 'Jan Kowalski', :from => 'payment_student_id'
    select '14', :from => 'payment_date_3i'
    select 'March', :from => 'payment_date_2i'
    select '2000', :from => 'payment_date_1i'
    click_button 'Create Payment'
    expect(page).to have_content "can't be blank"
  end
end
