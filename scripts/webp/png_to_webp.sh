#!/usr/bin/env bash
# Convert PNG assets to WebP with cwebp, optionally delete sources and rewrite refs.
#
# Usage:
#   ./scripts/webp/png_to_webp.sh <file|dir> [more files/dirs...]
#   ./scripts/webp/png_to_webp.sh -q 80 -m 6 --delete --replace-refs assets/images/common/showcase
#
# Options:
#   -q <0-100>     quality (default: 80)
#   -m <0-6>       method (default: 6)
#   -o <dir>       output directory (default: same as each source)
#   --delete       remove source .png after successful convert
#   --replace-refs rewrite *.dart / *.yaml references from .png -> .webp
#   -h, --help     show help
#
# Example (project root):
#   ./scripts/webp/png_to_webp.sh --delete --replace-refs \
#     assets/images/common/showcase assets/images/common/room

set -euo pipefail

QUALITY=80
METHOD=6
OUT_DIR=""
DELETE_SRC=0
REPLACE_REFS=0

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"

resolve_cwebp() {
  # Prefer vendored binaries (stable in CI / broken brew deps).
  local bundled
  for bundled in \
    "$ROOT_DIR/scripts/webp/libwebp-1.5.0/bin/cwebp" \
    "$ROOT_DIR/scripts/webp/libwebp-1.1.0-mac/bin/cwebp"
  do
    if [[ -x "$bundled" ]]; then
      echo "$bundled"
      return
    fi
  done
  if command -v cwebp >/dev/null 2>&1; then
    command -v cwebp
    return
  fi
  echo "cwebp not found. Install via brew or use scripts/webp/libwebp-*/bin/cwebp" >&2
  exit 1
}

CWEBP="$(resolve_cwebp)"

usage() {
  sed -n '2,22p' "$0" | sed 's/^# \{0,1\}//'
}

ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    -q) QUALITY="$2"; shift 2 ;;
    -m) METHOD="$2"; shift 2 ;;
    -o) OUT_DIR="$2"; shift 2 ;;
    --delete) DELETE_SRC=1; shift ;;
    --replace-refs) REPLACE_REFS=1; shift ;;
    -h|--help) usage; exit 0 ;;
    --) shift; ARGS+=("$@"); break ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
    *) ARGS+=("$1"); shift ;;
  esac
done

if [[ ${#ARGS[@]} -eq 0 ]]; then
  usage
  exit 1
fi

# Collect png paths
PNGS=()
add_png() {
  local f="$1"
  [[ -f "$f" ]] || return 0
  case "${f##*.}" in
    png|PNG) PNGS+=("$f") ;;
  esac
}

for target in "${ARGS[@]}"; do
  if [[ -d "$target" ]]; then
    while IFS= read -r -d '' f; do
      PNGS+=("$f")
    done < <(find "$target" -type f \( -iname '*.png' \) -print0 | sort -z)
  elif [[ -f "$target" ]]; then
    add_png "$target"
  else
    echo "Skip missing path: $target" >&2
  fi
done

if [[ ${#PNGS[@]} -eq 0 ]]; then
  echo "No PNG files found."
  exit 0
fi

CONVERTED=()
FAILED=0

for src in "${PNGS[@]}"; do
  base="$(basename "$src")"
  name="${base%.*}"
  dir="$(dirname "$src")"
  dest_dir="${OUT_DIR:-$dir}"
  mkdir -p "$dest_dir"
  dest="$dest_dir/$name.webp"

  echo "→ $src"
  if ! "$CWEBP" "$src" -q "$QUALITY" -m "$METHOD" -quiet -o "$dest"; then
    echo "  FAIL" >&2
    FAILED=$((FAILED + 1))
    continue
  fi

  src_size=$(wc -c <"$src" | tr -d ' ')
  dst_size=$(wc -c <"$dest" | tr -d ' ')
  echo "  OK  $dest  (${src_size} -> ${dst_size} bytes)"

  CONVERTED+=("$src|$dest")

  if [[ "$DELETE_SRC" -eq 1 ]]; then
    rm -f "$src"
    echo "  deleted $src"
  fi
done

if [[ "$REPLACE_REFS" -eq 1 && ${#CONVERTED[@]} -gt 0 ]]; then
  echo ""
  echo "Rewriting code references (.png -> .webp) ..."
  # Only rewrite asset-relative keys like common/showcase/foo.png
  # Never rewrite bare basenames (avoids matching ic_add.png etc).
  OLD_KEYS=()
  NEW_KEYS=()
  for pair in "${CONVERTED[@]}"; do
    src="${pair%%|*}"
    [[ "$src" == *"/assets/images/"* ]] || continue
    rel="${src##*/assets/images/}"
    old_key="${rel%.*}.png"
    new_key="${rel%.*}.webp"
    OLD_KEYS+=("$old_key")
    NEW_KEYS+=("$new_key")
  done

  if [[ ${#OLD_KEYS[@]} -gt 0 ]]; then
    while IFS= read -r -d '' file; do
      changed=0
      for i in "${!OLD_KEYS[@]}"; do
        old_key="${OLD_KEYS[$i]}"
        new_key="${NEW_KEYS[$i]}"
        if grep -qF "$old_key" "$file" 2>/dev/null; then
          if [[ "$(uname)" == Darwin ]]; then
            sed -i '' "s|$old_key|$new_key|g" "$file"
          else
            sed -i "s|$old_key|$new_key|g" "$file"
          fi
          changed=1
          echo "  $file: $old_key -> $new_key"
        fi
      done
    done < <(find "$ROOT_DIR/packages_local" "$ROOT_DIR/lib" -type f \( -name '*.dart' -o -name '*.yaml' -o -name '*.yml' \) -print0 2>/dev/null)
  fi
fi

echo ""
echo "Done. converted=${#CONVERTED[@]} failed=$FAILED"
exit "$FAILED"
