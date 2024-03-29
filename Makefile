HELM ?= helm

start-local:
	k3d cluster delete test-cluster || true
	k3d cluster create test-cluster --no-lb --no-hostip --no-rollback --k3s-server-arg --no-deploy=traefik,servicelb,metrics-server
	kubectl apply -f tests/expected.yaml
