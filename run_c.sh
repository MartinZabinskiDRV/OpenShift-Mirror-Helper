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
./prepare.sh | tee prepare.log

echo "Bereite Pull Secret vor"
./mod_pull_secret.sh | tee mod_pull_secret.log
echo "Dry run für Metadaten"
./dry_run.sh | tee dry_run.log
echo "Starte Mirror Process"
./mirror.sh | tee mirror.log

exit 0
echo "Upload Images in Mirror"
./upload_mirror.sh | tee upload_mirror.log

