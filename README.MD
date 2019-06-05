# simple folder duplicator for macOS
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmchus%2Farb.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmchus%2Farb?ref=badge_shield)


Simple async file replication script. Duplicate data from "/data/from" mount point to "
/data/to".

Using every minute cron and rsync with " --checksum --archive --delete".
rsync scrpit with little preventing double launch hack based on PID file.

## Usage for macOS
Install docker for mac os from [official docker repo](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)

```
docker run --rm -d -v /Users/$USER:/data/from -v /Volumes/homes-1/.backup:/data/to mchus/duplicator


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmchus%2Farb.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmchus%2Farb?ref=badge_large)