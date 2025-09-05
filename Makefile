APPLICATION_NAME ?= helloworld
 
build:
		docker build --tag srcs/${APPLICATION_NAME} .