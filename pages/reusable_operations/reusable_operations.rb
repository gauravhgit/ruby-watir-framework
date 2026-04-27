# Reusable Operations are methods that encapsulate actions across multiple page objects
# and are frequently repeated in one or more tests. 

require_relative 'base_page'

class ReusableOperations < BasePage
  
  def initialize(web_browser)
    @browser = web_browser
    
    super(@browser) 
    
  end
  
  # Go to Resources page and get text of index-th link the go to Text Input page and enter it in the text field and click
  # the button that should change its name based on input value.
  # index -> Order of link to get from the Resource page
  def set_resource_name_in_text_input_button(index)

    home_page = PgHome.new(@web_browser)     
    resources_page = PgResources.new(@web_browser)
    text_input_page = PgTextInput.new(@web_browser)

    self.go_to_resources

    link_name = resources_page.get_link_name(index)

    resources_page.go_to_home

    home_page.click_text_input

    text_input_page.enter_text_in_my_button_field(link_name)

    text_input_page.click_button_that_changes_name
    
  end
end