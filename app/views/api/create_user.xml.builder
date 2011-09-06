xml.instruct!
xml.gmusers{
xml.gmuser{
  if @gmuser.errors.blank?
      xml.message "user is created"
  else    
     xml.message @gmuser.errors.full_messages
  end  
}
}

