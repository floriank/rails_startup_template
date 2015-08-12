# Rails Startup template

This is a template I use for my new Ruby on Rails 4 applications.

__Note__: This is my personal variation of the template. Highly opinionated.

## How to Use

```bash
rails new [app_name] -m https://raw.github.com/florian/rails_startup_template/master/template.rb
```

## What it does

1. Adds the following gems:
  - bcrypt-ruby: I usually implement authentication myself instead of using gems like Devise. This is needed for the `has_secure_password` functionality. [See API Doc](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html).
  - [bourbon](http://bourbon.io/): Bourbon provides useful SASS mixins for cross-browser compatibility.
  - [CanCan](https://github.com/ryanb/cancan): CanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access.
  - (Optional) [haml-rails](http://haml.info): HAML is a beautiful templating language. I prefer it over ERB. 
  - [rspec-rails](https://github.com/rspec/rspec-rails): Rspec is a testing tool for test-driven and behavior-driven development. It makes writing specs more enjoyable.
  - [guard-rspec](https://github.com/guard/guard-rspec): Guard for automatically launching your specs when files are modified.
  - (test environment) [capybara](https://github.com/jnicklas/capybara): I use Capybara to write integration tests and simulate user behavior.
  - (test environment) [factory_girl_rails](https://github.com/thoughtbot/factory_girl): FactoryGirl provdes a flexible alternative to Rails fixtures. 
  - (production environment) [rails_12factor](https://devcenter.heroku.com/articles/rails-integration-gems): This is needed for deploying Rails 4 applications on [Heroku](http://heroku.com). 


2. Cleans up assets by renaming `application.css` to `application.css.scss` and removing the `include_tree` directives. It's better design to import and require things manually. For example, `@import 'bootstrap';`

4. Optionally installs [Twitter bootstrap](http://getbootstrap.com/).

5. Optionally installs [Font Awesome](http://fortawesome.github.io/Font-Awesome/).

6. Initializes a new git repository with an initial commit.

7. Optionally create a github repository.

