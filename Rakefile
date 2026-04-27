require "rake"
require "rspec/core/rake_task"
require "optparse"
require "date"
require "yaml"
require "active_support"
require "watir"

task(:runtest) do
  
  # Read in the command line args (run-time parameters) if any 
  options = {}
  opts = OptionParser.new
  opts.banner = "Usage: rake runtest -- [options]"
  
  opts.on("--cities ARG", String) { |cities| options[:cities] = cities }
  
  opts.on("--env ARG", String) { |environment| options[:environment] = environment }
  opts.on("--user ARG", String) { |username| options[:username] = username }
  opts.on("--pswd ARG", String) { |password| options[:password] = password }
  opts.on("--report ARG", String) { |reportFormat| options[:report_format] = reportFormat }
  opts.on("--reportpath ARG", String) { |reportPath| options[:report_path] = reportPath }
  opts.on("--testsuites ARG", String) { |testSuites| options[:test_suites] = testSuites }
  opts.on("--testdatapath ARG", String) { |testDataPath| options[:test_data_path] = testDataPath }  
  opts.on("--rspectags ARG", String) { |rspecTags| options[:rspec_tags] = rspecTags }
  opts.on("--browser ARG", String) { |browser| options[:browser] = browser }

  args = opts.order!(ARGV) {}
  opts.parse!(args)
  
  testconfig = YAML.load_file('config/test_config.yml')

  # Use time stamp as test run id   
  ENV['TEST_RUN_ID'] = (DateTime.now).strftime("%Y-%m-%d_%H-%M-%S")

  clients_arg = options[:client].to_s.blank? ? "client1" : options[:client].to_s

  clients = clients_arg.split(",") 
  
  clients.each do |each_client|

    ENV['CLIENT'] = each_client
    
    each_client_config = testconfig[each_client]
    
    # Command line args will override the config file values for all clients
    ENV['TEST_ENVIRONMENT'] = options[:environment].to_s.blank? ? each_client_config['environment'].to_s : options[:environment].to_s
    ENV['USERNAME'] = options[:username].to_s.blank? ? each_client_config['username'].to_s : options[:username].to_s
    ENV['PASSWORD'] = options[:password].to_s.blank? ? each_client_config['password'].to_s : options[:password].to_s
    ENV['REPORT_FORMAT'] = options[:report_format].to_s.blank? ? each_client_config['report_format'].to_s : options[:report_format].to_s
    ENV['REPORT_LOCATION'] = options[:report_location].to_s.blank? ? each_client_config['report_location'].to_s : options[:report_location].to_s
    ENV['TEST_SUITES'] = options[:test_suites].to_s.blank? ? each_client_config['test_suites'].to_s : options[:test_suites].to_s
    ENV['TEST_DATA_PATH'] = options[:test_data_path].to_s.blank? ? each_client_config['test_data_path'].to_s : options[:test_data_path].to_s
        
    # --rspectags will utilize the tags feature of Rspec, if desired. Enter the tags separated by commas like --rspectags feature1,feature2
    # This will run all tests that have been tagged as :feature1 and :feature2
    ENV['RSPECTAGS'] = options[:rspec_tags].to_s.blank? ? each_client_config['rspec_tags'].to_s : options[:rspec_tags].to_s
    
    # Set browser to command line arg. If command line arg not provide, then set to test_config value. If no test_config set then default to "chrome"
    ENV['BROWSER'] = options[:browser].to_s.blank? ? (each_client_config['browser'].to_s.empty? ? "chrome" : each_client_config['browser'].to_s) : options[:browser].to_s
    
    
    begin
       
      Rake::Task['spec'].invoke
            
    rescue 
      
      puts "Exception occurred while running tests for " + each_client
      puts e.to_s
      
    end
    
    Rake::Task['spec'].reenable
    Rake::Task['spec'].all_prerequisite_tasks.each(&:reenable)
    
  end
       
  exit 0
end

RSpec::Core::RakeTask.new(:spec) do |t|
  
 
  if(!ENV['TEST_SUITES'].blank? && ENV['TEST_SUITES'] != "all")
    
    tests = Array.new 
    
    test_suites = ENV['TEST_SUITES'].split(",")
    
    test_suites.each do |each_test_suite|
      File.open("test_suites/" + each_test_suite + ".txt", "r").each_line do |each_test|
        tests.push each_test.to_s.strip
      end 
    end
    
    t.pattern = tests
    
  elsif(ENV['TEST_SUITES'] == "all")
    
    t.pattern = Dir.glob("spec/**/*_spec.rb")
    
  else
    
    puts "!! TEST SUITES NOT SPECIFIED !!"  
    
  end
    
  rspec_options = ""
  
  if(ENV['REPORT_FORMAT'] == "html")
   
    if(ENV['REPORT_LOCATION'].blank?)
      ENV['REPORT_LOCATION'] = "./reports"
    end   
  
    if(!Dir.exist?(ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID']))
      Dir.mkdir ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID']
      Dir.mkdir ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID'] + "/screenshots"
    end
  
    rspec_options += " --format h > " + ENV['REPORT_LOCATION'] + "/Test_Run_" + ENV['TEST_RUN_ID'] + "/" + ENV['CLIENT'].capitalize + "_Test_Report_" + ENV['TEST_RUN_ID'] +".html"
      
  end 
  
  if(!Dir.exist?(ENV['REPORT_LOCATION'] + "/screenshots"))
    Dir.mkdir ENV['REPORT_LOCATION'] + "/screenshots"
  end
  
  if(!ENV['RSPECTAGS'].blank?)
    
    rspec_tags_array = ENV['RSPECTAGS'].split(",")
    
    rspec_tags_array.each do |each_tag|
      rspec_options += " --tag " + each_tag  
    end
    
  end
  
  t.rspec_opts = rspec_options.strip
  
  t.fail_on_error = false
   
end

task default: :runtest