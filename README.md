
# puppet_module 

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with puppet_module](#setup)
    * [What puppet_module affects](#what-puppet_module-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet_module](#beginning-with-puppet_module)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

The puppet_module task enables users to Install, Uninstall, Search, and List modules.

## Setup

### Setup Requirements

Install the module through your Puppetfile or through the command line on the Puppet Master.

### Beginning with puppet_module

## Usage

Go to Puppet Web UI > Tasks > Select `puppet_module::install` example:

![Image](https://github.com/tspeigner/puppet_module/raw/master/img/module_install_example.png)

`puppet_module::uninstall` example:

![Image](https://github.com/tspeigner/puppet_module/raw/master/img/module_uninstall_example.png)

`puppet_module::search` example:

![Image](https://github.com/tspeigner/puppet_module/raw/master/img/module_search_example.png)

`puppet_module::list` example:

![Image](https://github.com/tspeigner/puppet_module/raw/master/img/module_list_example.png)

## Reference

[More information about installing Puppet Modules from the Puppet Forge](https://puppet.com/docs/puppet/5.3/modules_installing.html#install-modules-from-the-puppet-forge)

[More information on uninstalling Puppet Modules](https://puppet.com/docs/puppet/5.3/modules_installing.html#uninstalling-modules)

[More information on searching Puppet Modules on the Puppet Forge](https://puppet.com/docs/puppet/5.3/modules_installing.html#finding-forge-modules)

[More information on Puppet Module List commands](https://puppet.com/docs/puppet/5.3/modules_installing.html#listing-installed-modules)

## Limitations

These tasks can only run on the Puppet Master.

## Development

Fork it, change it, submit it, make it your own, or provide feedback.
