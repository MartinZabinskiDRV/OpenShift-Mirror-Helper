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

chmod +x prepare.sh 01_run.sh 02_run.sh

echo "Installiere Abhängigkeiten"
./prepare.sh

echo "Bereite Pull Secret vor"
./01_run.sh
echo "Starte Mirror Process"
./02_run.sh

exit 0
echo "Upload Images in Mirror"
./03_run.sh

