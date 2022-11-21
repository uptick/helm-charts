# TODO

- [ ] bg deployment chart
- [ ] ingress

```
      terminationGracePeriodSeconds: 60
        livenessProbe:
          httpGet:
            path: /robots.txt
            port: 8000
            httpHeaders:
            - name: X-Forwarded-Proto
              value: https
          initialDelaySeconds: 30
          periodSeconds: 30
          # Setting timeout seconds to 10  so we don't fail when request is busy. Defaults to 1s
          timeoutSeconds: 10
          # Number of times to fail before restarting
          failureThreshold: 5
        readinessProbe:
          httpGet:
            path: /robots.txt
            port: 8000
            httpHeaders:
            - name: X-Forwarded-Proto
              value: https
          initialDelaySeconds: 10
          periodSeconds: 30
          timeoutSeconds: 5
```
