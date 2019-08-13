#!/bin/bash

# The base directory for the release is provided as an input to the shell script
# e.g. ~/Desktop/my_release
base_dir=$1
ls -l $base_dir/build/gems/gems | awk '{ print $9 }' > gems.txt

ruby gems_versions.rb > gems_versions.txt
ruby parse_file_list.rb > gems_to_fix.txt

# Find Gemfiles to fix
find $base_dir -name Gemfile -print | grep -v "/build/gems/gems" | grep -v "/plugins/" > gemfile_locations.txt
find $base_dir -name Gemfile.lock -print | grep -v "/build/gems/gems" | grep -v "/plugins/" > gemfile_lock_locations.txt

# ruby locate_gemfiles.rb > gemfiles_gems.txt
# ruby locate_gemfile_to_fix.rb > files_to_fix.txt

# Parse Gemfile.lock files if needed
# ruby parse_gemfile_locks.rb >  gems_from_lock.txt

# Determine current version numbers and latest version number from rubygems
ruby get_gem_version_nos.rb > versions.txt
