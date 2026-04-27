require 'json'

class TestDataHelper

  def self.get_test_data(testdata_filepath)
    
    if(!ENV['TEST_DATA_PATH'].empty?)
      
      file = File.read(ENV['TEST_DATA_PATH'] + "/" + testdata_filepath + ".json")
      
    else
      
      ReportLogger.log_warning("!!! NO TEST DATA PATH IN TEST_CONFIG OR COMMAND LINE !!!") 
       
    end
      
    test_data_hash = JSON.parse(file)
    
    return test_data_hash
  end
  
end
