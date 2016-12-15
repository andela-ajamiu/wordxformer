all: build deploy expose

destroy_all: unexpose undeploy unbuild

build:
	- docker build -t micro-uppercase:1.0 .

deploy:
	- kubectl create -f ./uppercase-deployment.yaml

expose:
	- kubectl create -f ./uppercase-service.yaml

unbuild:
	- docker rmi -f micro-uppercase:1.0

undeploy:
	- kubectl delete deployments uppercase-dep

unexpose:
	- kubectl delete svc uppercase-svc