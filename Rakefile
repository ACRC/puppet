require 'puppet-lint/tasks/puppet-lint'

task :default => [:lint]

PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.send('disable_arrow_alignment')
PuppetLint.configuration.send('disable_selector_inside_resource')
PuppetLint.configuration.send('disable_case_without_default')
PuppetLint.configuration.send('disable_variable_scope')
