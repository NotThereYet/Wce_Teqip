class ProfdetailsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@profdetail = Profdetail.new
	end
	def create
		@prof_check = Studentdetail.where(:user_id => current_user.id)
		@profdetail = Profdetail.new(prof_params)
		@profdetail.user_id = current_user.id
		unless @prof_check.size > 0
			if @profdetail.save
				redirect_to profile_page_path(passed_user: current_user)
			else
				redirect_to new_profdetail_path	
				flash[:error] = "Unable to save profile details"
			end
		end
	end

	private
		def prof_params
			params.require(:profdetail).permit(:branch,:gender,:contact_no,:address,:user_id)
		end

end
