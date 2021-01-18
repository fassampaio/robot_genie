# Take a snapshot of the operacional state of the device
# and save the output to a stable directory

*** Settings ***
Library       ats.robot.pyATSRobot
Library       genie.libs.robot.GenieRobot

*** Variables ***
${testbed}    ./inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    [Documentation]    Define the hosts to connect and test connections
    
    use genie testbed "${testbed}"

    connect to device "SITE_A_CORE"
    connect to device "SITE_A_EDGE"
    connect to device "SITE_B_EDGE"
    connect to device "SITE_B_CORE"

Profile Platform
    [Documentation]    Get a snapshot of the platform information
    Profile the system for "platform;interface;routing;ospf;bgp" on devices "SITE_A_CORE;SITE_A_EDGE;SITE_B_EDGE;SITE_B_CORE" as "./snapshot/stable/stable"
