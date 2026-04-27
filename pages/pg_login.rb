
class PgLogin
  
  def initialize(web_browser)
    @browser = web_browser 
  end
  
  # Login to the app using the values set in environment variables ENV['USERNAME'] and ENV['PASSWORD']
  def login_to_web_admin
    username_field.set ENV['USERNAME']
    password_field.set ENV['PASSWORD'] 
    login_button.click
    @browser.wait
  end
  
  
  #Define all page elements here
  private
  
    def username_field
      @browser.text_field(id: "username") 
    end
    def password_field
      @browser.text_field(id: "password") 
    end
    def login_button 
      @browser.button(value: "Login") 
    end 


end

