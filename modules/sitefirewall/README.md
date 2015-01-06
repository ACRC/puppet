# sitefirewall

![Travis CI](https://travis-ci.org/danfoster/puppet-sitefirewall.svg?branch=master)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sitefirewall](#setup)
    * [What sitefirewall affects](#what-sitefirewall-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sitefirewall](#beginning-with-sitefirewall)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module provides sensible defaults for extra classes as required for `puppetlabs/firewall`. 

## Module Description

This module defines defeaults for `pre` and `post` firewall rules. These are:
* Allow IMCP
* Allow all traffic to local (`lo`) interface
* Allow RELATED and ESTABLISHED connections
* Drop all other traffic

## Setup

### What sitefirewall affects

This module depends on `puppet/firewall` and therefore affects the following:

* Every node running a firewall
* Firewall settings in your system
* Connection settings for managed nodes
* Unmanaged resources (get purged)


## Usage

Include `sitefirewall` to get started:

```
class { '::sitefirewall' }
```

Then you are able to use `firewall` rules as described on the (`puppetlabs/firewall`)[https://forge.puppetlabs.com/puppetlabs/firewall#usage] page.

## Development

Pull requests are gratefully received.
