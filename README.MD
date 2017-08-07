
# simple folder duplicator for macOS

Simple async file replication script. Duplicate data from "/data/from" mount point to "
/data/to".

Using every minute cron and rsync with " --checksum --archive --delete".
rsync scrpit with little preventing double launch hack based on PID file.

## Usage for macOS
Install docker for mac os from [official docker repo](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)

```
docker run --rm -d -v /~:/data/from -v /Volumes/homes-1/.backup:/data/to mchus/duplicator
