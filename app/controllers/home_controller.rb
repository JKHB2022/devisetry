class HomeController < ApplicationController
  def index
    if current_user.present?
      @user_enrolled_courses = current_user.courses
      course_ids = current_user.enrollments.where(ongoing_status: true).pluck(:course_id)
      @ongoing_courses = Course.where(id: course_ids)
      course_ids = current_user.enrollments.where(completed_status: true).pluck(:course_id)
      @completed_courses = Course.where(id: course_ids)
    end
  end
end
