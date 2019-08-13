files = IO.readlines('gems.txt', chomp: true)
f_hash = {}
files.each do |f|
  # Ignore first line which is blank
  unless f.empty?
    # Split on hyphen to determine version numbers
    to_parse = f.split('-')
    # Some version numbers end in java so account for those
    if to_parse[-1] == 'java'
      gem_name = to_parse[0..-3].join('-')
      gem_version = to_parse[-2..-1].join('-')
    else
      gem_name = to_parse[0..-2].join('-')
      gem_version = to_parse[-1]
    end

    # Build hash with gem name as key and version numbers in an array for the value
    if f_hash.key? gem_name.to_sym
      f_hash[gem_name.to_sym].push(gem_version)
    else
      f_hash[gem_name.to_sym] = [ gem_version ]
    end
  end
end

f_hash.each do |k,v|
  puts "gem: #{k}; versions: #{v}" if v.length < 2
end
