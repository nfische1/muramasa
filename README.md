# Muramasa
Sample Ruby Automated Regression/Integration Tests

##What is this?
    This is a repository to store our rspec/capybara automated Regression/Integration test cases.

##How to install:
<p>Prerequesites</p>
1. Make sure XCode is installed and up to date
2. Install XCode command line tools: $xcode-select --install
3. Install Brew: $ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
4. Install git: $brew install git
5. Clone the Muramasa github project: $git clone https://github.com/berrynorth/muramasane 
6. run `bin/setup`
7. Update (profile) file with the following:
<br>export PATH="$HOME/.rbenv/bin:$PATH"
<br>eval "$(rbenv init -)"
8. Install an IDE (Rubymine or Sublime)  Debugging is easier in Rubymine

<p>dotenv environment files</p>
1. Copy the .env, .env.dev, .env.qa and .env.production and rename them with .local at the end of each rspected file. ie: .env.local, .env.dev.local... etc
2. Uncomment the values in the *.local files and update them with the correct information.

<p>Running Test</p>
1. run in sequence: $rspec spec/features/[test dir/test name]
2. run in parallel: $parallel_rspec spec/features/[test dir/]

<p>PA Rake Commands</p>
- $rake oct_web_prod (runs all web test locally in prod environment)
- $rake oct_web_qa (runs all web test locally in qa environment)
- $rake oct_web_dev (runs all web test locally in dev environment)
- $rake oct_web_local_all (runs all web test in all environments locally)
- $rake google_web_prod (runs all web test locally in prod environment)
- $rake google_web_qa (runs all web test locally in qa environment)
- $rake google_web_dev (runs all web test locally in dev environment)
- $rake google_web_local_all (runs all web test in all environments locally)


<p>Standards:</p>
1. First and foremost we follow the same standards as everyone else here at O.C. Tanner. Currently this is the [Github Ruby Style Guides] (https://github.com/octanner/ruby)
2. Use the Rubocop Gem to verify these standards are met:
    a. from the command line run $rubocop
    b. rubocop can be ran at a project or file level
    c. to run at a file level $rubocop /filepath/filename.rb

<p>Repo</p>
1. One Repo
2. Broken up by Project
3. Own spec files

<p>Tools:</p>
1. We use Ruby as much as we can.
2. Our test harness is 'rspec'
3. For tests we use Capybara

<p>Drivers</p>
1. Webkit
2. Selenium

<p>Structure</p>
1. Object oriented programming.
2. Model our Pages/Features in Classes.
3. Reusable Methods to handle repeated scenarios.

<p>Helpful Info, Additional Resources</p>

There may be additional latency when using a remote webdriver to run tests on Sauce Labs. Timeouts or Waits may need to be increased.
[Selenium tips regarding explicit waits](https://wiki.saucelabs.com/display/DOCS/Best+Practice%3A+Use+Explicit+Waits)

[Sauce Labs Documentation](https://wiki.saucelabs.com/)
[SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)
[RSpec Documentation](http://rspec.info/documentation/)
[Capybara Documentation](https://github.com/jnicklas/capybara)
[Ruby Documentation](http://ruby-doc.org/)

A great resource to search for issues not explicitly covered by documentation.
[Stack Overflow](http://stackoverflow.com/)
