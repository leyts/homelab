#!/usr/bin/env bash

secret="$(openssl rand -base64 24 | head --bytes 32)"

echo "$secret"
