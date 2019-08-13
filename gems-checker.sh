#!/bin/bash

base_dir=$1
ls -l $base_dir/build/gems/gems > gems.txt

ruby parse-file-list.rb > gems_to_fix.txt

# Find Gemfiles to fix
# find $base_dir -name Gemfile -print | grep -v "/build/gems/gems" | grep -v "/plugins/" > gemfile_locations.txt
# ruby locate-Gemfile-to-fix.rb > files_to_fix.txt
