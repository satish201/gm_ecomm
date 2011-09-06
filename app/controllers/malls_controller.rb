class MallsController < ApplicationController
  # GET /malls
  # GET /malls.xml
  def index
    @malls = Mall.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @malls }
    end
  end

  # GET /malls/1
  # GET /malls/1.xml
  def show
    @mall = Mall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mall }
    end
  end

  # GET /malls/new
  # GET /malls/new.xml
  def new
    @mall = Mall.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mall }
    end
  end

  # GET /malls/1/edit
  def edit
    @mall = Mall.find(params[:id])
  end

  # POST /malls
  # POST /malls.xml
  def create
    @mall = Mall.new(params[:mall])

    respond_to do |format|
      if @mall.save
        format.html { redirect_to(@mall, :notice => 'Mall was successfully created.') }
        format.xml  { render :xml => @mall, :status => :created, :location => @mall }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /malls/1
  # PUT /malls/1.xml
  def update
    @mall = Mall.find(params[:id])

    respond_to do |format|
      if @mall.update_attributes(params[:mall])
        format.html { redirect_to(@mall, :notice => 'Mall was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /malls/1
  # DELETE /malls/1.xml
  def destroy
    @mall = Mall.find(params[:id])
    @mall.destroy

    respond_to do |format|
      format.html { redirect_to(malls_url) }
      format.xml  { head :ok }
    end
  end
end
