class ProfilesController < ApplicationController

layout "frontpage"	
respond_to :json

def update
   @profile= Profile.find_by_id(params[:uid]) 
   @profile.update_attribute(params[:userpri], params[:categoryValue])
   @category_id = params[:categoryValue].to_i
   @category = Category.find(@category_id)
   @question = @category.questions.find_all
   @question.each do |question| 
	    @answer = Answer.new
	    @answer.question_id = question.id
	    @answer.user_id = params[:uid]  
	    @answer.save
    end
   if @profile.save 
      respond_with @profile
   end 	   
 end

end
