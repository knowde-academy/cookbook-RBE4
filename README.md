1. git clone https://github.com/knowde-academy/cookbook-be-template cookbook
2. cd cookbook
3. rvm install "ruby-2.7.4
4. bundle install
5. sudo yum install postgresql96*
6. sudo service postgresql96 initdb
7. service postgresql96 start
8.  sudo su postgres -c psql
9.  CREATE USER "ec2-user" SUPERUSER;
10. \q
11. rails db:create
12. rails db:migrate
13. rails s
