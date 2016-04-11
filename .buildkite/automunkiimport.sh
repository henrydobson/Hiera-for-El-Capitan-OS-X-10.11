#!/bin/bash
set -eo pipefail
munkiimport --subdirectory apps/PuppetLabs/Hiera -c testing --verbose  --nointeractive 
