# STEP 7: build images and push to Docker hub
docker build -t kidobi/multi-client:latest -t kidobi/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t kidobi/multi-server:latest -t kidobi/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t kidobi/multi-worker:latest -t kidobi/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push kidobi/multi-client:latest
docker push kidobi/multi-server:latest
docker push kidobi/multi-worker:latest

docker push kidobi/multi-client:$GIT_SHA
docker push kidobi/multi-server:$GIT_SHA
docker push kidobi/multi-worker:$GIT_SHA


# STEP 8: apply all configs in k8s folder
kubectl apply -f k8s

# STEP 9: imperatively set latest image on each deployment
kubectl set image deployments/server-deployment server=kidobi/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=kidobi/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=kidobi/multi-worker:$GIT_SHA
 