############################################
########## OCT Sauce Rake Commands ##########
############################################

def run_oct_web(platform, browser, version, junit_dir)
  system("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" JUNIT_DIR=\"#{junit_dir}\" USESAUCE=true parallel_rspec spec/features/oc_tanner/web_test")
end

task :windows_8_chrome_51_oct do
  run_oct_web('Windows 8.1', 'chrome', '51', 'junit_reports/windows_7_chrome_51')
end

multitask :test_oct_web => [
    :windows_8_chrome_51_oct
] do
  puts 'Saucey: Tested OCT Web'
end

############################################
########## OCT Local Rake Commands ##########
############################################

def run_oct_web_local
  system("APP_ENV='#{@APP_ENV}' parallel_rspec spec/features/oc_tanner/web_test")
end

task :oct_web_dev do
  @APP_ENV = 'dev'
  run_oct_web_local
end

task :oct_web_prod do
  @APP_ENV = 'prod'
  run_oct_web_local
end

task :oct_web_qa do
  @APP_ENV = 'qa'
  run_oct_web_local
end

multitask :oct_web_local_all => [
    :oct_web_qa,
    :oct_web_stage,
    :oct_web_prod
] do
  puts 'Tested OCT Web All Environments'
end

################################################
########## Google Sauce Rake Commands ##########
################################################

def run_google_web(platform, browser, version, junit_dir)
  system("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" JUNIT_DIR=\"#{junit_dir}\" USESAUCE=true parallel_rspec spec/features/google/web_test")
end

task :windows_8_chrome_51_google do
  run_google_web('Windows 8.1', 'chrome', '51', 'junit_reports/windows_7_chrome_51')
end

multitask :test_google_web => [
    :windows_8_chrome_51_google
] do
  puts 'Saucey: Tested Google Web'
end

################################################
########## Google Local Rake Commands ##########
################################################

def run_google_web_local
  system("APP_ENV='#{@APP_ENV}' parallel_rspec spec/features/google/web_test")
end

task :google_web_dev do
  @APP_ENV = 'dev'
  run_google_web_local
end

task :google_web_prod do
  @APP_ENV = 'prod'
  run_google_web_local
end

task :google_web_qa do
  @APP_ENV = 'qa'
  run_google_web_local
end

multitask :google_web_local_all => [
    :google_web_qa,
    :google_web_stage,
    :google_web_prod
] do
  puts 'Tested Google Web All Environments'
end