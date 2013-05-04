class ProfilesController < ApplicationController

layout "frontpage"	
respond_to :json
def show
   	
  
end	  
	
	

def update
   @profile= Profile.find_by_id(params[:uid]) 
   @profile.update_attribute(params[:userpri], params[:categoryValue])
   @category_id = params[:categoryValue].to_i
   @category = Category.find(@category_id)
   @question = @category.questions.find_all
   @counter = 1
   @question.each do |question| 
	    @answer = Answer.new
	    @answer.question_id = question.id
	    @answer.user_id = params[:uid]  
	    @answer.question_num = @counter
	    @answer.save
	    @counter = @counter+1
    end
   if @profile.save 
      respond_with @profile
   end 	   
 end
def setuserprofile
	  @categories = Category.all
		  @up = Profile.find_by_id(params[:uid])
		  @up_list = [@up.cat1,@up.cat2,@up.cat3,@up.cat4,@up.cat5,@up.cat6,@up.cat7,@up.cat8,@up.cat9,@up.cat10,@up.cat11,@up.cat12,@up.cat13,@up.cat14,@up.cat15,@up.cat16,@up.cat17,@up.cat18]
		
		  (1..18).each do |cat|
			  if @up_list[cat] != nil then 
			     @imgnum = @up_list[cat].to_f
			     @up_list[cat] = @categories[@imgnum].small_pic
			  end
	          end

   gon.your_object = @up_list

  end	  
end
