class ReportLogger
  
  def self.log_pass_step(log_message_string)
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string = "<dd class=""passed"" style=""background-color:lightgreen;""><span>PASS: " + log_message_string + 
                           "</span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    end
    
    puts "\n" + log_message_string
  end
  
  def self.log_pass_step_with_screenshot(log_message_string, browser_object)
    timenow = DateTime.now
    screenshot_file_name = "pass_screenshot_" + timenow.strftime(DateFormats::LOG_SCREENSHOT_FILE_NAME_TIMESTAMP_FORMAT) + ".png"
    screenshot_path = "/screenshots/" + screenshot_file_name
    screenshot_save_path = ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID'] + screenshot_path
    screenshot_report_url = "." + screenshot_path
    
    # if(!Dir.exist?(ENV['REPORT_LOCATION'] + "/screenshots"))
      # Dir.mkdir ENV['REPORT_LOCATION'] + "/screenshots"
    # end
    browser_object.screenshot.save screenshot_save_path
    
    log_message_string_with_screenshot = ""
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string_with_screenshot = "<dd class=""passed"" style=""background-color:lightgreen;""><span>PASS: " + log_message_string + 
                                           "</span><span> - Pass screenshot:<a href=""" + screenshot_report_url + """ target=""_blank"" rel=""noopener noreferrer"">" + screenshot_file_name + 
                                           "</a></span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    else
      log_message_string_with_screenshot = log_message_string + " - Pass screenshot:" + screenshot_report_url
    end
    
    puts "\n" + log_message_string_with_screenshot
  end
  
  def self.log_fail_step(log_message_string)
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string = "<dd class=""failed"" style=""background-color:red;color:white;""><span>FAIL: " + log_message_string + 
                           "</span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    end
    
    puts "\n" + log_message_string
  end
  
  def self.log_fail_step_with_screenshot(log_message_string, browser_object)
    timenow = DateTime.now
    screenshot_file_name = "fail_screenshot_" + timenow.strftime(DateFormats::LOG_SCREENSHOT_FILE_NAME_TIMESTAMP_FORMAT) + ".png"
    screenshot_path = "/screenshots/" + screenshot_file_name
    screenshot_save_path = ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID'] + screenshot_path
    screenshot_report_url = "." + screenshot_path

    # if(!Dir.exist?(ENV['REPORT_LOCATION'] + "/screenshots"))
      # Dir.mkdir ENV['REPORT_LOCATION'] + "/screenshots"
    # end
    browser_object.screenshot.save screenshot_save_path
    
    log_message_string_with_screenshot = ""
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string_with_screenshot = "<dd class=""failed"" style=""background-color:red;color:white;""><span>FAIL: " + log_message_string + 
                                           "</span><span> - Failure screenshot:<a href="""+screenshot_report_url+""" target=""_blank"" rel=""noopener noreferrer"">" + screenshot_file_name + 
                                           "</a></span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    else
      log_message_string_with_screenshot = log_message_string + " - Failure screenshot:" + screenshot_report_url
    end
    
    puts "\n" + log_message_string_with_screenshot
  end
  
  def self.log_info_step(log_message_string)
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string = "<dd class=""message"" style=""background-color:aqua;""><span>" + log_message_string +
                           "</span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    end
    
    puts "\n" + log_message_string
  end
  
  def self.log_warning(log_message_string)
    if(ENV['REPORT_FORMAT']=="html")
      log_message_string = "<dd class=""message"" style=""background-color:orange;color:white;""><span>WARNING: " + log_message_string +
                           "</span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    else
      log_message_string += "WARNING: " + log_message_string
    end
    
    puts "\n" + log_message_string
  end
  
  def self.log_take_screenshot(log_message_string, browser_object)
    timenow = DateTime.now
    screenshot_file_name = "screenshot_" + timenow.strftime(DateFormats::LOG_SCREENSHOT_FILE_NAME_TIMESTAMP_FORMAT) + ".png"
    screenshot_path = "/screenshots/" + screenshot_file_name
    screenshot_save_path = ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID'] + screenshot_path
    screenshot_report_url = "." + screenshot_path
    
    # if(!Dir.exist?(ENV['REPORT_LOCATION'] + "/screenshots"))
      # Dir.mkdir ENV['REPORT_LOCATION'] + "/screenshots"
    # end
    browser_object.screenshot.save screenshot_save_path
    
    if(ENV['REPORT_FORMAT']=="html")
      log_screenshot_path = "<dd class=""message"" style=""background-color:aqua;""><span>" + log_message_string +
                            ": <a href="""+screenshot_report_url+""" target=""_blank"" rel=""noopener noreferrer"">" + screenshot_file_name +
                            "</a></span><span class=""duration"">" + DateTime.now.strftime(DateFormats::LOG_STEP_TIMESTAMP_FORMAT) + "</span></dd>"
    else
      log_screenshot_path = log_message_string + ": " + screenshot_report_url
    end
    
    puts "\n" + log_screenshot_path
  end
  
end