git clone https://github.com/kube-HPC/hkube_system_charts.git

kubectl create ns ingress-nginx logging monitoring provisioner

helm install nfs-client-provisioner/ --name nfs-client

kubectl apply elastic-cd.yaml

kubectl apply prometheus-sc.yaml

helm install hkube-sys/ --name hkube-sys

