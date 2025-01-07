#!/usr/bin/env ruby
volumes = `run0 btrfs subvolume list -p #{ARGV[0] || "/"}`.lines.map do
	|l| l.match /^ID (?<ID>\d+) gen (?<GEN>\d+) parent (?<PARENT>\d+) top level (?<TOPLEVEL>\d+) path (?<PATH>\S+)$/
end
edges = volumes.map do
	|v| "#{v[:PARENT]!="5" ? "\"#{volumes.find{|p| p[:ID] == v[:PARENT]}[:PATH]}\" -> \"#{v[:PATH]}\"" : "\"#{v[:PATH]}\""};\n"
end
puts "digraph {\n#{edges.map{|e|"\t"+e}.join}}"
