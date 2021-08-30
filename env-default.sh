
set -euo pipefail

export PATH="$PWD/bin:$PATH"

MIRROR_USER=
MIRROR_PASS=

REG_URL=

MAIL=

PULL_SECRET_FILE="pull-secret.json"
PULL_SECRET_COPY="pull-secret-copy.json"

######################################

# For <release_version>, specify the tag that corresponds to the version of OpenShift Container Platform to install, such as 4.5.4.
OCP_RELEASE=4.8.5
# For <local_registry_host_name>, specify the registry domain name for your mirror repository, and for <local_registry_host_port>, specify the port that it serves content on.
LOCAL_REGISTRY='<local_registry_host_name>:<local_registry_host_port>'
# For <local_repository_name>, specify the name of the repository to create in your registry, such as ocp4/openshift4.
LOCAL_REPOSITORY='ocp4/openshift4'
# For a production release, you must specify openshift-release-dev.
PRODUCT_REPO='openshift-release-dev'
# For <path_to_pull_secret>, specify the absolute path to and file name of the pull secret for your mirror registry that you created.
LOCAL_SECRET_JSON="$PWD/$PULL_SECRET_COPY"
# For a production release, you must specify ocp-release.
RELEASE_NAME='ocp-release'
# Export the type of architecture for your server, such as x86_64
ARCHITECTURE=x86_64
# Export the path to the directory to host the mirrored images
REMOVABLE_MEDIA_PATH=$PWD/


