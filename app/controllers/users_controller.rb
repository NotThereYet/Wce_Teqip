class UsersController < ApplicationController
	require 'date'

	def homepage
		@notices = Notice.all.order("created_at DESC")
		@Activities =  Activity.all.order("event_date DESC")
		@past_activities = Array.new
		@upcoming_activities =  Array.new
		count_u = 0
		count_p = 0
		for activity in @Activities
			if activity.event_date >= Date.today
				@upcoming_activities.insert(count_u,activity)
				count_u = count_u + 1
			else
				@past_activities.insert(count_p,activity)
				count_p = count_p + 1
			end
		end
	end

	def summary_page
		if current_user.user_type == "Director"
			@proposals = Proposal.where(:cancelled => "No").order("created_at DESC")
		elsif current_user.user_type == "Deputy_director"
			@proposals = Proposal.where(:cancelled => "No").order("created_at DESC")
		elsif current_user.user_type == "HOD_CSE"	
			@proposals = Proposal.where(:branch => "CSE", :cancelled => "No")
		elsif current_user.user_type == "HOD_IT"	
			@proposals = Proposal.where(:branch => "IT", :cancelled => "No")
		elsif current_user.user_type == "HOD_Electrical"	
			@proposals = Proposal.where(:branch => "Electrical", :cancelled => "No")
		elsif current_user.user_type == "HOD_Electronics"	
			@proposals = Proposal.where(:branch => "Electronics", :cancelled => "No")
		elsif current_user.user_type == "HOD_Civil"	
			@proposals = Proposal.where(:branch => "Civil", :cancelled => "No")
		elsif current_user.user_type == "HOD_Mechanical"	
			@proposals = Proposal.where(:branch => "Mechanical", :cancelled => "No")
		elsif current_user.user_type == "Admin"	
			@proposals = Proposal.where(:cancelled => "No").order("created_at DESC")
		end			
	end

	def update

		@user = User.find(params[:id])
		if @user.update(user_params)
			if current_user.user_type == "Admin"
			redirect_to users_path
		else
			redirect_back(fallback_location: user_path(current_user))
		end
		else 
			render 'edit'
		end
	end

	def profile_page
		@user = current_user
		if @user.user_type == "Student"
			@studets = Studentdetail.where(:user_id => current_user.id)
			if @studets.size > 0
				for studet in @studets
					@studet = studet
					break
				end
			else
				redirect_to new_studentdetail_path
			end
		elsif @user.user_type == "Teacher"
			@profdets = Profdetail.where(:user_id =>  current_user.id)
			if @profdets.size > 0
				for studet in @profdets
					@profdet = studet
					break
				end
			else
				redirect_to new_profdetail_path
			end
		end
		
	end
	def edit_profile_page
		@user = current_user
		if current_user.user_type == "Student"
			@studets = Studentdetail.where(:user_id => current_user.id)
			if @studets.size > 0
				for studet in @studets
					@studet = studet
					break
				end
			end
		elsif current_user.user_type == "Teacher"
			@profdets = Profdetail.where(:user_id => current_user.id)
			if @profdets.size > 0
				for profdet in @profdets
					@profdet = profdet
					break
				end
			end
		end
			
	end

	def admin_profile
		@user = User.find(params[:passed_user])
	end

	def prof_profile
		@user = User.find(params[:passed_user])
	end

	def destroy
		@user = User.find(params[:id])
		if current_user.user_type == "Admin"
			if @user.destroy
				redirect_to users_path
			else
				flash[:alert] = "Unable to delete User"
			end
		end
	end
	private
	def user_params
		params.require(:user).permit(:full_name,:active_admin,:user_type)
	end
end
