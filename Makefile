.PHONY: help

help:  ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

.setup_done:  ## Set up Planemo using pipx
	@echo "Setting up development environment..."
	pipx install planemo
	@planemo --help > .setup_done

test: .setup_done  ## Run tests using Planemo
	@echo "Running tests..."
	planemo t --no_wait --galaxy_branch release_25.0 --skip_venv --biocontainers --job_config_file job_conf.yml --job_output_files ./.testing

lint: .setup_done ## Run Planemo's XML linter
	@echo "Running linter..."
	planemo l

upload: .setup_done ## Upload package to the toolshed using Planemo
	@echo "Uploading package..."
	planemo shed_update --shed_target toolrepo --force_repository_creation