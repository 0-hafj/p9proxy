# p9proxy

Repo to build Neptune Planet9 image with forward and reverse proxy.  
Image built to be deployed to Kubernetes with required env variables in deploy or cm.

Folder ``p9proxy`` including config for squid forward proxy  
Folder ``p9frproxy`` including config for squid forward proxy and HAProxy as reverse proxy.  




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
        ports:
        - containerPort: 8080
          name: planet9
        env:
        - name: HTTPS_HOSTED
          value: "TRUE"
        - name: SAMESITE_VALUE
          value: "None"
        - name: HTTP_PROXY
          value: "http://localhost:3128"
        - name: HTTPS_PROXY
          value: "http://localhost:3128"
        - name: NO_PROXY ## requests to these addresses are not forwarded to squid
          value: ".domain.no, .domain.com"          
```

