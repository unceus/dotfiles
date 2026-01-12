#!/usr/bin/env bash

cwd_workspace_label() {
  local cwd label worktree_count common

  cwd="${PWD##*/}"

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '%s' "$cwd"
  fi

  worktree_count="$(git worktree list --porcelain 2>/dev/null | awk '/^worktree /{n++} END{print n+0}')"
  if [[ -z "$worktree_count" || "$worktree_count" -le 1 ]]; then
    printf '%s' "$cwd"
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

  printf '%s' "${label:-$cwd}"

}
