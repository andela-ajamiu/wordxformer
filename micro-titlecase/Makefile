all: build deploy expose

destroy_all: unexpose undeploy unbuild

build:
	- docker build -t micro-titlecase:1.0 .

deploy:
	- kubectl create -f ./titlecase-deployment.yaml

expose:
	- kubectl create -f ./titlecase-service.yaml

unbuild:
	- docker rmi -f micro-titlecase:1.0

undeploy:
	- kubectl delete deployments titlecase-dep

unexpose:
	- kubectl delete svc titlecase-svc