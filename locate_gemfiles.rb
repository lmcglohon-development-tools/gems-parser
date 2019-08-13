require 'json'

gem_files = IO.readlines('gemfile_locations.txt', chomp: true)
gems_to_fix = IO.readlines('gems_versions.txt', chomp: true)

@gems = {}
gem_files.each do |gf|
  gems_to_fix.each do |g|
    pieces = g.split('; ')
    s = pieces[0].gsub!('gem: ','').chomp
    res = system("grep #{s} #{gf}")
    if res
      if @gems.key? s.to_sym
        @gems[s.to_sym].push(gf)
      else
        @gems[s.to_sym] = [ gf ]
      end
    end
  end
end

@gems.each do |k,v|
  puts "gem: #{k}"
  v.each do |file|
    puts "\t#{file}"
  end
end
