require_relative 'base_page'

class PgTextInput < BasePage
  
  def initialize(web_browser)
    @browser = web_browser
    
    super(@browser) 
    
  end
  
  # Wait for upto 10 seconds for the Text Input page to load. When it loads stop waiting.
  def wait_for_page_load
    self.wait_for_element_present(text_input_field, 10)
  end
  
  # Enter text in text field that sets new button name
  def enter_text_in_my_button(button_new_name)

    new_button_name_text_field.set(button_new_name)

  end
    
  # Click on button to change its own name
  def click_button_that_changes_name
    button_that_changes_name.click
  end
  
  # Return the name of the button that changes its name
  def get_button_that_changes_current_name
    return button_that_changes_name.attribute("text")
  end

  private
    
    #Define all page elements here
    
    def new_button_name_text_field
      @browser.text_field(id: "newButtonName")
    end
    
    def button_that_changes_name
      @browser.button(id: "updatingButton")
    end
    
    
end