# p9frproxy

Neptune Planet9 Image with embedded squid and HAProxy for egress and ingress traffic. Built for running on k8s with environments variables in deploy or configmap.

### example deployment 
```yaml
    spec:
      containers:
      - name: planet9
        image: <custom image>
        # image: neptunesoftware/planet9:v21.10.6
        resources:
          requests:
            cpu: 800m
            memory: 4Gi
          limits:
            cpu: 1500m
            memory: 4Gi
        env:
        - name: HTTPS_HOSTED
          value: "TRUE"
        - name: SAMESITE_VALUE
          value: "None"
        - name: HTTP_PROXY
          value: "http://localhost:3128"
        - name: HTTPS_PROXY
          value: "http://localhost:3128"
```

