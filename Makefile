HELM != helm

gen-expected:
	${HELM} template --namespace=default --values=tests/values.yaml mapserver . > tests/expected.yaml
	sed -i 's/[[:blank:]]\+$$//g'  tests/expected.yaml

start-local:
	k3d cluster delete test-cluster || true
	k3d cluster create test-cluster --no-lb --no-hostip --no-rollback --k3s-server-arg --no-deploy=traefik,servicelb,metrics-server
	kubectl apply -f tests/expected.yaml
