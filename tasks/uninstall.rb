#!/opt/puppetlabs/puppet/bin/ruby

# Puppet Task to uninstall a Puppet Forge module
# https://puppet.com/docs/puppet/5.3/modules_installing.html#uninstalling-modules
# This can only be run against the Puppet Master.
#
# Parameters:
#   * module - The name of the Puppet Forge module to uninstall.

require 'puppet'
require 'open3'

Puppet.initialize_settings

results = {}
params = JSON.parse(STDIN.read)
modname = params['modules'].split(',')

unless Puppet[:server] == Puppet[:certname]
  puts 'This task can only be run against the Master (of Masters)'
  exit 1
end

def uninstall_module(modname)
    stdout, stderr, status = Open3.capture3('/opt/puppetlabs/bin/puppet', 'module', 'uninstall', modname)
  {
    stdout: stdout.strip,
    stderr: stderr.strip,
    exit_code: status.exitstatus
  }
end

modname.each do |mod|
  results[mod] = {}

  output=uninstall_module(mod)

  if output[:exit_code] == 0
    results[mod][:result] = if output[:stdout].include? 'Removed'
                              puts ''
                              puts "The '#{mod}' module has been uninstalled."
                              puts ''
                            end
  else
    results[mod][:result] = case output[:stderr]
    when /is not installed/
      puts ''
      puts "The '#{mod}' module(s) is not installed."
      puts 'Either check your spelling and try again or it was not installed on the system.'
      puts outputerr[2..100]
      puts ''
    when /Other installed modules have dependencies/
      puts ''
      puts "Other installed modules have dependencies on '#{mod}'."
      puts ''
    end
  end
end
