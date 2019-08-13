@gem_files = IO.readlines('gemfile_lock_locations.txt', chomp: true)
@gems = []

@gem_files.each do |gf|
  # if !gf.include?('docs') && !gf.include?('yard')
    stuff = IO.readlines(gf, chomp: true)
    specs = stuff.select { |k| k.start_with?('    ') && !k.start_with?('     ') }
    specs.each do |s|
      @gems << s.strip.gsub!(' (', '-').gsub(')', '')
    end
  # end
end

puts "number of gems total #{@gems.length}"
uniq_gems = @gems.uniq.sort
puts "number of gems deduped #{uniq_gems.length}"
uniq_gems.each do |u|
  puts u
end
