class NavigationController < ApplicationController

def directors_desk
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

def statistics
	@count_cse = 0
	@count_it = 0
	@count_ele = 0
	@count_eln = 0
	@count_mech = 0
	@count_civ = 0
	@funds_cse = 0
	@funds_it = 0
	@funds_ele = 0
	@funds_eln = 0
	@funds_mech = 0
	@funds_civ = 0
	@proposals=Proposal.all
	
	for proposal in @proposals
		if proposal.branch == "CSE"
			@count_cse = @count_cse + 1
			if proposal.debited_to_acc == "Yes"
				@funds_cse = @funds_cse + proposal.sanctioned_amount
			end
		elsif proposal.branch == "IT"
			@count_it = @count_it + 1
			if proposal.debited_to_acc == "Yes"
				@funds_it = @funds_it + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Electrical"
			@count_ele = @count_ele + 1
			if proposal.debited_to_acc == "Yes"
				@funds_ele = @funds_ele + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Mechanical" 
			@count_mech= @count_mech + 1
			if proposal.debited_to_acc == "Yes"
				@funds_mech = @funds_mech + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Civil"
			@count_civ = @count_civ + 1
			if proposal.debited_to_acc == "Yes"
				@funds_civ = @funds_civ + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Electronics"
			@count_eln = @count_eln + 1
			if proposal.debited_to_acc == "Yes"
				@funds_eln = @funds_eln + proposal.sanctioned_amount
			end
		end
			
	end
@total_sanctioned_amount = @funds_cse + @funds_it + @funds_ele + @funds_eln + @funds_mech + @funds_civ
end


	def p_type_graph

		 attending_workshop = "Attending Workshop"
		 organizing_event = "Organizing Event"
		 organizing_workshop = "Organizing workshop"
		 research_assistantship = "Research Assistantship"
		 gate_reg = "GATE Reg/Coaching"
		 organizing_training_program = "Organizing short term training programme for students"
		 industrial_visits = "Industrial visits"
		 attending_internship = "Attending Internship"
		 inviting_industry = "Inviting Industry"
		 campus_training = "Training for campus job interviews"
		 research_publication = "Publication of research papers"
		 patenting = "Patenting of research products"
		 delivering_lectures = "Delivering expert lectures in the project institutions"
		 project_funding = "Project Funding"
		 seed_grant = "Seed Grant"
		 qualification_upgradation = "Qualification Upgradation"

		@attending_workshop = Proposal.where(:proposal_type => attending_workshop)
		@organizing_event = Proposal.where(:proposal_type => organizing_event)
		@organizing_workshop = Proposal.where(:proposal_type => organizing_workshop)
		@research_assistantship = Proposal.where(:proposal_type => research_assistantship)
		@gate_reg = Proposal.where(:proposal_type => gate_reg)
		@organizing_training_program = Proposal.where(:proposal_type => organizing_training_program )
		@industrial_visits = Proposal.where(:proposal_type => industrial_visits)
		@attending_internship = Proposal.where(:proposal_type => attending_internship)
		@inviting_industry = Proposal.where(:proposal_type => inviting_industry)
		@campus_training = Proposal.where(:proposal_type => campus_training)
		@research_publication = Proposal.where(:proposal_type =>research_publication)
		@patenting = Proposal.where(:proposal_type =>patenting)
		@delivering_lectures = Proposal.where(:proposal_type => delivering_lectures)
		@project_funding = Proposal.where(:proposal_type => project_funding)
		@seed_grant = Proposal.where(:proposal_type => seed_grant)
		@qualification_upgradation = Proposal.where(:proposal_type => qualification_upgradation)

		@attending_workshop_amount = 0 
		@organizing_event_amount = 0
		@organizing_workshop_amount = 0
		@research_assistantship_amount = 0
		@gate_reg_amount = 0
		@organizing_training_program_amount = 0
		@industrial_visits_amount = 0
		@attending_internship_amount = 0
		@inviting_industry_amount = 0
		@campus_training_amount = 0
		@research_publication_amount = 0
		@patenting_amount = 0
		@delivering_lectures_amount = 0
		@project_funding_amount = 0
		@seed_grant_amount = 0
		@qualification_upgradation_amount = 0
		
		if @attending_workshop.size > 0
			for att in @attending_workshop
			 @attending_workshop_amount = att.sanctioned_amount
			end
		end
		if @organizing_event.size > 0
			for att in @organizing_event
			 @organizing_event_amount = att.sanctioned_amount
			end
		end
		if @organizing_workshop.size > 0
			for att in @organizing_workshop
			 @organizing_workshop_amount = att.sanctioned_amount
			end
		end

		if @gate_reg.size > 0
			for att in @gate_reg
			 @gate_reg_amount = att.sanctioned_amount
			end
		end
		if @organizing_training_program.size > 0
			for att in @organizing_training_program
			 @organizing_training_program_amount = att.sanctioned_amount
			end
		end
		if @research_assistantship.size > 0
			for att in @research_assistantship
			 @research_assistantship_amount = att.sanctioned_amount
			end
		end
		if @industrial_visits.size > 0
			for att in @industrial_visits
			 @industrial_visits_amount = att.sanctioned_amount
			end
		end
		if @attending_internship.size > 0
			for att in @attending_internship
			 @attending_internship_amount = att.sanctioned_amount
			end
		end
		if @inviting_industry.size > 0
			for att in @inviting_industry
			 @inviting_industry_amount = att.sanctioned_amount
			end
		end

		if @campus_training.size > 0
			for att in @campus_training
			 @campus_training_amount = att.sanctioned_amount
			end
		end
		if @research_publication.size > 0
			for att in @research_publication
			 @research_publication_amount = att.sanctioned_amount
			end
		end
		if @patenting.size > 0
			for att in @patenting
			 @patenting_amount = att.sanctioned_amount
			end
		end
		if @delivering_lectures.size > 0
			for att in @delivering_lectures
			 @delivering_lectures_amount = att.sanctioned_amount
			end
		end
		if @project_funding.size > 0
			for att in @project_funding
			 @project_funding_amount = att.sanctioned_amount
			end
		end
		if @seed_grant.size > 0
			for att in @seed_grant
			 @seed_grant_amount = att.sanctioned_amount
			end
		end
		if @qualification_upgradation.size > 0
			for att in @qualification_upgradation
			 @qualification_upgradation_amount = att.sanctioned_amount
			end
		end


		@First_year_proposals = Proposal.where(:year => "First")
		@Second_year_proposals = Proposal.where(:year => "Second")
		@Third_year_proposals = Proposal.where(:year => "Third")
		@Fourth_year_proposals = Proposal.where(:year => "Fourth")
		@MTech_First_year_proposals = Proposal.where(:year => "MTech_First")
		@MTech_Second_year_proposals = Proposal.where(:year => "MTech_Second")


		@First_year_proposals_amount = 0	
		@Second_year_proposals_amount = 0	
		@Third_year_proposals_amount = 0	
		@Fourth_year_proposals_amount = 0	
		@MTech_First_year_proposals_amount = 0	
		@MTech_Second_year_proposals_amount = 0	

		if @First_year_proposals.size > 0
			for att in @First_year_proposals
			 @First_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Second_year_proposals.size > 0
			for att in @Second_year_proposals
			 @Second_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Third_year_proposals.size > 0
			for att in @Third_year_proposals
			 @Third_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Fourth_year_proposals.size > 0
			for att in @Fourth_year_proposals
			 @Fourth_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @MTech_First_year_proposals.size > 0
			for att in @MTech_First_year_proposals
			 @MTech_First_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @MTech_Second_year_proposals.size > 0
			for att in @MTech_Second_year_proposals
			 @MTech_Second_year_proposals_amount = att.sanctioned_amount
			end
		end

		
	end


	def cse_graph

		@proposals = Proposal.where(:branch => "CSE")
		
		@first_year = Array.new
		@second_year = Array.new
		@third_year = Array.new
		@fourth_year = Array.new
		@mtech_first_year = Array.new
		@mtech_second_year = Array.new
		
		count_first = 0
		count_second = 0
		count_third = 0
		count_fourth = 0
		count_mtech_first = 0
		count_mtech_second = 0


		if @proposals.size > 0
			for proposal in @proposals
				if proposal.year == "First"
					@first_year.insert(count_first,proposal)
				end
				if proposal.year == "Second"
					@second_year.insert(count_second,proposal)
				end
				if proposal.year == "Third"
					@third_year.insert(count_third,proposal)
				end
				if proposal.year == "Fourth"
					@fourth_year.insert(count_fourth,proposal)
				end
				if proposal.year == "MTech_First"
					@mtech_first_year.insert(count_mtech_first,proposal)
				end
				if proposal.year == "MTech_Second"
					@mtech_second_year.insert(count_mtech_second,proposal)
				end
			end
		end

		@first_year_amount = 0	
		@second_year_amount = 0	
		@third_year_amount = 0	
		@fourth_year_amount = 0	
		@mtech_first_year_amount = 0	
		@mtech_second_year_amount = 0	

		if @first_year.size > 0
			for att in @first_year
			 @first_year_amount = att.sanctioned_amount
			end
		end
		if @second_year.size > 0
			for att in @second_year
			 @second_year_amount = att.sanctioned_amount
			end
		end
		if @third_year.size > 0
			for att in @third_year
			 @third_year_amount = att.sanctioned_amount
			end
		end
		if @fourth_year.size > 0
			for att in @fourth_year
			 @fourth_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_first_year.size > 0
			for att in @mtech_first_year
			 @mtech_first_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_second_year.size > 0
			for att in @mtech_second_year
			 @mtech_second_year_amount = att.sanctioned_amount
			end
		end


	end

	def civil_graph
		@proposals = Proposal.where(:branch => "Civil")
		@first_year = Array.new
		@second_year = Array.new
		@third_year = Array.new
		@fourth_year = Array.new
		@mtech_first_year = Array.new
		@mtech_second_year = Array.new
		count_first = 0

		count_second = 0
		count_third = 0
		count_fourth = 0
		count_mtech_first = 0
		count_mtech_second = 0


		if @proposals.size > 0
			for proposal in @proposals
				if proposal.year == "First"
					@first_year.insert(count_first,proposal)
				end
				if proposal.year == "Second"
					@second_year.insert(count_second,proposal)
				end
				if proposal.year == "Third"
					@third_year.insert(count_third,proposal)
				end
				if proposal.year == "Fourth"
					@fourth_year.insert(count_fourth,proposal)
				end
				if proposal.year == "MTech_First"
					@mtech_first_year.insert(count_mtech_first,proposal)
				end
				if proposal.year == "MTech_Second"
					@mtech_second_year.insert(count_mtech_second,proposal)
				end
			end
		end

		@first_year_amount = 0	
		@second_year_amount = 0	
		@third_year_amount = 0	
		@fourth_year_amount = 0	
		@mtech_first_year_amount = 0	
		@mtech_second_year_amount = 0	

		if @first_year.size > 0
			for att in @first_year
			 @first_year_amount = att.sanctioned_amount
			end
		end
		if @second_year.size > 0
			for att in @second_year
			 @second_year_amount = att.sanctioned_amount
			end
		end
		if @third_year.size > 0
			for att in @third_year
			 @third_year_amount = att.sanctioned_amount
			end
		end
		if @fourth_year.size > 0
			for att in @fourth_year
			 @fourth_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_first_year.size > 0
			for att in @mtech_first_year
			 @mtech_first_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_second_year.size > 0
			for att in @mtech_second_year
			 @mtech_second_year_amount = att.sanctioned_amount
			end
		end
		
	end

def mech_graph
	@proposals = Proposal.where(:branch => "Mechanical")
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0

if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end
	

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end

end

def it_graph
	@proposals = Proposal.where(:branch => "IT")
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
end


def electrical_graph
	@proposals = Proposal.where(:branch => "Electrical")
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
	
end
def electronics_graph
	@proposals = Proposal.where(:branch => "Electronics")
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
	
end





def perf_a_report
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


def statistics_yearwise
	@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
		
	@count_cse = 0
	@count_it = 0
	@count_ele = 0
	@count_eln = 0
	@count_mech = 0
	@count_civ = 0
	@funds_cse = 0
	@funds_it = 0
	@funds_ele = 0
	@funds_eln = 0
	@funds_mech = 0
	@funds_civ = 0
	@proposals_all=Proposal.all
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
	if @proposals.size > 0
	for proposal in @proposals
		if proposal.branch == "CSE"
			@count_cse = @count_cse + 1
			if proposal.debited_to_acc == "Yes"
				@funds_cse = @funds_cse + proposal.sanctioned_amount
			end
		elsif proposal.branch == "IT"
			@count_it = @count_it + 1
			if proposal.debited_to_acc == "Yes"
				@funds_it = @funds_it + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Electrical"
			@count_ele = @count_ele + 1
			if proposal.debited_to_acc == "Yes"
				@funds_ele = @funds_ele + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Mechanical" 
			@count_mech= @count_mech + 1
			if proposal.debited_to_acc == "Yes"
				@funds_mech = @funds_mech + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Civil"
			@count_civ = @count_civ + 1
			if proposal.debited_to_acc == "Yes"
				@funds_civ = @funds_civ + proposal.sanctioned_amount
			end
		elsif proposal.branch == "Electronics"
			@count_eln = @count_eln + 1
			if proposal.debited_to_acc == "Yes"
				@funds_eln = @funds_eln + proposal.sanctioned_amount
			end
		end
			
	end
	end
@total_sanctioned_amount = @funds_cse + @funds_it + @funds_ele + @funds_eln + @funds_mech + @funds_civ

end



def p_type_graph_yearwise
	@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.all
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end

		 attending_workshop = "Attending Workshop"
		 organizing_event = "Organizing Event"
		 organizing_workshop = "Organizing workshop"
		 research_assistantship = "Research Assistantship"
		 gate_reg = "GATE Reg/Coaching"
		 organizing_training_program = "Organizing short term training programme for students"
		 industrial_visits = "Industrial visits"
		 attending_internship = "Attending Internship"
		 inviting_industry = "Inviting Industry"
		 campus_training = "Training for campus job interviews"
		 research_publication = "Publication of research papers"
		 patenting = "Patenting of research products"
		 delivering_lectures = "Delivering expert lectures in the project institutions"
		 project_funding = "Project Funding"
		 seed_grant = "Seed Grant"
		 qualification_upgradation = "Qualification Upgradation"

		@attending_workshop = Array.new
		count_awp = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == attending_workshop
				@attending_workshop.insert(count_awp,pro)
				count_awp = count_awp + 1
				end
			end
		end

		@organizing_event = Array.new
		count_ore = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == organizing_event
				@organizing_event.insert(count_ore,pro)
				count_ore = count_ore + 1
				end
			end
		end
		
		@organizing_workshop = Array.new
		count_orwp = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == organizing_workshop
				@organizing_workshop.insert(count_orwp,pro)
				count_orwp = count_orwp + 1
				end
			end
		end

		@research_assistantship = Array.new
		count_reap = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == research_assistantship
				@research_assistantship.insert(count_reap,pro)
				count_reap = count_reap + 1
				end
			end
		end
		
		@gate_reg = Array.new
			count_gate = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == gate_reg
				@gate.insert(count_gate,pro)
				count_gate = count_gate + 1
				end
			end
		end
		
		@organizing_training_program = Array.new
			count_ortp = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == organizing_training_program
				@organizing_training_program.insert(count_ortp,pro)
				count_ortp = count_ortp + 1
				end
			end
		end

		
		@industrial_visits = Array.new
			count_iv = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == industrial_visits
				@industrial_visits.insert(count_iv,pro)
				count_iv = count_iv + 1
				end
			end
		end
		
		
		@attending_internship = Array.new
			count_aip = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == attending_internship
				@attending_internship.insert(count_aip,pro)
				count_aip = count_aip + 1
				end
			end
		end

		
		@inviting_industry = Array.new
			count_ind = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == inviting_industry
				@inviting_industry.insert(count_ind,pro)
				count_ind  = count_ind + 1
				end
			end
		end
		
		@campus_training = Array.new
			count_ctn = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == campus_training
				@campus_training.insert(count_ctn,pro)
				count_ctn = count_ctn + 0
				end
			end
		end
		
		@research_publication = Array.new
			count_repu = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == research_publication
				@research_publication.insert(count_repu,pro)
				count_repu = count_repu + 1
				end
			end
		end

		
		@patenting = Array.new
			count_pat = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == patenting
				@patenting.insert(count_pat,pro)
				count_pat = count_pat + 1
				end
			end
		end
		
		
		@delivering_lectures = Array.new
			count_deli= 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == delivering_lectures
				@delivering_lectures.insert(count_deli,pro)
				count_deli = count_deli + 1
				end
			end
		end
		
		@project_funding = Array.new
			count_pf = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == project_funding
				@project_funding.insert(count_pf,pro)
				count_pf = count_pf + 1
				end
			end
		end
		
		
		@seed_grant = Array.new
			count_seed = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == seed_grant
				@seed_grant.insert(count_seed,pro)
				count_seed = count_seed + 1
				end
			end
		end
	
		
		@qualification_upgradation = Array.new
			count_qu = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.proposal_type == qualification_upgradation
				@qualification_upgradation.insert(count_qu,pro)
				count_qu = count_qu + 1
				end
			end
		end
		

		@attending_workshop_amount = 0 
		@organizing_event_amount = 0
		@organizing_workshop_amount = 0
		@research_assistantship_amount = 0
		@gate_reg_amount = 0
		@organizing_training_program_amount = 0
		@industrial_visits_amount = 0
		@attending_internship_amount = 0
		@inviting_industry_amount = 0
		@campus_training_amount = 0
		@research_publication_amount = 0
		@patenting_amount = 0
		@delivering_lectures_amount = 0
		@project_funding_amount = 0
		@seed_grant_amount = 0
		@qualification_upgradation_amount = 0
		
		if @attending_workshop.size > 0
			for att in @attending_workshop
			 @attending_workshop_amount = att.sanctioned_amount
			end
		end
		if @organizing_event.size > 0
			for att in @organizing_event
			 @organizing_event_amount = att.sanctioned_amount
			end
		end
		if @organizing_workshop.size > 0
			for att in @organizing_workshop
			 @organizing_workshop_amount = att.sanctioned_amount
			end
		end

		if @gate_reg.size > 0
			for att in @gate_reg
			 @gate_reg_amount = att.sanctioned_amount
			end
		end
		if @organizing_training_program.size > 0
			for att in @organizing_training_program
			 @organizing_training_program_amount = att.sanctioned_amount
			end
		end
		if @research_assistantship.size > 0
			for att in @research_assistantship
			 @research_assistantship_amount = att.sanctioned_amount
			end
		end
		if @industrial_visits.size > 0
			for att in @industrial_visits
			 @industrial_visits_amount = att.sanctioned_amount
			end
		end
		if @attending_internship.size > 0
			for att in @attending_internship
			 @attending_internship_amount = att.sanctioned_amount
			end
		end
		if @inviting_industry.size > 0
			for att in @inviting_industry
			 @inviting_industry_amount = att.sanctioned_amount
			end
		end

		if @campus_training.size > 0
			for att in @campus_training
			 @campus_training_amount = att.sanctioned_amount
			end
		end
		if @research_publication.size > 0
			for att in @research_publication
			 @research_publication_amount = att.sanctioned_amount
			end
		end
		if @patenting.size > 0
			for att in @patenting
			 @patenting_amount = att.sanctioned_amount
			end
		end
		if @delivering_lectures.size > 0
			for att in @delivering_lectures
			 @delivering_lectures_amount = att.sanctioned_amount
			end
		end
		if @project_funding.size > 0
			for att in @project_funding
			 @project_funding_amount = att.sanctioned_amount
			end
		end
		if @seed_grant.size > 0
			for att in @seed_grant
			 @seed_grant_amount = att.sanctioned_amount
			end
		end
		if @qualification_upgradation.size > 0
			for att in @qualification_upgradation
			 @qualification_upgradation_amount = att.sanctioned_amount
			end
		end


		@First_year_proposals = Array.new
			 count_fy = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "First"
				@First_year_proposals.insert(count_fy,pro)
				count_fy = count_fy + 1
				end
			end
		end
		
		@Second_year_proposals = Array.new
			 count_sy = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "Second"
				@Second_year_proposals.insert(count_sy,pro)
				count_sy = count_sy + 1
				end
			end
		end

		@Third_year_proposals = Array.new
			 count_ty = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "Third"
				@Third_year_proposals.insert(count_ty,pro)
				count_ty = count_ty + 1
				end
			end
		end
		
		@Fourth_year_proposals = Array.new
			 count_finy = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "Fourth"
				@Fourth_year_proposals.insert(count_finy,pro)
				count_finy = count_finy + 1
				end
			end
		end
		
		@MTech_First_year_proposals = Array.new
			 count_mfy = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "MTech_First"
				@MTech_First_year_proposals.insert(count_mfy,pro)
				count_mfy = count_mfy + 1
				end
			end
		end
	
		@MTech_Second_year_proposals = Array.new
			 count_msy = 0
		if @proposals.size > 0
			for pro in @proposals
				if pro.year == "MTech_Second"
				@MTech_Second_year_proposals.insert(count_msy,pro)
				count_msy = count_msy + 1
				end
			end
		end
		


		@First_year_proposals_amount = 0	
		@Second_year_proposals_amount = 0	
		@Third_year_proposals_amount = 0	
		@Fourth_year_proposals_amount = 0	
		@MTech_First_year_proposals_amount = 0	
		@MTech_Second_year_proposals_amount = 0	

		if @First_year_proposals.size > 0
			for att in @First_year_proposals
			 @First_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Second_year_proposals.size > 0
			for att in @Second_year_proposals
			 @Second_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Third_year_proposals.size > 0
			for att in @Third_year_proposals
			 @Third_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @Fourth_year_proposals.size > 0
			for att in @Fourth_year_proposals
			 @Fourth_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @MTech_First_year_proposals.size > 0
			for att in @MTech_First_year_proposals
			 @MTech_First_year_proposals_amount = att.sanctioned_amount
			end
		end
		if @MTech_Second_year_proposals.size > 0
			for att in @MTech_Second_year_proposals
			 @MTech_Second_year_proposals_amount = att.sanctioned_amount
			end
		end

		
	end


	def cse_graph_yearwise
		@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "CSE")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end

		
		@first_year = Array.new
		@second_year = Array.new
		@third_year = Array.new
		@fourth_year = Array.new
		@mtech_first_year = Array.new
		@mtech_second_year = Array.new
		
		count_first = 0
		count_second = 0
		count_third = 0
		count_fourth = 0
		count_mtech_first = 0
		count_mtech_second = 0


		if @proposals.size > 0
			for proposal in @proposals
				if proposal.year == "First"
					@first_year.insert(count_first,proposal)
				end
				if proposal.year == "Second"
					@second_year.insert(count_second,proposal)
				end
				if proposal.year == "Third"
					@third_year.insert(count_third,proposal)
				end
				if proposal.year == "Fourth"
					@fourth_year.insert(count_fourth,proposal)
				end
				if proposal.year == "MTech_First"
					@mtech_first_year.insert(count_mtech_first,proposal)
				end
				if proposal.year == "MTech_Second"
					@mtech_second_year.insert(count_mtech_second,proposal)
				end
			end
		end

		@first_year_amount = 0	
		@second_year_amount = 0	
		@third_year_amount = 0	
		@fourth_year_amount = 0	
		@mtech_first_year_amount = 0	
		@mtech_second_year_amount = 0	

		if @first_year.size > 0
			for att in @first_year
			 @first_year_amount = att.sanctioned_amount
			end
		end
		if @second_year.size > 0
			for att in @second_year
			 @second_year_amount = att.sanctioned_amount
			end
		end
		if @third_year.size > 0
			for att in @third_year
			 @third_year_amount = att.sanctioned_amount
			end
		end
		if @fourth_year.size > 0
			for att in @fourth_year
			 @fourth_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_first_year.size > 0
			for att in @mtech_first_year
			 @mtech_first_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_second_year.size > 0
			for att in @mtech_second_year
			 @mtech_second_year_amount = att.sanctioned_amount
			end
		end


	end

	def civil_graph_yearwise
		@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "Civil")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
		
		@first_year = Array.new
		@second_year = Array.new
		@third_year = Array.new
		@fourth_year = Array.new
		@mtech_first_year = Array.new
		@mtech_second_year = Array.new
		count_first = 0

		count_second = 0
		count_third = 0
		count_fourth = 0
		count_mtech_first = 0
		count_mtech_second = 0


		if @proposals.size > 0
			for proposal in @proposals
				if proposal.year == "First"
					@first_year.insert(count_first,proposal)
				end
				if proposal.year == "Second"
					@second_year.insert(count_second,proposal)
				end
				if proposal.year == "Third"
					@third_year.insert(count_third,proposal)
				end
				if proposal.year == "Fourth"
					@fourth_year.insert(count_fourth,proposal)
				end
				if proposal.year == "MTech_First"
					@mtech_first_year.insert(count_mtech_first,proposal)
				end
				if proposal.year == "MTech_Second"
					@mtech_second_year.insert(count_mtech_second,proposal)
				end
			end
		end

		@first_year_amount = 0	
		@second_year_amount = 0	
		@third_year_amount = 0	
		@fourth_year_amount = 0	
		@mtech_first_year_amount = 0	
		@mtech_second_year_amount = 0	

		if @first_year.size > 0
			for att in @first_year
			 @first_year_amount = att.sanctioned_amount
			end
		end
		if @second_year.size > 0
			for att in @second_year
			 @second_year_amount = att.sanctioned_amount
			end
		end
		if @third_year.size > 0
			for att in @third_year
			 @third_year_amount = att.sanctioned_amount
			end
		end
		if @fourth_year.size > 0
			for att in @fourth_year
			 @fourth_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_first_year.size > 0
			for att in @mtech_first_year
			 @mtech_first_year_amount = att.sanctioned_amount
			end
		end
		if @mtech_second_year.size > 0
			for att in @mtech_second_year
			 @mtech_second_year_amount = att.sanctioned_amount
			end
		end
		
	end

def mech_graph_yearwise
	@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "Mechanical")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0

if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end
	

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end

end

def it_graph_yearwise
	@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "IT")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
end


def electrical_graph_yearwise
@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "Electrical")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
	
end
def electronics_graph_yearwise
	@date_select = params[:passed_date]
	if @date_select == "2017-18"
		date_g = Date.new(2017,06,01)
		date_l = Date.new(2018,05,31)
	elsif @date_select == "2018-19"
		date_g = Date.new(2018,06,01)
		date_l = Date.new(2019,05,31)
	elsif @date_select == "2019-20"
		date_g = Date.new(2019,06,01)
		date_l = Date.new(2020,05,31)
	elsif @date_select == "2020-21"
		date_g = Date.new(2020,06,01)
		date_l = Date.new(2021,05,31)
	elsif @date_select == "2016-17"
		date_g = Date.new(2016,06,01)
		date_l = Date.new(2017,05,31)
	elsif @date_select == "2015-16"
		date_g = Date.new(2015,06,01)
		date_l = Date.new(2016,05,31)
	elsif @date_select == "2014-15"
		date_g = Date.new(2014,06,01)
		date_l = Date.new(2015,05,31)
	end
	@proposals_all=Proposal.where(:branch => "Electronics")
	count_pr = 0
	@proposals = Array.new

		if @proposals_all.size > 0
			for pr in @proposals_all
				if pr.created_at.to_date> date_g &&  pr.created_at.to_date < date_l
					@proposals.insert(count_pr,pr)
					count_pr = count_pr +  1
				end
			end
		end
	@first_year = Array.new
	@second_year = Array.new
	@third_year = Array.new
	@fourth_year = Array.new
	@mtech_first_year = Array.new
	@mtech_second_year = Array.new
	count_first = 0

	count_second = 0
	count_third = 0
	count_fourth = 0
	count_mtech_first = 0
	count_mtech_second = 0


	if @proposals.size > 0
		for proposal in @proposals
			if proposal.year == "First"
				@first_year.insert(count_first,proposal)
			end
			if proposal.year == "Second"
				@second_year.insert(count_second,proposal)
			end
			if proposal.year == "Third"
				@third_year.insert(count_third,proposal)
			end
			if proposal.year == "Fourth"
				@fourth_year.insert(count_fourth,proposal)
			end
			if proposal.year == "MTech_First"
				@mtech_first_year.insert(count_mtech_first,proposal)
			end
			if proposal.year == "MTech_Second"
				@mtech_second_year.insert(count_mtech_second,proposal)
			end
		end
	end

	@first_year_amount = 0	
	@second_year_amount = 0	
	@third_year_amount = 0	
	@fourth_year_amount = 0	
	@mtech_first_year_amount = 0	
	@mtech_second_year_amount = 0	

	if @first_year.size > 0
		for att in @first_year
		 @first_year_amount = att.sanctioned_amount
		end
	end
	if @second_year.size > 0
		for att in @second_year
		 @second_year_amount = att.sanctioned_amount
		end
	end
	if @third_year.size > 0
		for att in @third_year
		 @third_year_amount = att.sanctioned_amount
		end
	end
	if @fourth_year.size > 0
		for att in @fourth_year
		 @fourth_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_first_year.size > 0
		for att in @mtech_first_year
		 @mtech_first_year_amount = att.sanctioned_amount
		end
	end
	if @mtech_second_year.size > 0
		for att in @mtech_second_year
		 @mtech_second_year_amount = att.sanctioned_amount
		end
	end
	
end





def guidelines
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
	
end
