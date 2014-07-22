# Configuration Volume

The config directory is used to contain project specific configuration files that can be used to override the default configuration files included in a docker container. Custom configuration files can be made available to the associated container by using a data volume container. The config directory should be mapped to /etc/services-config on the CoreOS VM and a subdirectory should be created for each container or container pool (group of containers that share data and/or configuration).
