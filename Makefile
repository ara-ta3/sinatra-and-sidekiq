install:
	bundle install

run:
	bundle exec unicorn -c unicorn.rb

run_sidekiq:
	bundle exec sidekiq -r ./Worker.rb -q event
