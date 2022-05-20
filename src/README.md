# Orb Publishment

```
circleci setup
circleci namespace create sha-python github senolatac
circleci orb validate .circleci/config1.yml
circleci orb publish .circleci/config1.yml sha-python/sha-python-deploy@dev:first
https://circleci.com/developer/orbs/orb/sha-python/sha-python-deploy?version=dev:first
circleci orb publish promote sha-python/sha-python-deploy@dev:first patch
```
