class RetailersController < ApplicationController
 layout 'user'
 
  before_filter :authenticate
 
 
  def index
          
  end
  
   def edit
    @retaileradmin = Retaileradmin.find(params[:id])
    #@retaileradmins = Retaileradmin.all
    respond_to do |format|
      format.js
    end
  end
  
    def update
    @retaileradmin = Retaileradmin.find(params[:id])
      if @retaileradmin.update_attributes(params[:retaileradmin])
        flash[:notice] = 'Retaileradmin was successfully updated.'
        @retaileradmins = Retaileradmin.all
        responds_to_parent do |format|
          flash[:notice] = 'Retaileradmin was successfully updated.'
          render :action => 'new_request_form'
        end
      else
        responds_to_parent do 
           flash[:notice] = "There was an error while updating the Retailer information."
           render :action => 'edit'
      end
    end
  end
  
  
  def new_request_form
    
  end
  
  def notify_gm
    Notifier.email_to_gm(params[:businesstype],params[:businessname], params[:city], params[:state], params[:streetaddress], params[:zipcode],params[:fullname], params[:email], params[:phonenumber], params[:inside], params[:outside], params[:website], params[:name], params[:description], params[:image], params[:price], params[:message]).deliver
    flash.now[:notice] = "Successfully sent a message to Gm."
    render :action => 'index'
    
  end
end
