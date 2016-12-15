all: build deploy expose

destroy_all: unexpose undeploy unbuild

build:
	- docker build -t micro-apigateway:1.0 .

deploy:
	- kubectl create -f ./apigateway-deployment.yaml

expose:
	- kubectl create -f ./apigateway-service.yaml

unbuild:
	- docker rmi -f micro-apigateway:1.0

undeploy:
	- kubectl delete deployments apigateway-dep

unexpose:
	- kubectl delete svc apigateway-svc