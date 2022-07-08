1. git clone https://github.com/knowde-academy/cookbook-be-template cookbook
2. cd cookbook
3. rvm install "ruby-2.7.4
4. bundle install
5. sudo yum install postgresql96*
6. echo "export API_ALLOWED_ORIGINS=*" >> ~/.zshrc"
7. source ~/.zshrc
8. sudo service postgresql96 initdb
9. service postgresql96 start
10. sudo su postgres -c psql
11. CREATE USER "ec2-user" SUPERUSER;
12. \q
13. rails db:create
14. rails db:migrate
15. rails s
