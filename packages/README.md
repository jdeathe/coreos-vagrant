# Packages

The packages directory should contain saved tags of docker container images used in the project. Packages should be xz compressed tar archives saved in a sub-directory for each vendor/user.

The following examples show how to create and use a packaged docke container image on the CoreOS VM.

## Saving a docker image

```
docker save <username>/<imagename> | xz -9 > <imagename>.tar.xz
```

## Loading saved docker image

```
xz -dc /var/services-packages/<username>/<imagename>.[tagname].tar.xz | docker load
```
