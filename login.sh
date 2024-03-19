# Authenticate via browser
az login
# Get current subscription
subscriptionID=$(az account show --query id -o tsv)
# Create/update servie account with a role (e.g. "Owner")
az ad sp create-for-rbac --name ${theServiceAccount} --role Owner --scopes /subscriptions/${subscriptionID}
# Get current tenant
tenantID=$(az account show --query tenantId -o tsv)
# Login with the updated service account
az login --service-principal --tenant ${tenantID} -u "info@reanimate.io"