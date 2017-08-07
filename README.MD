
# simple folder duplicator for macOS

Simple async file replication script. Duplicate data from "/data/from" mount point to "
/data/to".

Using every minute cron and rsync with " --checksum --archive --delete".
rsync scrpit with little preventing double launch hack based on PID file.

## Usage for macOS
docker run -rm -d mchus/duplicator -v /data/from ~ -v /data/to /Volumes/homes-1/.backup
