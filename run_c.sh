#! /usr/bin/bash

cd /oc

if [[ ! -e bin/oc ]]; then
  echo "bin/oc fehlt"
  echo "oc cli downloaden und nach bin/oc legen"
  echo ""
  echo "https://docs.openshift.com/container-platform/4.8/cli_reference/openshift_cli/getting-started-cli.html#installing-openshift-cli"
  echo ""
  exit 1
fi

chmod +x prepare.sh mod_pull_secret.sh dry_run.sh mirror.sh upload_mirror.sh

echo "Installiere Abhängigkeiten"
./prepare.sh

echo "Bereite Pull Secret vor"
mod_pull_secret.sh
echo "Dry run für Metadaten"
dry_run.sh | tee metadata.log
echo "Starte Mirror Process"
mirror.sh

exit 0
echo "Upload Images in Mirror"
upload_mirror.sh

