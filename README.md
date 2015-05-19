# Puppet Tomcat

[![puppet forge version](https://img.shields.io/puppetforge/v/sbitio/tomcat.svg)](http://forge.puppetlabs.com/sbitio/tomcat) [![last tag](https://img.shields.io/github/tag/sbitio/puppet-tomcat.svg)](https://github.com/sbitio/puppet-tomcat/tags)

Performs installation and configuration of Tomcat, **based on packages provided by the OS**.

## Features

 * Allows to choose which version to install when the OS provides more than one.
 For instance Debian Wheezy and Jessie provide Tomcat 6,7 and 7,8 respectively.
 If not specified, latest version is used.
 * Integrates with [sbitio/monit](https://forge.puppetlabs.com/sbitio/monit).
 * Compatible with [sbitio/solr](https://github.com/sbitio/puppet-solr).


## Classes and Defined Types

### Class: `tomcat`

`tomcat` class is the responsible of installing and configuring the service.

### Defined type: `tomcat::context`

`tomcat::context` allows to define contexts. See [sbitio/solr](https://github.com/sbitio/puppet-solr/blob/master/manifests/instance.pp#L29) for an example of use.

## License

MIT License, see LICENSE file

## Contact

Use contact form on http://sbit.io

## Support

Please log tickets and issues on [GitHub](https://github.com/sbitio/puppet-tomcat)

