- Ruby and Rail editions:
Ruby version : 2.3.1
Rails version : rails', '~> 5.0.0', '>= 5.0.0.1'

- Cloning application from Git repository:
# git clone https://github.com/CMPT-276-assignment/whatshoudieat.git

- How to setup PostgreSQL & Rails on Cloud9:
At the time of writing, Cloud9 has PostgreSQL pre-installed, so you will not need to install it yourself. However, it is not running by default, so you will need to type this command in the terminal:
# sudo service postgresql start

Change the PostgreSQL password to 'password' (or choose a different password):
# sudo sudo -u postgres psql

This will open the psql client.
Type \password and press enter to begin the process of changing the password:
# postgres=# \password

Type your new password (e.g. "password") and press enter twice:
# Enter new password: 
# Enter it again: 

Password changed, quit psql with \q
# postgres=# \q 

Edit your `config/database.yml` to be:
# default: &default
#   adapter: postgresql
#   encoding: unicode
#   pool: 5
  
Important configs for cloud9, change password value to what you entered in the previous psql step.
# template: template0
# username: ubuntu
# password: password
  
# development:
#   <<: *default
#   database: your_app_name_development

# test:
#   <<: *default
#   database: your_app_name_test

# production:
#   <<: *default
#   database: your_app_name_production
#   username: your_app_name
#   password: <%= ENV['YOUR_APP_NAME_DATABASE_PASSWORD'] %>


(Note that the `template`, `username`, and `password` configs in the `default` sections above are essential).

Add the `pg` gem to your `Gemfile`:
# gem 'pg'
# gem 'therubyracer'

Set up database:
# bundle install
# bundle exec rake db:setup
# rake db:create
# rake db:migrate


This is for installing image magic widget (plugin for uploading image):
# sudo apt-get update
# sudo apt-get install imagemagick

To see all db-related taks:
# bin/rake -AD db 

- Setup reCAPCHA
Add the 'gem 'recaptcha' to your 'Gemfile'
# gem 'recaptcha', require: 'recaptcha/rails'

Access link https://www.google.com/recaptcha/admin#list 
Choose reCAPCHA v2
Enter the domain of the app deployed in Heroku and accept the agrrement term to get the keys.
In the file 'recapcha.rb' (whatshoudieat/config/initializers/recapcha.rb), place the site key and secret key for use.
