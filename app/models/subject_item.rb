class SubjectItem < ActiveRecord::Base
  belongs_to :teacher
  has_many :participations, dependent: :destroy
  has_many :students, through: :participations
  has_many :subject_item_notes

  validates :title, presence: true

  scope :not_assigned_or_assigned_to_teacher, -> (teacher) { where('teacher_id IS ? or teacher_id = ?', nil, teacher) }
end
