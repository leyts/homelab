#!/usr/bin/env bash

secret="$(openssl rand -base64 24 | head --bytes 32)"

printf '%s\n' "$secret"

printf '%s' "$secret" > /dev/clipboard
printf '\nCopied secret to clipboard.\n'
