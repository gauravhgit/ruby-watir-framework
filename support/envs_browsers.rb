require 'watir'
require 'yaml'
require 'pathname'
require 'webdrivers'
require 'selenium-webdriver'
require './pages/base_page.rb'

class TestBrowsers
  
  def self.start_browser_goto_app
    
    env_config = YAML.load_file('./config/environments.yml')
    
    driver_config = YAML.load_file('./config/drivers.yml')
    
    Webdrivers.install_dir = File.expand_path('.') + '/drivers'
    
    case ENV['BROWSER']
          
    when "safari"
      
      if(!OS.mac?)  
        ReportLogger.log_warning("Safari browser only available on Mac OS")  
      end
      
      @browser = Watir::Browser.new :safari, technology_preview: true
          
    when "firefox"
      
      if(OS.mac?)  
        
        Selenium::WebDriver::Firefox::Service.driver_path = File.expand_path('.') + '/drivers/geckodriver'   
         
      elsif(OS.windows?)  
        
        Selenium::WebDriver::Firefox::Service.driver_path = File.expand_path('.') + '/drivers/geckodriver.exe'    
        
      end
      
      Selenium::WebDriver::Firefox.path = driver_config['firefox']['binary_path']    
                    
      @browser = Watir::Browser.new :firefox
      
    else
            
      if(OS.mac?)  
        
        Selenium::WebDriver::Chrome::Service.driver_path = File.expand_path('.') + '/drivers/chromedriver'   
         
      elsif(OS.windows?)  
        
        Selenium::WebDriver::Chrome::Service.driver_path = File.expand_path('.') + '/drivers/chromedriver.exe'    
        
      end
      
      @browser = Watir::Browser.new
    
    end
    
    @browser.goto env_config[ENV['TEST_ENVIRONMENT']]['url'] 
    ENV['TEST_ENVIRONMENT_URL'] = env_config[ENV['TEST_ENVIRONMENT']]['url']
    return @browser
    
  end
  
end 

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end

  def OS.jruby?
    RUBY_ENGINE == 'jruby'
  end
end