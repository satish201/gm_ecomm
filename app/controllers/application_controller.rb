class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  helper_method :current_user, :current_user_session, :current_retaileradmin, :current_retaileradmin_session, :current_malladmin, :current_malladmin_session, :current_gmuser, :current_gmuser_session
  
  def require_user_admin
    if current_user
     # unless current_user.username == "admin"#for gm user
  def current_gmuser
    return @current_gmuser if defined?(@current_gmuser)
    @current_gmuser = current_gmuser_session && current_gmuser_session.record
  end
  
        # flash[:notice] = "You must be logged as administrator to access this page"
        # redirect_to root_url
        # return false
      # end
     
      return true
    else
     
      flash[:notice] = "You must be logged as administrator to access this page"
      redirect_to root_url
      return false
     end
  end
  
  
  def authenticate
    if current_retaileradmin
      return true
    else
      flash[:notice] = "You must be logged as retailer to access this page"
      redirect_to root_url
     return false
    end
  end
  
  
  def authenticate_malladmin
    if current_malladmin
      return true
    else 
      flash[:notice] = "you must be logged as mall manager to access this page"
      redirect_to root_url
      return false
    end
  end
  
  def authenticate_gmuser
    if current_gmuser
      return true
    else
      flash[:notice] = "you must be logged as Gm User to access this page"
      redirect_to root_url
      return false
    end
  end
  
  
  private
  #for gm admin
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record 
  end
  
  #session for gm 
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
       @current_user_session = UserSession.find
    end
    
  #for retailer admin
  def current_retaileradmin
    return @current_retaileradmin if defined?(@current_retaileradmin)
    @current_retaileradmin = current_retaileradmin_session && current_retaileradmin_session.record
  end

    #session for retailer admin
  def current_retaileradmin_session
    return @current_retaileradmin_session if defined?(@current_retaileradmin_session)
   p "*************"
    @current_retaileradmin_session = RetaileradminSession.find  
  end
  
  #for mall manager admin
  def current_malladmin
    return @current_malladmin if defined?(@current_malladmin)
    @current_malladmin = current_malladmin_session && current_malladmin_session.record
  end
  
  #session for mall manager admin
   def current_malladmin_session
     return @current_malladmin_session if defined?(@current_malladmin_session)
     @current_malladmin_session = MalladminSession.find
   end
  
   #for gm user
  def current_gmuser
    return @current_gmuser if defined?(@current_gmuser)
    @current_gmuser = current_gmuser_session && current_gmuser_session.record
  end
 #session for gm user 
  def current_gmuser_session
    return @current_gmuser_session if defined?(@current_gmuser_session)
    @current_gmuser_session = GmuserSession.find
  end
   
   
end