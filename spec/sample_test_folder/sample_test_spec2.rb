require 'spec_helper'

describe "This is another sample test to demonstrate the framework" do 
        
  it "", :focus do
    
    @test_data = TestDataHelper.get_test_data("")

    # Instantiate page objects and reusable operations object
    home_page = PgHome.new(@web_browser)     
    dynamic_id_page = PgDynamicID.new(@web_browser)
    reusable_operations = ReusableOperations.new(@web_browser)
    text_input_page = PgTextInput.new(@web_browser
        
    
    
  end
end