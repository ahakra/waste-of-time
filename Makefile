.PHONY: run

run:
	cargo run

push:
	git add .
	git commit -m "$(args)"
	git push

ingest:
	cargo run -- ingest --input "data/sample.csv";\
	echo $?

eingest:
	cargo run -- ingest --input "data/wrong_file.csv"; \
	status=$$?; \
	echo "Exit code: $$status"; \
	exit 0