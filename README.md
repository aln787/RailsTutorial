#Ruby on Rails Tutorial

##Path
- Initially viewed [this tutorial](https://www.youtube.com/watch?v=Gzj723LkRJY) but ran into issues since in was using scaffold which does not seem to be supported in rails 2.x
- Switched to [this guide](http://guides.rubyonrails.org/getting_started.html)
	- Currently at section 8 Deleting Comments

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


##Mysql
- brew install mysql
- mysql.server restart
	- http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/
- mysql -u DBUSER -h DBSERVERNAME -p