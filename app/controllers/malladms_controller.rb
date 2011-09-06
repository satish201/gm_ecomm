class MalladmsController < ApplicationController
  
  layout 'user'
 
  before_filter :authenticate_malladmin
 
 
  def index
      
  end
  
   def edit
    @malladmin = Malladmin.find(params[:id])
   # @malladmins = Malladmin.all
    respond_to do |format|
      format.js
    end
  end
  
   def update
    @malladmin = Malladmin.find(params[:id])
      if @malladmin.update_attributes(params[:malladmin])
        flash[:notice] = 'Mall admin was successfully updated.'
        @malladmins = Malladmin.all
        responds_to_parent do |format|
          render :action => 'new_request_gm'
        end
      else
        responds_to_parent do 
           flash[:notice] = "There was an error while updating the Mall Admin information."
           render :action => 'edit'
      end
    end
  end
  
  
  def new_request_gm
    
  end
  
  def request_gm
    Notifier.mallmanageremail_to_gm(params[:city], params[:state], params[:streetaddress], params[:zipcode], params[:mallname], params[:email], params[:phonenumber], params[:inside], params[:outside], params[:website], params[:news], params[:message], params[:image]).deliver
    flash.now[:notice] = "Successfully sent a message to Gm."
    render :action => 'index'
    
  end
end
