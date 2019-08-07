class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrollment_for_current_lesson, only: [:show]

	def show
	end

  private

  	def require_enrollment_for_current_lesson
			if !current_user.enrolled_in?(course)
      	redirect_to course_path(course) , alert: 'Please enroll before proceeding'
			end
		end

  helper_method :current_lesson

	  def course
 	    course = current_lesson.section.course
	  end

	  def enrolled_in?(course)
		  return enrolled_courses.include?(course)
	  end

		def current_lesson
			@current_lesson ||= Lesson.find(params[:id])
		end

end
