all: build deploy expose

destroy_all: unexpose undeploy unbuild

build:
	- docker build -t micro-lowercase:1.0 .

deploy:
	- kubectl create -f ./lowercase-deployment.yaml

expose:
	- kubectl create -f ./lowercase-service.yaml

unbuild:
	- docker rmi -f micro-lowercase:1.0

undeploy:
	- kubectl delete deployments lowercase-dep

unexpose:
	- kubectl delete svc lowercase-svc