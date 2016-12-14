all: build deploy expose

destroy_all: unexpose undeploy unbuild

build:
	docker build -t micro-reverse:1.0 .

deploy:
	kubectl create -f ./reverse-deployment.yaml

expose:
	kubectl create -f ./reverse-service.yaml

unbuild:
	docker rmi -f micro-reverse:1.0

undeploy:
	kubectl delete deployments reverse-dep

unexpose:
	kubectl delete svc reverse-svc