#!/bin/bash
backup_local_configs=true
config_file="paths.json"

while getopts 'd' OPTION; do
  case "$OPTION" in
  d)
    backup_local_configs=false
    ;;
  esac
done

declare -A local_paths

# Load JSON into associative array
while IFS="=" read -r key value; do
  # Expand ~ to $HOME
  value="${value/#\~/$HOME}"
  local_paths["$key"]="$value"
done < <(
  jq -r 'to_entries[] | "\(.key)=\(.value)"' "$config_file"
)

for config in "${!local_paths[@]}"; do
  src="$(pwd)/$config"
  dst="${local_paths[$config]}"

  # --- Idempotency: correct symlink already exists
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "Symlink already exists for $config, skipping"
    continue
  fi

  if [ -e "$dst" ]; then

    # --- Backup local config if -d
    if [ "$backup_local_configs" = true ]; then
      echo "Backing up $dst to $dst.bak"
      mv ${dst}{,.bak}
    else
      # --- Else remove it
      echo "Removing $dst"
      rm -rf "$dst"
    fi
  fi

  # --- Create symlink
  echo "Creating symlink $src -> $dst"
  ln -s "$src" "$dst"
done

echo "Done"
