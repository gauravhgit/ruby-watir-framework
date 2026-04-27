require_relative 'base_page'

class PgHome < BasePage
  
  def initialize(web_browser)
    @browser = web_browser
    
    super(@browser) 
    
  end
  
  #Define page methods here. These methods should be called from the tests to perform actions
    

  # Click on the Text Input link 
  def click_text_input
    text_input_link.click
    @browser.wait
  end

    
  #Define all page elements here
  private
  
    def text_input_link
      @browser.link(text: "Text Input") 
    end
    
    def _link
      @browser.link(text: "Dynamic ID") 
    end

    def _link
      @browser.link(text: "Class Attribute") 
    end

    def _link
      @browser.link(text: "Hidden Layers") 
    end

    def _link
      @browser.link(text: "Load Delay") 
    end

    def _link
      @browser.link(text: "AJAX Data") 
    end

    def _link
      @browser.link(text: "Client Side Delay") 
    end

    def _link
      @browser.link(text: "Click") 
    end

    def _link
      @browser.link(text: "Text Input") 
    end

    def _link
      @browser.link(text: "Scrollbars") 
    end

    def _link
      @browser.link(text: "Dynamic Table") 
    end

    def _link
      @browser.link(text: "Verify Text") 
    end

    def _link
      @browser.link(text: "Progress Bar") 
    end
end