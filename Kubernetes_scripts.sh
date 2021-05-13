#Get cluster info
kubectl cluster-info

#View nodes
kubectl get nodes -o wide

#Schedule the deployment of hello-world app (imperative)
##kubectl create deployment hello-world --image=garyr/hello-world-app:1.0.0
#Scale up the replica set to 2
##kubectl scale --replicas=2 deployment/hello-world

#Schedule the deployment of hello-world app (declarative)
kubectl apply -f deployment.yaml

#View all Kubernetes deployments
kubectl get deployments

#Get pod info
kubectl get pods -o wide

#Call the service on one of the PODs
curl http://<one_of_pod_ip_addresses>:8080/computer

#sh into the POD
kubectl exec -it <one_of_POD_names> -- sh
    #Call the service on another POD
    curl http://<ip_address_of_the_other_pod>:8080/computer
    

#Run the service
curl http://<ip_address_of_one_of_your_Kubernetes_nodes>:8080/computer


###################################################Services##############################################################################

#Imperative
kubectl expose deployment hello-world --port=8080 --target-port=8080 --type=NodePort

#Create a Kubernetes service to expose our service
#Declarative: Yaml
kubectl apply -f service.yaml
 
#Get all deployments in the current name space
kubectl get services -o wide

curl http://<cluster_ip>:8080/computer

#Execute the service throug its NodePort:
curl <ip_address_of_one_of_your_Kubernetes_nodes>:<node_port_port_#>/computer


#Clean up
kubectl delete deployment hello-world
kubectl delete service hello-world