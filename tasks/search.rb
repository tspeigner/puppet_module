#!/opt/puppetlabs/puppet/bin/ruby

# Puppet Task to search for a Puppet Forge module.
# https://puppet.com/docs/puppet/5.3/modules_installing.html
# This can only be run against the Puppet Master.
#
# Parameters:
#   * module - The name of the Puppet Forge module to search for.

require 'puppet'
require 'open3'
require 'json'

Puppet.initialize_settings

results = {}
params = JSON.parse(STDIN.read)
modname = params['search_for'].split(',')

unless Puppet[:server] == Puppet[:certname]
  puts 'This task can only be run against the Master (of Masters)'
  exit 1
end

def search_module(modname)
  stdout, stderr, status = Open3.capture3('/opt/puppetlabs/bin/puppet', 'search', '--render-as JSON', modname)
{
  stdout: stdout.strip,
  stderr: stderr.strip,
  exit_code: status.exitstatus
}
end

modname.each do |mod|
  results[mod] = {}
  output=search_module(modname)
  output_json = JSON.parse(output)
  answers = output_json['answers']

answers.each do |answer|
  full_name = answer['full_name']
  version = answer['version']
  description = answer['desc']

  puts full_name
  puts version
  puts description
 end
end
