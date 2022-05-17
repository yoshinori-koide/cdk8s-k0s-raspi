.DEFAULT_GOAL := help
.PHONY: help
help: ## <Default> Display this help 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: inst-k3s
inst-k3s:			## Install k3s
	curl -sfL https://get.k3s.io | sh -

.PHONY: down
down:				## Stop k3s processes
	k3s-killall.sh

.PHONY: uninst-k3s
uninst-k3s:			## Uninstall K3s bin
	k3s-uninstall.sh

.PHONY: inst-ckd8s
inst-ckd8s:			## Install Cdk8s CLI
	npm install -g cdk8s-cli

.PHONY: init
init:				## Init Typescript project
	cdk8s init typescript-app

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
	sudo kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml apply -f dist/
