class MalladminSessionsController < ApplicationController
  
  layout 'user'
 # before_filter :authenticate #, :only => :destroy
  
  #new session
  def new
    if current_malladmin
      
      redirect_to '/malladms'
    else
      @malladmin_session = MalladminSession.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml { render :xml => @malladmin_session }
      end
    end
    
  end
  
  #create new session for retailer
  def create
    @malladmin_session = MalladminSession.new(params[:malladmin_session])
    respond_to do |format|
    if @malladmin_session.save
      format.html { redirect_to('/malladms' , :notice => 'Login Successful') }
        format.xml { render :xml => @malladmin_session, :status => :created, :location => @malladmin_session }
       else
        format.html { render :action => "new" }
        format.xml { render :xml => @malladmin_session.errors, :status => :unprocessable_entity }
    end
   end 
 end
        
   
  
  #destroy current session
  
  def destroy
    @mall_session = MalladminSession.find
    @mall_session.destroy

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Goodbye!') }
      format.xml { head :ok }
  end
 end
end
