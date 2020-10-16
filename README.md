### creProxy
Nginx-Proxy to forward different subdomains to their assigned containers and ensure a secure connection.
Uses open-ssl and letsencrypt

##  Available Versions
 * 2016.0
 * 2018.0
 * 2020.0

## Example yaml-File for docker-compose

```yaml
  cre-proxy:
    image: tamboraorg/creproxy:<version>
    container_name: creproxy
    environment:
      ADMIN_EMAIL: admin@example.com
      CRE_DOMAIN: example.com
      CRE_EMPTY_SUBDOMAIN: www
      #CRE_DEVELOPMENT: dev 
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "./volumes/certs:/etc/letsencrypt"
    volumes_from:
      - cre-glue
```

## Environment Variables

 * ADMIN_EMAIL: admin@example.com
 * CRE_DOMAIN: example.com
 * CRE_EMPTY_SUBDOMAIN: www
 * CRE_DEVELOPMENT: dev  - Development mode: Uses localhost 


