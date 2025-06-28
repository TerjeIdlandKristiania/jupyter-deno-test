#!/bin/bash
while IFS= read -r line; do
  deno cache "$line"
done < deno_requirements.txt