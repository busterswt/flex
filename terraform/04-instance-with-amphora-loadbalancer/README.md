## 04-instance-with-loadbalancer

### Initialize

```
terraform init
```

### Create stack

```
terraform apply
```

This script will create:
-   1 router
-   1 network
-   3 http instances
-   1 load balancer (amphora)
-   1 public floating ip for the VIP

### Delete stack

```
terraform destroy
```
