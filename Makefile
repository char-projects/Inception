APPLICATION_NAME ?= inception
 
build:
		docker build --tag srcs/${APPLICATION_NAME} .