#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}

# ORG=1
# P0PORT=7051
# CAPORT=7054
# PEERPEM=organizations/peerOrganizations/org1.dis.com/tlsca/tlsca.org1.dis.com-cert.pem
# CAPEM=organizations/peerOrganizations/org1.dis.com/ca/ca.org1.dis.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.dis.com/connection-org1.json
# echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.dis.com/connection-org1.yaml

# ORG=2
# P0PORT=9051
# CAPORT=8054
# PEERPEM=organizations/peerOrganizations/org2.dis.com/tlsca/tlsca.org2.dis.com-cert.pem
# CAPEM=organizations/peerOrganizations/org2.dis.com/ca/ca.org2.dis.com-cert.pem

# echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.dis.com/connection-org2.json
# echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.dis.com/connection-org2.yaml


ORG=1
P0PORT=7051
CAPORT=7054
PEERPEM=organizations/peerOrganizations/org1.dis.com/tlsca/tlsca.org1.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org1.dis.com/ca/ca.org1.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.dis.com/connection-org1.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.dis.com/connection-org1.yaml

ORG=2
P0PORT=8051
CAPORT=8054
PEERPEM=organizations/peerOrganizations/org2.dis.com/tlsca/tlsca.org2.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org2.dis.com/ca/ca.org2.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.dis.com/connection-org2.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.dis.com/connection-org2.yaml

ORG=3
P0PORT=11051
CAPORT=11054
PEERPEM=organizations/peerOrganizations/org3.dis.com/tlsca/tlsca.org3.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org3.dis.com/ca/ca.org3.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org3.dis.com/connection-org3.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org3.dis.com/connection-org3.yaml

ORG=4
P0PORT=12051
CAPORT=12054
PEERPEM=organizations/peerOrganizations/org4.dis.com/tlsca/tlsca.org4.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org4.dis.com/ca/ca.org4.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org4.dis.com/connection-org4.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org4.dis.com/connection-org4.yaml

ORG=5
P0PORT=13051
CAPORT=13054
PEERPEM=organizations/peerOrganizations/org5.dis.com/tlsca/tlsca.org5.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org5.dis.com/ca/ca.org5.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org5.dis.com/connection-org5.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org5.dis.com/connection-org5.yaml

ORG=6
P0PORT=14051
CAPORT=14054
PEERPEM=organizations/peerOrganizations/org6.dis.com/tlsca/tlsca.org6.dis.com-cert.pem
CAPEM=organizations/peerOrganizations/org6.dis.com/ca/ca.org6.dis.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org6.dis.com/connection-org6.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org6.dis.com/connection-org6.yaml