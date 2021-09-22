#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0

function _exit(){
    printf "Exiting:%s\n" "$1"
    exit -1
}

# Exit on first error, print all commands.
set -ev
set -o pipefail

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export FABRIC_CFG_PATH="${DIR}/../config"

cd "${DIR}/../dis-network/"

docker kill cliDigiBank cliMagnetoCorp logspout || true
# ./network.sh down
./network.sh up createChannel -ca -s couchdb

# Copy the connection profiles so they are in the correct organizations.
cp "${DIR}/../dis-network/organizations/peerOrganizations/org1.dis.com/connection-org1.yaml" "${DIR}/organization/digibank/gateway/"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org2.dis.com/connection-org2.yaml" "${DIR}/organization/magnetocorp/gateway/"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org3.dis.com/connection-org3.yaml" "${DIR}/organization/bigfund/gateway/"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org4.dis.com/connection-org4.yaml" "${DIR}/organization/brokerhouse/gateway/"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org5.dis.com/connection-org5.yaml" "${DIR}/organization/hedgematic/gateway/"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org6.dis.com/connection-org6.yaml" "${DIR}/organization/ratem/gateway/"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org1.dis.com/users/User1@org1.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org1.dis.com/users/User1@org1.dis.com/msp/signcerts/User1@org1.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org1.dis.com/users/User1@org1.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org1.dis.com/users/User1@org1.dis.com/msp/keystore/priv_sk"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org2.dis.com/users/User1@org2.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org2.dis.com/users/User1@org2.dis.com/msp/signcerts/User1@org2.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org2.dis.com/users/User1@org2.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org2.dis.com/users/User1@org2.dis.com/msp/keystore/priv_sk"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org3.dis.com/users/User1@org3.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org3.dis.com/users/User1@org3.dis.com/msp/signcerts/User1@org3.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org3.dis.com/users/User1@org3.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org3.dis.com/users/User1@org3.dis.com/msp/keystore/priv_sk"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org4.dis.com/users/User1@org4.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org4.dis.com/users/User1@org4.dis.com/msp/signcerts/User1@org4.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org4.dis.com/users/User1@org4.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org4.dis.com/users/User1@org4.dis.com/msp/keystore/priv_sk"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org5.dis.com/users/User1@org5.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org5.dis.com/users/User1@org5.dis.com/msp/signcerts/User1@org5.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org5.dis.com/users/User1@org5.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org5.dis.com/users/User1@org5.dis.com/msp/keystore/priv_sk"

cp "${DIR}/../dis-network/organizations/peerOrganizations/org6.dis.com/users/User1@org6.dis.com/msp/signcerts/"* "${DIR}/../dis-network/organizations/peerOrganizations/org6.dis.com/users/User1@org6.dis.com/msp/signcerts/User1@org6.dis.com-cert.pem"
cp "${DIR}/../dis-network/organizations/peerOrganizations/org6.dis.com/users/User1@org6.dis.com/msp/keystore/"* "${DIR}/../dis-network/organizations/peerOrganizations/org6.dis.com/users/User1@org6.dis.com/msp/keystore/priv_sk"


echo Suggest that you monitor the docker containers by running
echo "./organization/magnetocorp/configuration/cli/monitordocker.sh fabric_test"
