require_relative 'base_page'

class PgDynamicID < BasePage
  
  def initialize(web_admin_browser)
    @browser = web_admin_browser
    
    super(@browser) 
    
  end
  
  # Wait upto 10 seconds for dynamic id page to load. When it loads stop waiting.
  def wait_for_page_load
    self.wait_for_element_present(click_dynamic_id_button, 30)
  end
  
  def click_dynamic_id_button
    click_dynamic_id_button.click
  end
  
  private
    
    #Define all page elements here
    
    def click_dynamic_id_button
      @browser.button(text: "Button with Dynamic ID")
    end
               
    
end