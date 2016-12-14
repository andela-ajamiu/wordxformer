all:
	make -C ./micro-lowercase
	make -C ./micro-reverse
	make -C ./micro-titlecase
	make -C ./micro-uppercase
	make -C ./micro-apigateway

delete_all:
	make destroy_all -C ./micro-lowercase
	make destroy_all -C ./micro-reverse
	make destroy_all -C ./micro-titlecase
	make destroy_all -C ./micro-uppercase
	make destroy_all -C ./micro-apigateway