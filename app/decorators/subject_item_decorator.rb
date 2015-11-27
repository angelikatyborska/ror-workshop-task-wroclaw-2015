class SubjectItemDecorator < BaseDecorator
  def title_with_assigned_teacher
    teacher.present? ? "#{title} (#{teacher.decorate.full_name})" : title
  end
end
