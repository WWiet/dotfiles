#!/usr/bin/env bash
set -euo pipefail

STATE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/tmux-pomodoro"
STATE_FILE="$STATE_DIR/state"
POMODORO_SECONDS=1500
BREAK_SECONDS=300

format_duration() {
    local total=$1
    if [ "$total" -lt 0 ]; then
        total=0
    fi
    local minutes=$((total / 60))
    local seconds=$((total % 60))
    printf "%02d:%02d" "$minutes" "$seconds"
}

write_state() {
    mkdir -p "$STATE_DIR"
    cat <<EOF >"$STATE_FILE"
label=$1
duration=$2
start=$3
paused=$4
remaining=$5
EOF
}

read_state() {
    if [ ! -f "$STATE_FILE" ]; then
        echo ""
        return
    fi

    while IFS='=' read -r key value; do
        case "$key" in
        label) LABEL="$value" ;;
        duration) DURATION="$value" ;;
        start) START="$value" ;;
        paused) PAUSED="$value" ;;
        remaining) REMAINING="$value" ;;
        esac
    done <"$STATE_FILE"
}

status_line() {
    read_state

    if [ -z "${LABEL:-}" ]; then
        local remaining=$POMODORO_SECONDS
        printf "READY %s %s" "$(format_label "POMODORO")" "$(format_duration "$remaining")"
        return
    fi

    local duration=${DURATION:-$POMODORO_SECONDS}
    local label=${LABEL:-POMODORO}
    local paused=${PAUSED:-1}
    local remaining=${REMAINING:-$duration}

    if [ "$paused" -eq 0 ]; then
        local now
        now=$(date +%s)
        local elapsed=$((now - START))
        remaining=$((duration - elapsed))
    fi

    if [ "$remaining" -le 0 ]; then
        printf "#[fg=red]DONE!#[default]"
        return
    fi

    if [ "$paused" -eq 1 ]; then
        printf "READY %s %s" "$(format_label "$label")" "$(format_duration "$remaining")"
    else
        printf "%s %s" "$(format_label "$label")" "$(format_duration "$remaining")"
    fi
}

format_label() {
    if [ "$1" = "POMODORO" ]; then
        printf "#[fg=white]%s#[default]" "$1"
        return
    fi
    if [ "$1" = "BREAK" ]; then
        printf "#[fg=yellow]%s#[default]" "$1"
        return
    fi
    printf "%s" "$1"
}

case "${1:-status}" in
status)
    status_line
    ;;
start)
    write_state "POMODORO" "$POMODORO_SECONDS" "$(date +%s)" 0 "$POMODORO_SECONDS"
    ;;
break)
    write_state "BREAK" "$BREAK_SECONDS" "$(date +%s)" 0 "$BREAK_SECONDS"
    ;;
reset)
    read_state
    local_label=${LABEL:-POMODORO}
    local_duration=${DURATION:-$POMODORO_SECONDS}
    write_state "$local_label" "$local_duration" "$(date +%s)" 1 "$local_duration"
    ;;
*)
    echo "usage: $0 {status|start|break|reset}" 1>&2
    exit 1
    ;;
esac
