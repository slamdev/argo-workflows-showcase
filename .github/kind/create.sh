kind create cluster \
 --name=aw-showcase \
 --config=cluster.yaml \
 --kubeconfig=kubeconfig.yaml \
 --wait=60s

echo "connect to cluster via:"
echo " export KUBECONFIG=$(pwd)/kubeconfig.yaml"
echo " kubectl get pods --all-namespaces"
