class NoticesController < ApplicationController
	def new
		@notice = Notice.new
		@notices = Notice.all.order("created_at DESC")

	end

	def show
		@notice = Notice.find(params[:id])
		@notices = Notice.all.order("created_at DESC")
	end

	def index
		@notice = Notice.last
		@notices = Notice.all.order("created_at DESC")
	end

	def create
		@notice = Notice.new(notice_params)
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @notice.save
					redirect_to notices_path
				else
					redirect_to new_notice_path
					flash[:error] = "Cant save the notice, please try again or contact the system administrator"
				end
			end
		end

	end

	def edit
		@notices = Notice.all.order("created_at DESC")
		@notice = Notice.find(params[:id])
	end

	def update
		@notice = Notice.find(params[:id])
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @notice.update(notice_params)
					redirect_to notices_path
				else
					redirect_to edit_notice_path
					flash[:error] = "Cant save the notice, please try again or contact the system administrator"
				end
			end
		end
	end
	def destroy
		@notice = Notice.find(params[:id])
		if user_signed_in?
			if current_user.user_type == "Admin"
				if @notice.destroy
					redirect_to notices_path
				else
					redirect_to notice_path(@notice)
				end	
			end
		end
	end
	private
	def notice_params
		params.require(:notice).permit(:title,:desc)
	end
end
