require_relative 'base_page'

class PgResources < BasePage
  
  def initialize(web_browser)
    @browser = web_browser
    
    super(@browser) 
    
  end
  
  # Wait for upto 10 seconds for Resources page to load. When it loads stop waiting.
  def wait_for_page_load
    self.wait_for_element_present(resources_page_title, 30)
  end
  
  
  # Get the name of the link at nth position/index specified
  def get_link_name(n)
    return @browser.link(index: n).attribute("text")
  end 
  
   
  
  private
    
    #Define all page elements here
    
    def resources_page_title
      @browser.h3(text: "Resources")
    end
    
    def w3schools_link
      @browser.link(text: "w3schools.com")
    end

    def mdn_link
      @browser.link(text: "MDN")
    end
    
    def learn_regex_link
      @browser.link(text: "Learn regex the easy way")
    end
    
    def devhints_link
      @browser.link(text: "devhints.io")
    end

  
   
end