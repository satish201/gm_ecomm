class GmusersController < ApplicationController
 
  before_filter :authenticate_gmuser, :except => ["new", "create"]
  
  def index
    @gmusers = Gmuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gmusers }
    end
  end

  
  def show
    @gmuser = Gmuser.find(params[:id])
    #@gmusers = Gmuser. 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gmuser }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @gmuser = Gmuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gmuser }
    end
  end

  # GET /users/1/edit
  def edit
    @gmuser = Gmuser.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @gmuser = Gmuser.new(params[:gmuser])

   respond_to do |format|
    if @gmuser.save
        format.html { redirect_to(@gmuser, :notice => 'Gmuser was successfully created.') }
        format.xml  { render :xml => @gmuser, :status => :created, :location => @gmuser }
        #return true
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gmuser.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @gmuser = Gmuser.find(params[:id])

    respond_to do |format|
      if @gmuser.update_attributes(params[:gmuser])
        format.html { redirect_to(@gmuser, :notice => 'Gmuser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gmuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @gmuser = Gmuser.find(params[:id])
    @gmuser.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end
