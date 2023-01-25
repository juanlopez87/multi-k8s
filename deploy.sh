docker build -t skalloween/multi-client:latest -t skalloween/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t skalloween/multi-server:latest -t skalloween/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t skalloween/multi-worker:latest -t skalloween/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push skalloween/multi-client:latest
docker push skalloween/multi-server:latest
docker push skalloween/multi-worker:latest

docker push skalloween/multi-client:$SHA
docker push skalloween/multi-server:$SHA
docker push skalloween/multi-worker:$SHA

# Path: k8s
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=skalloween/multi-client:$SHA
kubectl set image deployments/server-deployment server=skalloween/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=skalloween/multi-worker:$SHA