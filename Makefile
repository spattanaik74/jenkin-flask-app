.PHONY: install lint format test build run deploy undeploy clean all

IMAGE_NAME=jenkin-flask-app
TAG=latest

install:
	pip install -r requirements.txt

lint:
	ruff check .

format:
	ruff format .

test:
	pytest -v

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

run:
	docker run --rm -p 5000:5000 $(IMAGE_NAME):$(TAG)

deploy:
	docker compose up -d

undeploy:
	docker compose down

logs:
	docker compose logs -f

clean:
	docker compose down
	docker image prune -f

deploy-test:
	docker compose -f docker-compose.test.yml up -d

deploy-prod:
	docker compose -f docker-compose.prod.yml up -d

all: lint test build