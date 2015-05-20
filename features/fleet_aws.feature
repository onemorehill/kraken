#encoding: utf-8
Feature: Make sure we have the correct number of machines with fleet
  In order to verify that cluster came up correctly
  As kraken developer 
  I should be able to run this scenario and see the correct number of fleet machines
 
  Scenario: Getting fleet machines
    Given I set the environment variables to:
      | variable           | value                    |
      | FLEETCTL_ENDPOINT  | http://52.24.103.52:4001 |
    When I run `fleetctl list-machines --no-legend --fields=ip,metadata --full=true`
    Then the output should match:
      """
      .*role=node
      .*role=etcd
      .*role=node
      .*role=master
      .*role=node
      """