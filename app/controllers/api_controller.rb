class ApiController < ApplicationController
  
   
  
  def create_user
    #logout_keeping_session!#in production need to be comment out
    @gmuser = Gmuser.new(params[:gmuser])
    
    success = @gmuser && @gmuser.save
    if success && @gmuser.errors.empty?
      #notice = "Logged in Successfully"
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #here i need to send email to the registered user
    #  Notifier.send_welcome_registration(@user,request.host_with_port).deliver
#      if !session[:friendid].blank?
#        tempuser = User.find(session[:friendid])
#        session[:friendid] = nil
#        self.current_user = @user # !! now logged in
#        tempuser.invite current_user
#        notice = "Logged in Successfully Please Accept The Invitation Of Your Friend By Clicking On   Invitation #Pending" 
#      end#this will be later implemented after the session is get maintain by iphone and rails server bo cookie
#      flash[:notice]=notice
#      redirect_back_or_default('/')
       respond_to do |wants|
              wants.html {render :text=>"User is created please login"}
              #wants.xml  { render :xml => @user, :status => :user_created }
              wants.xml  #{ render :xml => "<>", :status => :user_created }
        end 
      
    else
#      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is #above)."
#      render :action => 'new'
#    end
        respond_to do |wants|
              wants.html {render :text=>"there is error in creating the user"}
              wants.xml  #{ render :xml => @user.errors, :status => :unprocessable_entity }
        end 
  end  
end  
end
