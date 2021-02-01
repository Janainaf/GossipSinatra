class ID
	attr_accessor :id, :content
	def initialize(id,content)
		@id = id
		@content = content
	end
	#cette fonction nous renvoie un array d'objets comment avec tous les commentaires stockes dans le fichier csv
	def self.all
		id_array = [] #on initialise un array vide
	 	CSV.read("./db/ids.csv").each do |line|
		 	id_array << ID.new(line[0],line[1])
		end
 		return id_array
	end
	
	#cette fonction sauvegarde en mémoire le commentaire en question
	def save
	  CSV.open("./db/ids.csv", "a") do |csv|
	    csv << [@id,@content]
	  end
	  
	end
	
	def self.all_with_id (id)
		return self.all.select {|comment| comment.id.to_i == id}
	end
	
	
end
