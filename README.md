# Orb Publishment

```
circleci namespace create sha-python github senolatac
circleci orb validate .circleci/config.yml 
circleci orb publish .circleci/config.yml sha-python/sha-python-deploy@dev:first
circleci orb publish promote sha-python/sha-python-deploy@dev:first patch
```
