class Gossip
attr_accessor :author, :content

def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end
  

	def initialize (author, content)
	@content = content
	@author = author
	end

	
	def save 
	my_gossip= Gossip.new(author, content)
	CSV.open("db/gossip.csv", "a") do |file|
	file << [@author, @content]
    	end 
	
	def self.find(id)
		return Gossip.all[id]
	end


end	
end 
#last version
