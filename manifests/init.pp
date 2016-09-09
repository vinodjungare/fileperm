# Class: fileperm
# ===========================
#
# Full description of class fileperm here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'fileperm':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class fileperm {

# Creating a local file
file { 'c:/skill.txt' :
  ensure  => 'file',
  mode    => '0660',
  owner   => 'localuser',
  group   => 'skillbuilder',
}

# Creating a local folder
file { 'c:/skillbuilder' :
  ensure  => 'directory',
  mode    => '0660',
  owner   => 'localuser',
  group   => 'skillbuilder',
}

acl { 'c:/localfile.txt':
  permissions => [
   { identity => 'localuser', rights => ['full'] },
   { identity => 'skillbuilder', rights => ['read'] }
 ],
}

acl { 'c:/skillbuilder':
  permissions => [
   { identity => 'localuser', rights => ['full'] },
   { identity => 'skillbuilder', rights => ['read'] }
 ],
}

}
