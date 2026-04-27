require 'watir'
require 'date'
require './support/report_logger.rb'

class BasePage
  
  def initialize(web_browser)
    @browser = web_browser 
  end
    
  # Refresh browser window using Watir native methods
  def refresh_page
    @browser.refresh
    @browser.wait
  end 

  # Wait for a specified time for an element to be present.
  # Presence is defined by Watir (element exists and is visible)
  # element -> Watir Element object to wait for
  # timeout -> Maximum time to wait for in seconds
  def wait_for_element_present(element, timeout)
    ctr = 0
    
    while(!element.present? && (ctr < timeout)) do
      sleep(1)
      ctr+=1     
    end  
  end
  
  # Wait for a specified time for an element to be not present.
  # Presence is defined by Watir (element exists and is visible)
  # element -> Watir Element object for whose presence is being waited for
  # timeout -> Maximum time limit that the method waits for in seconds
  def wait_for_element_not_present(element, timeout)
    ctr = 0
    
    while(element.present? || (ctr < timeout)) do
      sleep(1)
      ctr+=1     
    end  
  end
  
  # Go to Home page using the navbar link
  def go_to_home      
    home_link.click  
    @browser.wait  
  end
  
  # Go to Resources page using the navbar link
  def go_to_resources      
    resources_link.click  
    @browser.wait  
  end

  #Define page elements here
  private
  
    def home_link
      @browser.link(text: "Home") 
    end
    
     def resources_link
      @browser.link(text: "Resources") 
    end
end