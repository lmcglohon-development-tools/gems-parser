File.open('gemfile_locations.txt') do |gem_file_loc|
  @gem_files = gem_file_loc.readlines
end

File.open('gems_to_fix.txt') do |g|
  @gems_to_fix = g.readlines
end

@gem_files.each do |gf|
  `ls "#{gf}"`
  @gems_to_fix.each do |g|
    # c = "grep #{g} #{gf}"
    # results = `"#{c}"`
  end
end
