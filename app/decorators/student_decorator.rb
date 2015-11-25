class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes.map { |note| note.value }

    average_notes = notes.empty? ? 0 : notes.inject(:+).to_f / notes.length

    "#{'%.2f' % average_notes.round(2)}"
  end
end
