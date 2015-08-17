# Gems
# ==================================================

# For encrypted password
gem "bcrypt-ruby"

# Useful SASS mixins (http://bourbon.io/)
gem "bourbon"

# devise for handling user related stuff
gem "devise"

# for all intents and purposes, sqlite should suffice
gem 'sqlite3'

case ask("Choose Template Engine:", :limited_to => %w[erb haml slim])
when "haml"
  # HAML templating language (http://haml.info)
  gem "haml-rails"
when "slim"
  # A lightweight templating engine (http://slim-lang.com)
  gem "slim-rails"
when "erb"
end

gem_group :development do
  # Rspec for tests (https://github.com/rspec/rspec-rails)
  gem "rspec-rails"
  
  gem "pry-rails"
  
  # for code style
  gem "rubocop"
  
  # i don't like to use webrick
  gem "thin"
end

gem_group :test do
  gem "rspec-rails"
  # Capybara for integration testing (https://github.com/jnicklas/capybara)
  gem "capybara"
  gem "capybara-webkit"
  gem "launchy"
  # FactoryGirl instead of Rails fixtures (https://github.com/thoughtbot/factory_girl)
  gem "factory_girl_rails"
  gem "database_cleaner"
end

run "bundle"

# Initialize rspec
# ==================================================
run "bundle exec rspec --init"

# Initialize devise
# ==================================================
run "rails g devise:install"

# Clean up Assets
# ==================================================
# Use SASS extension for application.css
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"
# Remove the require_tree directives from the SASS and JavaScript files.
# It's better design to import or require things manually.
run "sed -i '' /require_tree/d app/assets/javascripts/application.js"
run "sed -i '' /require_tree/d app/assets/stylesheets/application.css.scss"
# Add bourbon to stylesheet file
run "echo >> app/assets/stylesheets/application.css.scss"
run "echo '@import \"bourbon\";' >>  app/assets/stylesheets/application.css.scss"


# Bootstrap: install from https://github.com/twbs/bootstrap
# Note: This is 3.0.0
# ==================================================
if yes?("Download bootstrap?")
  run "wget https://github.com/twbs/bootstrap/archive/v3.0.0.zip -O bootstrap.zip -O bootstrap.zip"
  run "unzip bootstrap.zip -d bootstrap && rm bootstrap.zip"
  run "cp bootstrap/bootstrap-3.0.0/dist/css/bootstrap.css vendor/assets/stylesheets/"
  run "cp bootstrap/bootstrap-3.0.0/dist/js/bootstrap.js vendor/assets/javascripts/"
  run "rm -rf bootstrap"
  run "echo '@import \"bootstrap\";' >>  app/assets/stylesheets/application.css.scss"
  run "rails g simple_form:install --bootstrap"
end


# Font-awesome: Install from http://fortawesome.github.io/Font-Awesome/
# ==================================================
if yes?("Download font-awesome?")
  run "wget http://fontawesome.io/assets/font-awesome-4.1.0.zip -O font-awesome.zip"
  run "unzip font-awesome.zip && rm font-awesome.zip && mv font-awesome-4.1.0 font-awesome"
  run "cp font-awesome/css/font-awesome.css vendor/assets/stylesheets/"
  run "cp -r font-awesome/fonts public/fonts"
  run "rm -rf font-awesome"
  run "echo '@import \"font-awesome\";' >>  app/assets/stylesheets/application.css.scss"
end


# Ignore rails doc files, Vim/Emacs swap files, .DS_Store, and more
# ===================================================
run "cat << EOF >> .gitignore
/.bundle
/db/*.sqlite3
/db/*.sqlite3-journal
/log/*.log
/tmp
database.yml
doc/
*.swp
*~
.project
.idea
.secret
.DS_Store
EOF
*.sublime-*"


# Git: Initialize
# ==================================================
git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }

if yes?("Initialize GitHub repository?")
  git_uri = `git config remote.origin.url`.strip
  unless git_uri.size == 0
    say "Repository already exists:"
    say "#{git_uri}"
  else
    username = ask "What is your GitHub username?"
    run "curl -u #{username} -d '{\"name\":\"#{app_name}\"}' https://api.github.com/user/repos"
    git remote: %Q{ add origin git@github.com:#{username}/#{app_name}.git }
    git push: %Q{ origin master }
  end
end
