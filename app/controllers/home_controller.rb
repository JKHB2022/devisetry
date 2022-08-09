class HomeController < ApplicationController
  # Dashboard
  def index
    if current_user.present?
      # All courses
      @user_enrolled_courses = current_user.courses

      # Ongoing Courses
      course_ids = current_user.enrollments.where(ongoing_status: true).pluck(:course_id)    
      @ongoing_courses = Course.where(id: course_ids)

      #Completed Courses
      course_ids = current_user.enrollments.where(completed_status: true).pluck(:course_id)
      @completed_courses = Course.where(id: course_ids)
    end
  end
end
