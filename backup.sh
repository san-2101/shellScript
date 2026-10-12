#!/bin/bash
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/practice-scripts_${TIMESTAMP}.tar.gz"
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

cleanup_old_backups() {
    # rakho sirf last 7 backups, baaki delete
    cd "$BACKUP_DIR"
    ls -1t practice-scripts_*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm -f
}

prepare_backup_dir
take_backup
cleanup_old_backups

echo "Done. backups:"
ls -lh "$BACKUP_DIR"/practice-scripts_*.tar.gz
