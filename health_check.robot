# Take a snapshot of the operacional state of the device
# and compare with a stable version

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

Profile Operational Models
    [Documentation]    Get a snapshot of the operational information
    Profile the system for "platform;interface;routing;ospf;bgp" on devices "SITE_A_CORE;SITE_A_EDGE;SITE_B_EDGE;SITE_B_CORE" as "./snapshot/health_check/health_check"

Compare Operational Models
    [Documentation]    Compare the current operational state with stable version
    compare profile "./snapshot/stable/stable" with "./snapshot/health_check/health_check" on devices "SITE_A_CORE;SITE_A_EDGE;SITE_B_EDGE;SITE_B_CORE"
