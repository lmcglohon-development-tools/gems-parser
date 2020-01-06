#!/bin/bash

# The base directory for the ArchivesSpace code is provided as an input to the shell script
# e.g. ~/Desktop/dirs/archivesspace
base_dir=$1
if [ $2 == 'T' ]
then
  ls -l $base_dir/gems/gems | awk '{ print $9 }' > gems.txt
else
  ls -l $base_dir/build/gems/gems | awk '{ print $9 }' > gems.txt
fi

ruby gems_versions.rb > gems_versions.txt
ruby parse_file_list.rb > gems_to_fix.txt

# Find Gemfiles to fix
# find $base_dir -name Gemfile -print | grep -v "/build/gems/gems" | grep -v "/plugins/" > gemfile_locations.txt
# find $base_dir -name Gemfile.lock -print | grep -v "/build/gems/gems" | grep -v "/plugins/" > gemfile_lock_locations.txt

# ruby locate_gemfiles.rb > gemfiles_gems.txt
# ruby locate_gemfile_to_fix.rb > files_to_fix.txt

# Parse Gemfile.lock files if needed
# ruby parse_gemfile_locks.rb >  gems_from_lock.txt

# Determine current version numbers and latest version number from rubygems
# ruby get_gem_version_nos.rb > versions.txt
