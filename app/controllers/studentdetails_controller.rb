class StudentdetailsController < ApplicationController
	before_action :authenticate_user!

	def new
		@stu_det = Studentdetail.new
	end
	
	def create
		@stu_check = Studentdetail.where(:user_id => current_user.id)
		@stu_det = Studentdetail.new(studet_params)
		@stu_det.user_id = current_user.id
		unless @stu_check.size > 0
			if @stu_det.save
				redirect_to profile_page_path(passed_user: current_user)
			else
				redirect_to new_studentdetail_path	
				flash[:error] = "Unable to save profile details"
			end
		end
	end

	def edit
		@stu_det =  Studentdetail.find(params[:id])

	end

	def update
		@stu_det =  Studentdetail.find(params[:id])
		if @stu_det.user_id == current_user.id
			if @stu_det.update(studet_params)
				redirect_to profile_page_path(passed_user: current_user)
			else
				redirect_to homepage_path
			end
		end
	end
	private
	def studet_params
		params.require(:studentdetail).permit(:year,:dob,:branch,:prn,:gender,:contact_no,:address,:user_id)
	end
end
