#!/opt/puppetlabs/puppet/bin/ruby

# Puppet Task to list installed modules.
# https://puppet.com/docs/puppet/4.9/modules_installing.html#list-installed-modules
# This can only be run against the Puppet Master.
#
# Parameters:
#   * action - Which action would you like to take? List or Tree List.

require 'puppet'
require 'open3'
require 'json'

Puppet.initialize_settings

params = JSON.parse(STDIN.read)
action = params['action']

unless Puppet[:server] == Puppet[:certname]
  puts 'This task can only be run against the Master (of Masters)'
  exit 1
end

def list_module
  stdout, stderr, status = Open3.capture3('/opt/puppetlabs/bin/puppet', 'module', 'list',)
{
  stdout: stdout.strip,
  stderr: stderr.strip,
  exit_code: status.exitstatus
}
end

def list_tree_module
  stdout, stderr, status = Open3.capture3('/opt/puppetlabs/bin/puppet', 'module', 'list', '--tree')
  {
    stdout: stdout.strip,
    stderr: stderr.strip,
    exit_code: status.exitstatus
  }
end 

listoutput = list_module[:stdout]
treeoutput = list_tree_module[:stdout]

if action == 'list'
  puts listoutput
elsif action == 'tree_list'
  puts treeoutput
else
  puts 'Please select an action.'
end