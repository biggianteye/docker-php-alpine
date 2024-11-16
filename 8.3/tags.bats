#!/usr/bin/env bats

@test "the main tags are created" {
  run bash -c "docker images graze/php-alpine --format '{{.ID}} ({{.Tag}})' | grep "$(docker images graze/php-alpine:8.3 --format '{{.ID}}')""
  echo 'output:' $output
  [[ "$output" == *"(8.3)"* ]]
}

@test "the test tags are created" {
  run bash -c "docker images graze/php-alpine --format '{{.ID}} ({{.Tag}})' | grep "$(docker images graze/php-alpine:8.3-test --format '{{.ID}}')""
  echo 'output:' $output
  [[ "$output" == *"(8.3-test)"* ]]
}
