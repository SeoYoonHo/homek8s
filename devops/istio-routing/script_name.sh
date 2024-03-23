#!/bin/bash

# 조회할 네임스페이스 설정
NAMESPACE=jenkins

# 해당 네임스페이스에 있는 모든 파드의 이름을 조회하고, 각 파드에 대한 로그를 출력
kubectl get pods -n ${NAMESPACE} -o name | grep test | while read pod; do
    echo "==========================="
    echo "Logs for $pod jnlp"
    kubectl logs -c jnlp -n ${NAMESPACE} $pod
    echo "==========================="
    echo "Logs for $pod kaniko"
    kubectl logs -c kaniko -n ${NAMESPACE} $pod
done
