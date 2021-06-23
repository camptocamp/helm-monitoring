## OpenShift-ch-3

From the GIT clone root of this repository:

```shell
oc project gs-gmf-demo
export TILLER_NAMESPACE=gs-gmf-demo
helm upgrade --install monitoring monitoring
```

```shell
oc project gs-gmf-nppr
export TILLER_NAMESPACE=gs-gmf-nppr
helm upgrade --install monitoring monitoring
```

```shell
oc project gs-mutualized-print
export TILLER_NAMESPACE=gs-mutualized-print
helm upgrade --install --set print.enabled=true monitoring monitoring
```
