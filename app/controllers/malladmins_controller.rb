class MalladminsController < ApplicationController
  layout "user"
  # GET /retaileradmins
  # GET /retaileradmins.xml
  #before_filter :authenticate
  
  def index
    @malladmins = Malladmin.all
    respond_to do |format|
      format.js
    end
  end

  # GET /retaileradmins/1
  # GET /retaileradmins/1.xml
  def show
    @malladmin = Malladmin.find(params[:id])
  end

  # GET /retaileradmins/new
  # GET /retaileradmins/new.xml
  def new
    @malladmin = Malladmin.new
    respond_to do |format|
      format.js 
    end
  end

  # GET /retaileradmins/1/edit
  def edit
    @malladmin = Malladmin.find(params[:id])
    @malladmins = Malladmin.all
    respond_to do |format|
      format.js
    end
  end

  # POST /retaileradmins
  # POST /retaileradmins.xml
  def create
    @malladmin = Malladmin.new(params[:malladmin])
    if @malladmin.save
        flash[:notice] = 'Mall admin was successfully created.'
        @malladmins = Malladmin.all
        
        responds_to_parent do 
          render :action => 'index'
      end
      else
       
        responds_to_parent do
          render :action => 'new'
      end
    end
  end

  # PUT /retaileradmins/1
  # PUT /retaileradmins/1.xml
  def update
    @malladmin = Malladmin.find(params[:id])
      if @malladmin.update_attributes(params[:malladmin])
        flash[:notice] = 'Mall admin was successfully updated.'
        @malladmins = Malladmin.all
        responds_to_parent do |format|
          render :action => 'index'
        end
      else
        responds_to_parent do 
           flash[:notice] = "There was an error while updating the Mall Admin information."
           render :action => 'new'
      end
    end
  end

  # DELETE /retaileradmins/1
  # DELETE /retaileradmins/1.xml
  def destroy
    @malladmin = Malladmin.find(params[:id])
    @malladmin.destroy
    flash[:notice] = 'Mall admin deleted successfully.'
      @malladmins = Malladmin.all
      render :action => 'index'
   end
  
end
