check-skaffold:
ifeq (, $(shell which skaffold))
	$(error "No skaffold in $$(PATH). https://skaffold.dev/docs/install/")
endif

check-helm:
ifeq (, $(shell which helm))
	$(error "No helm in $$(PATH). https://helm.sh/docs/intro/install/")
endif

apply/%: check-skaffold check-helm
	cd $* && skaffold run -lskaffold.dev/run-id=0 --status-check=false

APPS := $(shell find . -name skaffold.yaml -mindepth 1 -exec dirname {} \; | sort)

APPLY_TARGETS := $(foreach m,$(APPS),apply/$(m))
apply/./hive : apply/./postgres-operator
apply: $(APPLY_TARGETS)
