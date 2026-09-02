.PHONY: run

run:
	cargo run

push:
	git add .
	git commit -m "$(args)"
	git push