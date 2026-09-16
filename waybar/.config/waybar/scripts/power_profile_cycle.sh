#!/usr/bin/env bash
# Click handler for the power_profile waybar module: cycles
# performance -> balanced -> power-saver -> performance.

case "$(powerprofilesctl get)" in
    performance) next=balanced ;;
    balanced)    next=power-saver ;;
    *)           next=performance ;;
esac

powerprofilesctl set "$next"
pkill -RTMIN+9 waybar
