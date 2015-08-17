# Rails Startup template

This is a template I use for my new Ruby on Rails 4 applications.

__Note__: This is my personal variation of the template. Highly opinionated.

## How to Use

```bash
rails new [app_name] -m https://raw.githubusercontent.com/floriank/rails_startup_template/master/template.rb
```
## TODO

- [ ] use the latest bootstrap
- [ ] use the Sass version of bootstrap (or maybe switch to LESS?)
- [ ] leave SQLite3 as a default - I do not use MySQl that often
  - let the user choose the DB? 

## What it does

1. Adds the following gems:
  - bcrypt-ruby: I usually implement authentication myself instead of using gems like Devise. This is needed for the `has_secure_password` functionality. [See API Doc](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html).
  - [bourbon](http://bourbon.io/): Bourbon provides useful SASS mixins for cross-browser compatibility.
  - (Optional) [haml-rails](http://haml.info): HAML is a beautiful templating language. I prefer it over ERB. 
  - [rspec-rails](https://github.com/rspec/rspec-rails): Rspec is a testing tool for test-driven and behavior-driven development. It makes writing specs more enjoyable.
  - (test environment) [capybara](https://github.com/jnicklas/capybara): I use Capybara to write integration tests and simulate user behavior.
  - (test environment) [factory_girl_rails](https://github.com/thoughtbot/factory_girl): FactoryGirl provdes a flexible alternative to Rails fixtures. 

2. Cleans up assets by renaming `application.css` to `application.css.scss` and removing the `include_tree` directives. It's better design to import and require things manually. For example, `@import 'bootstrap';`

4. Optionally installs [Twitter bootstrap](http://getbootstrap.com/).

5. Optionally installs [Font Awesome](http://fortawesome.github.io/Font-Awesome/).

6. Initializes a new git repository with an initial commit.

7. Optionally create a github repository.

