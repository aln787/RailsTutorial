#Ruby on Rails Tutorial

##Path
- Initially viewed [this tutorial](https://www.youtube.com/watch?v=Gzj723LkRJY) but ran into issues since in was using scaffold which does not seem to be supported in rails 2.x
- Switched to [this guide](http://guides.rubyonrails.org/getting_started.html)
- Moving on to [the rails tutorial](https://www.railstutorial.org/book/beginning) using [cloud 9](https://ide.c9.io/aln787/rails-tutorial) as recommended.
  - Ready to start 6.3.2 User has secure password
    - [(work in progress and slow to load when Heroku falls asleep) Curent state of the sample app](https://alex-sample-app-rails-tutorial.herokuapp.com/)

- Future Reading:
  - [Coffee Script](http://railscasts.com/episodes/267-coffeescript-basics)

##Important links
- http://apple.stackexchange.com/questions/130324/howto-install-mysql-utilities-using-brew-or-brew-cask
- https://gorails.com/setup/osx/10.10-yosemite
- https://www.railstutorial.org/book/beginning
- https://github.com/aln787/RailsTutorial

##Issues Encountered
- [I think the important thing, since I tried this a few times, is to remove the .gem file from your home directory. It seems to get in the way.](http://stackoverflow.com/questions/9602806/bundler-not-working-with-rbenv-could-not-find-gem)
  - https://github.com/carsomyr/rbenv-bundler
  - http://stackoverflow.com/questions/27686613/error-could-not-find-i18n-0-7-0-in-any-of-the-sources
  - http://stackoverflow.com/questions/7483515/rake-aborted-no-such-file-to-load-bundler-setup-rails-3-1
  - http://stackoverflow.com/questions/21309901/getting-migrations-are-pending-run-bin-rake-dbmigrate-rails-env-development
  ```
  rm -f db/*.sqlite3
  rake db:create
  RAILS_ENV=development rake db:migrate
  rails s -e development
  ```
  - undefined method `comments' for #<Article:0x007f9bc233f198>
    - has_many :comments, is required in the articles class
    - http://stackoverflow.com/questions/5895808/undefined-method-comments-for-post0x19f3d70
- Heroku doesn't support sqlite3
  - http://stackoverflow.com/questions/13083399/heroku-deployment-failed-because-of-sqlite3-gem-error


##Mysql
- brew install mysql
- mysql.server restart
	- http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/
- mysql -u DBUSER -h DBSERVERNAME -p

##PSQL
```
$ brew install postgresql
$ postgres -D /usr/local/var/postgres
```

##Heroku
```
$ brew cask install heroku-toolbelt
$ git push heroku master
$ Heroku logs
```
###Other Commands
```
$ heroku version
$ heroku login
$ heroku keys:add
$ heroku create
$ git push heroku master
$ heroku rename rails-tutorial-hello
heroku run rake db:migrate
```

##Rails
```
$ rails server
$ bundle install
#Shortcuts
$ rails s ## = $ rails server
$ rails c ## = $ rails console
$ rails g ## = $ rails generate
$ bundle  ## = $ bundle install  
$ rake    ## = $ rake test
$ bundle exec guard init
$ bundle exec rake test:models
$ rake db:test:load
$ bundle exec rake db:migrate
$ bundle exec rake db:rollback
```
###Notes
- ```<% ... %>``` executes the code inside
- ```<%= ... %>``` executes it and inserts the result into the template
- If spring becomes sluggish check running processes ```$ ps aux``` optional add filter options:
  ```
  $ ps aux | grep spring
  ubuntu    1096  0.0  0.0  10548   880 pts/1    S+   13:58   0:00 
  ```
  -  kill spring process using the process id:
  ```
  $ kill -9 1096
  ```
  - Other options for killing spring
  ```
  $ spring stop
  $ pkill -9 -f spring
  ```
- Rails uses active record and migrations to simplify the process of interacting with relational data stores.  (SQL is not required in your rails code.)
- A model consist of a single user and a db table will store multiple users
  - When you add ```t.timestamps null: false``` to the migration file it will add 2 db columns (created at the last updated at) 
###Palindrome?
```
if string == string.reverse
  "This is a palindrome."
else
  "This is not a palindrome."
end
```
###Subclassing
```
>> class Word < String      # Word inherits from String.
>>   def palindrome?
>>     self == self.reverse # self is the string itself.
  ##self can be excluded on the right == reverse will work
>>   end
>> end
=> nil
```

##Ruby
###Notes
- Ruby won't interpolate into single quoted strings
```
>> 'Go #{team}!'     # Single-quoted strings don't allow interpolation
=> "Go \#{team}!"

#Checks
>> "".nil?
>> "".empty?

#Arrays
>>"Go Team".split
=> ["Go", "Team"]
>> "GoxTeamx!".split('x')
=> ["Go", "Team", "!"]
##Accessing arrays
>> team = ["Go", "Team", "!"]
>> team[0]
>> team[-1]
>> team.first
>> team.second
>> team.last
##Validating Arrays
>> team.empty?
>> team.include?("Go")
>> team.sort #use ! to mutate the array
>> team.reverse #''
>> team.shuffle #''
##Modifying arrays
>> team.sort! #same as the commands above but includes !
>> team.push("!!!")
>> team.pop
>> team.join
>> team.join(" ")  #include a space between elements
##Creating arrays
>> ('a'..'z').to_a
=> ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
>> (0..9).to_a
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>> t = %w[working through the ruby tutorial]  
=> ["working", "through", "the", "ruby", "tutorial"]
###Accessing 
>> t[0..1]
=> ["working", "through"]
##Enumeration
>> ('a'..'z').each { |i| puts i.upcase}
>> ('a'..'z').each do |i|
?>   puts i.upcase
?>   puts '--'
>> end
>> team.map { |i| i.upcase}
=> ["GO", "TEAM", "!"]
team.map(&:upcase)  ##same result as above
##Provided example
>> ('a'..'z').to_a.shuffle[0..20].join
```

###Hashes
```
>> team = {}
>> team["name"] = "Virginia Tech"
>> team["mascot"] = "Hokie"
>> team["sport"] = "football"
>> team
=> {"name"=>"Virginia Tech", "mascot"=>"Hokie", "sport"=>"football"}
```
###Symbols
```
>> team1 = {:name => "Virginia Tech", :mascot => "Hokie", :sport => "football"}
>> team2 = { name: "Virginia Tech", mascot: "Hokie", sport: "football" }
>> team1 == team2
=> true
```
- Simple Example Email Regex (weakness multiple successive dots): ```/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i```
- Error causing all model test to fail: ActiveRecord::RecordNotUnique: SQLite3::ConstraintException: \
    column email is not unique: INSERT INTO "users" (...
  - Resolution: ```$ rake db:test:load``` [details](http://stackoverflow.com/questions/5769758/adding-index-to-email-column-culprit-for-unit-tests-failing)


##General Links
- [Bootstrap](http://getbootstrap.com/customize/)
- https://vesselinv.com/os-x-apps-for-smooth-rails-development/
- http://macappstore.org/sqlitebrowser/
- [Regular Expressions](http://rubular.com)
  - [Rails Testing Guide](http://guides.rubyonrails.org/testing.html)
- [Cryptographic Hash Function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
- [Hash Function](https://en.wikipedia.org/wiki/Hash_function)


##Cloud 9
- https://ide.c9.io/aln787/rails-tutorial
###Commands
- ```rails server -b $IP -p $PORT``` 
  - Used instead of ```rails server``` for cloud 9 development
- ```bundle exec rake test```