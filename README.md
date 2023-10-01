# temporal-k8s

Temporal on Kubernetes

## Getting Started

### Kustomize

If all you need is a base Kustomization that you can build upon, you can find that
over at ``kustomize/base/``.


### Deploy

You can also try out pre-configured flavors of Temporal using Skaffold.


#### devenv (optional)

But first you'll need to install some tools. You may already have some of them
installed, and they might work, but a [devenv](https://devenv.sh/) is included
to make sure we're all on the same page.

After installing [devenv](https://devenv.sh/getting-started/) you can just:

```shell
devenv shell
```

*NOTE* This will also set the `KUBECONFIG` env variable.


#### Kind Cluster (optional)

You may already have a Kuberentes cluster ready to use. But if you don't,
you can quickly spin one up using [Kind](https://kind.sigs.k8s.io/):

```shell
kind create cluster --config ./kind-cluster.yaml
```

#### Temporal + PostgreSQL 13

This uses PostgreSQL 13 as the datastore (both default & visibility):

```shell
skaffold deploy -p temporal-pg13 --port-forward
```

This will deploy a PostgreSQL 13 instance to the `temporal-ds-pg13` namespace and
a Temporal cluster pointing to it in the `temporal-pg13` namespace.

You can connect to the Temporal Cluster using the port forwarded address, e.g:

```shell
temporal operator cluster health --address 127.0.0.1:7233
```


#### Other datastores

TBA. PRs welcome.


## Configuration Environment Vars

Refer to [config_template.yml](https://github.com/temporalio/temporal/blob/0a94c38874328604f0129d8b1c746dd9356d1afa/docker/config_template.yaml)

## Prior Art

Using these projects as a reference:

- https://github.com/temporalio/docker-compose
- https://github.com/temporalio/helm-charts
- https://github.com/temporalio/docker-builds
