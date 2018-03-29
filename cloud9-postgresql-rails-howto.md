# How to setup PostgreSQL & Rails on Cloud9

At time of writing, Cloud9 has PostgreSQL pre-installed, so you won't need to install it yourself. However, its not running by default, so you will need to start it with this command in the terminal:

sudo service postgresql start

Change the PostgreSQL password to 'password' (or choose a different password):

sudo sudo -u postgres psql

# This will open the psql client.

# Type \password and press enter to begin process
# of changing the password:
postgres=# \password

# Type your new password (e.g. "password") and press enter twice:
Enter new password: 
Enter it again: 

# Password changed, quit psql with \q
postgres=# \q 

Edit your `config/database.yml` to be:

default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  
  # Important configs for cloud9, change password value
  # to what you entered in the previous psql step.
  template: template0
  username: ubuntu
  password: password
  
development:
  <<: *default
  database: your_app_name_development

test:
  <<: *default
  database: your_app_name_test

production:
  <<: *default
  database: your_app_name_production
  username: your_app_name
  password: <%= ENV['YOUR_APP_NAME_DATABASE_PASSWORD'] %>


(Note the `template`, `username`, and `password` configs in the `default` section above are essential).

Add the `pg` gem to your `Gemfile`:

gem 'pg'

Run `bundle install`.



bundle exec rake db:setup

rake db:create

rake db:migrate

# Run bin/rake -AD db to see all db-related tasks

# THis is for installing image magic widget
sudo apt-get update
sudo apt-get install imagemagick
