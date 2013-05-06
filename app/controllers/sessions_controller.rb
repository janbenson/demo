class SessionsController < ApplicationController
	
     layout "frontpage"
     respond_to :json
     
  def shownewuser
    @logged_in = 'yes'
    @title = "Sign in"
    @uid = params[:id]
    gon.your_object = User.find(params[:id])
  end
  def showsurvey
  	  @title = "Survey for"
  	   @category = Category.find(params[:data])
           @questions = @category.questions.find_all_by_category_id(params[:data])
           @current_question_rec =  @questions.first
           @current_question = @current_question_rec.question
           @current_question_id = @current_question_rec.question_id
           @answer = @category.questions.find(@current_question_id).answers.find_by_user_id(params[:id])
   	   respond_to do |format|
 	     format.html { redirect_to @category }
             format.js
     end    	   
  end
  
def updateanswers
     @formresults = params[:category]	  
     @category = Category.find(params[:id])	   
     @formresults = params[:category]	  
     @question_id = @formresults[:question_id]
     @user_id = @formresults[:user_id]
     @answer_details = @formresults[:answer]

     @answer=@category.questions.find(@question_id).answers.find_by_user_id(@user_id)
     @answer.agree = @answer_details[:agree]
     @answer.importance = @answer_details[:importance]
     @answer.importance = @answer_details[:comments]
     
     if @answer.save then
     	     @counter = @question_id.to_i
     	     @counter = @counter+1
     	     @current_question_rec = @category.questions.find_by_question_id(@counter)
     	     @current_question = @current_question_rec.question 
     	     @current_question_id = @counter
     	     @answer = @category.questions.find(@current_question_id).answers.find_by_user_id(@user_id)
     	     
     	     
 	 respond_to do |format|
 	     format.html { redirect_to @category }
             format.js 
     end 
   end
 end  




  def new
    @logged_in = 'yes'
    @title = "Sign in"
  end
  
  def create
  	  
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      response.headers['X-CSRF-Token'] = form_authenticity_token
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      @title = "Sign in"
      render "new"
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end 	  
  
end
