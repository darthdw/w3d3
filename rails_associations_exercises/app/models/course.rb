# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  #   Only works with a single instructor per course. Lower version is more
  #   realistic.
  #
  # has_one :instructor,
  #   primary_key: :instructor_id,
  #   foreign_key: :id,
  #   class_name: :User

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

end
