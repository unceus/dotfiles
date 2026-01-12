#!/usr/bin/env bash

cwd_workspace_label() {
  local cwd label worktree_count common wt_name
  local pwd_abs wt_path in_wt

  if [[ "$PWD" == "$HOME" ]]; then
    cwd="~"
  else
    cwd="${PWD##*/}"
  fi

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '%s' "$cwd"
    return
  fi

  worktree_count="$(git worktree list --porcelain 2>/dev/null | awk '/^worktree /{n++} END{print n+0}')"
  if [[ -z "$worktree_count" || "$worktree_count" -le 1 ]]; then
    printf '%s' "$cwd"
    return
  fi

  pwd_abs="$(pwd -P 2>/dev/null)"
  while IFS= read -r line; do
    if [[ "$line" == worktree\ * ]]; then
      wt_path="${line#worktree }"
      in_wt=
      if [[ "$pwd_abs" == "$wt_path" || "$pwd_abs" == "$wt_path/"* ]]; then
        in_wt=1
        break
      fi
    fi
  done < <(git worktree list --porcelain 2>/dev/null)

  if [[ -n "$in_wt" ]]; then
    wt_name="${wt_path##*/}"
  fi

  label="$(git config --get remote.origin.url 2>/dev/null)"
  if [[ -n "$label" ]]; then
    label="${label##*/}"
    label="${label%.git}"
  fi

  if [[ -z "$label" ]]; then
    common="$(git rev-parse --git-common-dir 2>/dev/null)"
    if [[ -n "$common" ]]; then
      common="$(cd "$common" 2>/dev/null && pwd -P)"
      if [[ -n "$common" ]]; then
        if [[ "$(basename "$common")" == ".git" ]]; then
          label="$(basename "$(dirname "$common")")"
        else
          label="$(basename "$common")"
        fi
      fi
    fi
  fi

  if [[ -n "$label" && -n "$wt_name" ]]; then
    printf '%s' "${label}:${wt_name}"
  else
    printf '%s' "${label:-$cwd}"
  fi

}
