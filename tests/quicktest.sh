#!/bin/bash

export BUILDKITE_PLUGIN_HONEYMARKER_MESSAGE=$MESSAGE
export BUILDKITE_PLUGIN_HONEYMARKER_WRITEKEY=$WRITEKEY
export BUILDKITE_PLUGIN_HONEYMARKER_DATASET=$DATASET
export BUILDKITE_PLUGIN_HONEYMARKER_URL="https://tend.buildkite.com/"

hooks/post-command
