# ===============================
# VARIABLES
# ===============================

CLUSTER   = notes-app-cluster
REGION    = eu-north-1

METRICS   = https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
INGRESS   = https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/aws/deploy.yaml


# ===============================
# SETUP
# ===============================

setup:
	terraform init -upgrade
	terraform apply -auto-approve
	aws eks update-kubeconfig --name $(CLUSTER) --region $(REGION)
	kubectl apply -f $(METRICS)
	kubectl apply -f $(INGRESS)
	@echo "✅ Cluster and addons deployed."


# ===============================
# DESTROY
# ===============================

destroy:
	kubectl delete svc --all -A || true
	kubectl delete ingress --all -A || true
	terraform destroy -auto-approve
	@echo "🗑️  All resources destroyed."
