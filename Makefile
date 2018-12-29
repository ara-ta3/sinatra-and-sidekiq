BUNDLE=bundle


install:
	$(BUNDLE) install --path vendor/bundle

run: log
	$(BUNDLE) exec unicorn -c unicorn.rb

run_sidekiq: log
	$(BUNDLE) exec sidekiq -r ./Worker.rb -q event

log:
	mkdir -p $@
