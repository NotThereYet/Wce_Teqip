class ActivitiesController < ApplicationController

	def new
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
		@activity = Activity.new

	end
	def index
		@Activities =  Activity.all.order("event_date DESC")
		@activity = Activity.last
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

	def show
		@activity = Activity.find(params[:id])
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

	def create
		@activity = Activity.new(activity_params)
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @activity.save
					redirect_to activities_path
				else
					redirect_to new_activity_path
					flash[:error] = "Cant save the activity, please try again or contact the system administrator"
				end
			end
		end

	end

	def edit
		@activity =  Activity.find(params[:id])
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

	def update
		@activity =  Activity.find(params[:id])
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @activity.update(activity_params)
					redirect_to activities_path
				else
					redirect_to edit_activity_path
					flash[:error] = "Cant save the activity, please try again or contact the system administrator"
				end
			end
		end
	end
	def destroy
		@activity = Activity.find(params[:id])
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @activity.destroy
					redirect_to activities_path
				else
					redirect_to activity_path(@activity)
				end	
			end
		end

	end

	private
	def activity_params
		params.require(:activity).permit(:title,:desc,:event_date,:attachment)
	end

end
