install:
	bundle install

run:
	bundle exec unicorn -c unicorn.rb

run_sidekiq:
	bundle exec sidekiq -r ./EventWorker.rb -q event
