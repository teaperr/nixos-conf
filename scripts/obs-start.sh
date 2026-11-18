#!/usr/bin/env bash
rm -rf ~/.config/obs-studio/.sentinel && obs --startreplaybuffer & disown
