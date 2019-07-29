class LessonsController < ApplicationController

	def show
		@lesson = current_user.lesson(course_params)
		if @course.valid?
			redirect_to instructor_course_path(@course)
		else
			render :new, status: :unprocessable_entity
		end
	end	end

  private

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

	def require_authorized_for_current_lesson
		if current_course.user != current_user
			return render plain: 'Unauthorized', status: :unauthorized
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Course.find(params[:course_lesson])
	end

	def course_params
		params.require(:course).permit(:title, :description, :cost, :image)
	end


end
