class ProposalsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		if params[:passed_title] != nil
			$title = params[:passed_title]
		end
		@proposal = Proposal.new	
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
		    
	def attending_workshop
		@proposal = Proposal.new
	end
	def organizing_event 
		@proposal = Proposal.new
	end
	def organizing_workshop 
		@proposal = Proposal.new
	end
	def research_assistantship 
		@proposal = Proposal.new
	end
	def gate_reg 
		@proposal = Proposal.new
	end
	def organizing_training_program 
		@proposal = Proposal.new
	end
	def industrial_visits 
		@proposal = Proposal.new
	end
	def attending_internship 
		@proposal = Proposal.new
	end
	def inviting_industry 
		@proposal = Proposal.new
	end
	def campus_training 
		@proposal = Proposal.new
	end
	def research_publication 
		@proposal = Proposal.new
	end
	def patenting 
		@proposal = Proposal.new
	end
	def delivering_lectures 
		@proposal = Proposal.new
	end
	def project_funding 
		@proposal = Proposal.new
	end
	def seed_grant
		@proposal = Proposal.new
	end
	def qualification_upgradation
		@proposal = Proposal.new
	end
	def alt_new
		
		$title = nil
		@proposal = Proposal.new	
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
	def index
		@proposals = Proposal.where(:user_id => current_user.id).order("created_at DESC")
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



	def approved_proposals
		if current_user.user_type == "Director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes").order("created_at DESC")
		elsif current_user.user_type == "Deputy_director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes").order("created_at DESC")
		elsif current_user.user_type == "HOD_CSE"	
			@proposals = Proposal.where(:branch => "CSE", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "HOD_IT"	
			@proposals = Proposal.where(:branch => "IT", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "HOD_Electrical"	
			@proposals = Proposal.where(:branch => "Electrical", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "HOD_Electronics"	
			@proposals = Proposal.where(:branch => "Electronics", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "HOD_Civil"	
			@proposals = Proposal.where(:branch => "Civil", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "HOD_Mechanical"	
			@proposals = Proposal.where(:branch => "Mechanical", :cancelled => "No",:approved => "Yes")
		elsif current_user.user_type == "Admin"	
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes").order("created_at DESC")
		end	
	end
	def sanctioned_proposals
		if current_user.user_type == "Director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes").order("created_at DESC")
		elsif current_user.user_type == "Deputy_director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes").order("created_at DESC")
		elsif current_user.user_type == "HOD_CSE"	
			@proposals = Proposal.where(:branch => "CSE", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "HOD_IT"	
			@proposals = Proposal.where(:branch => "IT", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "HOD_Electrical"	
			@proposals = Proposal.where(:branch => "Electrical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "HOD_Electronics"	
			@proposals = Proposal.where(:branch => "Electronics", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "HOD_Civil"	
			@proposals = Proposal.where(:branch => "Civil", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "HOD_Mechanical"	
			@proposals = Proposal.where(:branch => "Mechanical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes")
		elsif current_user.user_type == "Admin"	
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes").order("created_at DESC")
		end	
	end
	def debited_proposals
		if current_user.user_type == "Director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes").order("created_at DESC")
		elsif current_user.user_type == "Deputy_director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes").order("created_at DESC")
		elsif current_user.user_type == "HOD_CSE"	
			@proposals = Proposal.where(:branch => "CSE", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "HOD_IT"	
			@proposals = Proposal.where(:branch => "IT", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "HOD_Electrical"	
			@proposals = Proposal.where(:branch => "Electrical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "HOD_Electronics"	
			@proposals = Proposal.where(:branch => "Electronics", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "HOD_Civil"	
			@proposals = Proposal.where(:branch => "Civil", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "HOD_Mechanical"	
			@proposals = Proposal.where(:branch => "Mechanical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes")
		elsif current_user.user_type == "Admin"	
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes" ,:sanctioned => "Yes",:debited_to_acc => "Yes").order("created_at DESC")
		end	
	end
	def bill_sub_proposals
		if current_user.user_type == "Director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes").order("created_at DESC")
		elsif current_user.user_type == "Deputy_director"
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes").order("created_at DESC")
		elsif current_user.user_type == "HOD_CSE"	
			@proposals = Proposal.where(:branch => "CSE", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "HOD_IT"	
			@proposals = Proposal.where(:branch => "IT", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "HOD_Electrical"	
			@proposals = Proposal.where(:branch => "Electrical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "HOD_Electronics"	
			@proposals = Proposal.where(:branch => "Electronics", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "HOD_Civil"	
			@proposals = Proposal.where(:branch => "Civil", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "HOD_Mechanical"	
			@proposals = Proposal.where(:branch => "Mechanical", :cancelled => "No",:approved => "Yes",:submit_bill => "Yes")
		elsif current_user.user_type == "Admin"	
			@proposals = Proposal.where(:cancelled => "No",:approved => "Yes",:submit_bill => "Yes").order("created_at DESC")
		end	
	end



	def create

		@proposal = Proposal.new(proposal_params)
		@proposal.user_id = current_user.id
		@proposal.proposer_name = current_user.full_name
		@proposal.proposer_type = current_user.user_type

			if current_user.user_type == "Student"
				@student_det =  Studentdetail.where(:user_id => current_user.id)
				for stu in @student_det
					@stu = stu
					break
				end
				@proposal.branch = @stu.branch
				@proposal.year = @stu.year
			end
			if current_user.user_type == "Teacher"
				@student_det =  Profdetail.where(:user_id => current_user.id)
				for stu in @student_det
					@stu = stu
					break
				end
				@proposal.branch = @stu.branch
				
			end
			
			if @proposal.save
				@proposal.requested_amount = @proposal.course_fees + @proposal.travel + @proposal.lodging + @proposal.sundry + @proposal.trainer_fee + @proposal.hospitality + @proposal.others_fees + @proposal.publication_fee + @proposal.patenting_fee + @proposal.project_fee + @proposal.thesis_fee + @proposal.consumables_fee + @proposal.qualification_fee
				@proposal.save
				redirect_to proposal_path(@proposal)
			else
				flash[:error] = "Unable to add Application, try again later or contact Administrator"
			end	
	end
	def edit
		@proposal = Proposal.find(params[:id])
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
	def cancel_proposal
		@proposal = Proposal.find(params[:passed_proposal])
		if @proposal.user_id == current_user.id && @proposal.cancelled == "No"
			@proposal.cancelled = "Yes"
			if @proposal.save
				redirect_to proposal_path(@proposal)
			end
		end
	end
	def update
		@proposal = Proposal.find(params[:id])
		if @proposal.update(proposal_params)
			if @proposal.approved == "Yes"
			@proposal.sanctioned_amount = @proposal.course_fees_sanctioned + @proposal.travel_sanctioned + @proposal.lodging_sanctioned + @proposal.sundry_sanctioned + @proposal.trainer_fee_sanctioned + @proposal.hospitality_sanctioned + @proposal.others_fees_sanctioned + @proposal.express_fees + @proposal.publication_fee_sanctioned + @proposal.patenting_fee_sanctioned + @proposal.project_fee_sanctioned + @proposal.thesis_fee_sanctioned + @proposal.consumables_fee_sanctioned + @proposal.qualification_fee_sanctioned
				@proposal.save
				
			end
			if @proposal.approved == "No"
				@proposal.sanctioned = "No"
				@proposal.save
				
			end
			redirect_to proposal_path(@proposal) 
				
			
		else
		end
	end
	def same_error
		@title = params[:passed_title]
	end
	def destroy
		@proposal = Proposal.find(params[:id])
		if @proposal.destroy
			if current_user.user_type == "Student" || current_user.user_type == "Teacher"
				redirect_to proposals_path
			elsif current_user.user_type == "Admin" || current_user.user_type == "Director" || current_user.user_type == "Deputy_director"
			redirect_to summary_page_path
			end
		else
			flash[:notice] = "Unable to delete proposal, try again later.If problem persists, contact Admin."	
		end
	end
	def show
		@proposal = Proposal.find(params[:id])
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
	def download_pdf
    proposal = Proposal.find(params[:id])
      send_file(proposal.attachment.path,
              :disposition => 'attachment',
              :url_based_filename => false)
     
    end
	private
	def proposal_params
		params.require(:proposal).permit(:proposal_type,:user_id,:proposer_name,:proposer_type,:title,:desc,:start_date,:end_date,:approved,:sanctioned,:requested_amount,:sanctioned_amount,:attachment,:sanction_summary,:course_fees,:travel,:lodging,:sundry,:trainer_fee,:hospitality,:others_reason,:others_fees,:branch,:year,:cancelled,:debited_to_acc,:submit_bill,:course_fees_sanctioned ,:travel_sanctioned ,:lodging_sanctioned ,:sundry_sanctioned ,:trainer_fee_sanctioned ,:hospitality_sanctioned ,:others_fees_sanctioned,:express_fees,:express_reason,:conclusion,:expecations,:publication_fee,:patenting_fee,:project_fee,:thesis_fee,:consumables_fee,:qualification_fee,:consumables_fee_sanctioned,:qualification_fee_sanctioned,:publication_fee_sanctioned,:patenting_fee_sanctioned,:project_fee_sanctioned,:thesis_fee_sanctioned)
	end
end
