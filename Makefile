.DEFAULT_GOAL := help

.PHONY: install
install: ## Install prerequired softwares
	poetry install
	poetry self add poetry-dotenv-plugin

.PHONY: dev
dev: ## Run FastAPI Server
	poetry run uvicorn --host 0.0.0.0 fastapi_sample.main:app --reload

.PHONY: check
check: ## Check Python code
	poetry run black . --check

.PHONY: fmt
fmt: ## Format Python code using black
	poetry run black .

.PHONY: lint
lint: ## Lint check using flake8
	poetry run pflake8 .

.PHONY: test
test: ## Unit test using pytest
	poetry run pytest

.PHONY: generate
generate: ## Generate schema from openapi.yaml
	poetry run datamodel-codegen --input ./openapi.yaml --input-file-type openapi --output fastapi_sample/schemas.py

.PHONY: help
help: ## Display this help screen
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
