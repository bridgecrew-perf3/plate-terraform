.PHONY: fmt
fmt:
	docker-compose run --rm terraform-production fmt

.PHONY: init
init:
	docker-compose run --rm terraform-production init

.PHONY: apply
apply:
	docker-compose run --rm terraform-production apply

.PHONY: plan
plan:
	docker-compose run --rm terraform-production plan

.PHONY: destroy
destroy:
	docker-compose run --rm terraform-production destroy