#!/bin/bash
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/practice-scripts_${TIMESTAMP}.tar.gz"
S3_BUCKET="spt-21011991"
S3_PREFIX="shell-backups/practice-scripts"
#echo $SOURCE_DIR/-- $BACKUP_DIR--/--$TIMESTAMP--/-- $ARCHIVE --
prepare_backup_dir() {
    if [[ ! -d $BACKUP_DIR ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backup folder: $BACKUP_DIR"
    fi
}

take_backup() {
    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
    echo "Backup done: $ARCHIVE"
    echo "Size: $(du -h "$ARCHIVE" | awk '{print $1}')"
}
upload_to_s3() {
    echo "S3 par backup upload ho raha hai..."

    aws s3 cp "$ARCHIVE" \
        "s3://${S3_BUCKET}/${S3_PREFIX}/$(basename "$ARCHIVE")"

    echo "S3 upload successful!"
    echo "S3 location: s3://${S3_BUCKET}/${S3_PREFIX}/$(basename "$ARCHIVE")"
}

cleanup_old_backups() {
    # rakho sirf last 7 backups, baaki delete
    cd "$BACKUP_DIR"
    ls -1t practice-scripts_*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm -f
#delete old backup from s3 also

# Keep only the latest 7 S3 backups
    aws s3 ls "s3://${S3_BUCKET}/${S3_PREFIX}/" |
        awk '$4 ~ /^practice-scripts_.*\.tar\.gz$/ {
            print $1, $2, $4
        }' |
        sort -r |
        tail -n +8 |
        while read -r date time filename; do
            echo "Deleting old S3 backup: $filename"
            aws s3 rm "s3://${S3_BUCKET}/${S3_PREFIX}/${filename}"
        done
}

prepare_backup_dir
take_backup
upload_to_s3
cleanup_old_backups

echo "Done. backups:"
ls -lh "$BACKUP_DIR"/practice-scripts_*.tar.gz
