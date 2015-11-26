class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item_notes.where(subject_item: subject_item).map { |note| note.value }

    average_notes = notes.empty? ? 0 : notes.inject(:+).to_f / notes.length

    "#{'%.2f' % average_notes.round(2)}"
  end

  def formatted_birthdate
    birthdate.nil? ? '' : birthdate.strftime('%Y-%m_%d')
  end

  def paid_tuition_for_current_month?
    payments.any? do |payment|
      today = Date.today
      payment.date.month == today.month && payment.date.year == today.year
    end
  end
end
