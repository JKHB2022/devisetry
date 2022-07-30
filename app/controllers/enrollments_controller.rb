class EnrollmentsController < ApplicationController

	def create
		enroll = Enrollment.new
		enroll.user_id = current_user.id
		enroll.course_id = params[:course_id]
		enroll.save
		flash[:notice] = "You have been successfully Enrolled!"
		redirect_to root_path
	end	

	def new
		binding.pry
	end
end
