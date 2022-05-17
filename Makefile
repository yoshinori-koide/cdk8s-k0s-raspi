.DEFAULT_GOAL := help
.PHONY: help
help: ## <Default> Display this help 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup-k0s
setup-k0s:			## Install K0s AS A Service
	sudo k0s install controller --single

.PHONY: up
up:					## Start K0s Service
	sudo k0s start

.PHONY: down
down:				## Start K0s Service
	sudo k0s stop

.PHONY: reset-k0s
reset-k0s:			## Reset K0s Service
	sudo k0s reset

.PHONY: upgrade-k0s
upgrade-k0s:		## Upgrade K0s
	sudo k0s stop || true
	curl -sSLf https://get.k0s.sh | sudo sh

.PHONY: inst-ckd8s
inst-ckd8s:			## Install Cdk8s CLI
	npm install -g cdk8s-cli

.PHONY: init
init:				## Init Typescript project
	cdk8s init typescript-app

.PHONY: gen-kubeconfig
gen-kubeconfig:		## Generate a kubuconfig yaml
	sudo k0s kubeconfig create --groups "system:masters" k0s > config.yaml
	KUBECONFIG=$$(pwd)/config.yaml kubectl create clusterrolebinding k0s-admin-binding --clusterrole=admin --user=k0s

.PHONY: compile
compile:			## Compile ts to js
	npm run compile

.PHONY: watch
watch:				## Watch for changes and compile typescript in the background
	npm run watch

.PHONY: build
build:				## Compile + synth
	npm run build

.PHONY: synth
synth:				## Synthesize k8s manifests from charts to dist/ (ready for 'kubectl apply -f')
	npm run synth

.PHONY: deploy
deploy:				## Deploy Project Files to K8s
	KUBECONFIG=$(pwd)/config.yaml kubectl apply -f dist/