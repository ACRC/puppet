# selinux

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Development - Guide for contributing to the module](#development)

## Overview

This class manages SELinux on RHEL based systems.

## Module Description

This module will configure SELinux and/or deploy SELinux based modules to running system.

Requires puppetlabs/stdlib

## Usage

Parameters:

 * `$mode` (enforced|permissive|disabled) - sets the operating state for SELinux.

## Reference

Basic usage:

```
include selinux
```

More advanced usage:

```
class { selinux:
  mode => 'enforcing'
}
```

Deploy a custom module:

```
selinux::module { 'resnet-puppet':
  ensure => 'present',
  source => 'puppet:///modules/site_puppet/site-puppet.te',
}
```

## Development

This module is a fork of jfryman/selinux as a means to publish it more quickly on Puppet
Forge. There is an [outstanding issue](https://github.com/jfryman/puppet-selinux/issues/7)
on the upstream project to publish it.
