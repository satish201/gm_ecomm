class GmuserSessionsController < ApplicationController
   
   before_filter :authenticate_gmuser, :except=>["new", "create"]
   
  def new
      if current_gmuser
        redirect_to root_url
      else
        @gmuser_session = GmuserSession.new
        respond_to do |format|
          format.html # new.html.erb
          format.xml { render :xml => @gmuser_session }
        end
      end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @gmuser_session = GmuserSession.new(params[:gmuser_session])
        respond_to do |format|
        if @gmuser_session.save        
          p "i m in save***"
          p @gmuser_session
        format.html { redirect_to(root_url, :notice => 'Login Successful') }
        format.xml { render :xml => @gmuser_session, :status => :created, :location => @gmuser_session }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @gmuser_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    #@user_session[:user_id] = nil
    @gmuser_session = GmuserSession.find
    @gmuser_session.destroy

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Goodbye!') }
      format.xml { head :ok }
    end
  end
end
