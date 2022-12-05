#!/bin/sh
set -e

DATA_DIR=/data
BACKUPS_DIR=/backups

backup() {
  if [ -z "$1" ] || [ "$1" = "all" ]; then
    for src in ${DATA_DIR}/*; do
      backup_single "$(basename "$src")" "$2"
    done
  else
    backup_single "$1" "$2"
  fi
}

backup_single() {
  SOURCE="$1"
  DEST="$SOURCE"
  if [ -n "$2" ]; then
    DEST="${DEST}-${2}"
  fi
  DEST="${DEST}.tar.gz"

  if [ -z "$SOURCE" ]; then
    echo "Usage: backup [<source-name|all>] [<backup-name>]" >&2
    exit 1
  fi

  if [ ! -d "${DATA_DIR}/$SOURCE" ]; then
    echo "ERROR: Source directory for $SOURCE does not exist." >&2
    exit 1
  fi

  if [ -f "${BACKUPS_DIR}/${DEST}" ]; then
    echo "WARN: Overwriting existing destination file ${DEST}..." >&2
  fi

  cd "${DATA_DIR}/${SOURCE}"
  echo "Backing up ${SOURCE} to ${DEST}..."
  tar -czf "${BACKUPS_DIR}/${DEST}" .
  echo "Backup of ${SOURCE} to ${DEST} complete."
}

restore() {
  if [ -z "$1" ] || [ "$1" = "all" ]; then
    for src in ${DATA_DIR}/*; do
      restore_single "$(basename "$src")" "$2"
    done
  else
    restore_single "$1" "$2"
  fi
}

restore_single() {
  SOURCE="$1"

  if [ -z "$SOURCE" ]; then
    echo "Usage: restore [<source-name|all>] [<backup-name>]" >&2
    exit 1
  fi

  if [ ! -d "${DATA_DIR}/$SOURCE" ]; then
    echo "ERROR: Restore target directory for $SOURCE does not exist." >&2
    exit 1
  fi

  DEST=""
  if [ -n "$2" ]; then
    if [ -f "${BACKUPS_DIR}/${2}" ]; then
      DEST="${2}"
    elif [ -f "${BACKUPS_DIR}/${2}.tar.gz" ]; then
      DEST="${2}.tar.gz"
    elif [ -f "${BACKUPS_DIR}/${SOURCE}-${2}" ]; then
      DEST="${SOURCE}-${2}"
    else
      DEST="${SOURCE}-${2}.tar.gz"
    fi
  else
    DEST="${SOURCE}.tar.gz"
  fi

  if [ ! -f "${BACKUPS_DIR}/${DEST}" ]; then
    echo "ERROR: Restore source file ${DEST} does not exist." >&2
    exit 1
  fi

  cd "${DATA_DIR}/${SOURCE}"
  echo "Restoring ${DEST} to ${SOURCE}..."
  tar -xzf "${BACKUPS_DIR}/${DEST}" .
  echo "Restored ${DEST} to ${SOURCE}."
}

case "$1" in
  backup)
    backup "$2" "$3"
    ;;
  restore)
    restore "$2" "$3"
    ;;
  *)
    echo "Usage: {backup|restore} [<source-name|all>] [<backup-name>]" >&2
    exit 1
    ;;
esac
