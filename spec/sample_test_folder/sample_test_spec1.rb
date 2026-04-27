require 'spec_helper'

describe "This is a sample test to demonstrate the framework" do 
        
  it "Click on button with dynamic id and then enter 4th Resources link name in text input", :focus do
    
    @test_data = TestDataHelper.get_test_data("resource_link_indices")

    # Instantiate page objects and reusable operations object
    home_page = PgHome.new(@web_browser)     
    dynamic_id_page = PgDynamicID.new(@web_browser)
    reusable_operations = ReusableOperations.new(@web_browser)
    text_input_page = PgTextInput.new(@web_browser)
        
    home_page.click_dynamic_id_link

    dynamic_id_page.click_dynamic_id_button

    @test_data_object['link_indices'].each do |index|
    
      reusable_operations.set_resource_name_in_text_input_button(index)

      text_input_page.go_to_resources

      expect(resources_page.get_link_name(index) == text_input_page.get_button_that_changes_current_name) to be true

    end
    
  end
end