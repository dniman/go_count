module GoCount
  class GoCounter
    def count
			puts "Directory is empty" if files.count <= 0
			files.each do |file_name| 
	      go_count = 0
  		  File.open(file_name).each do |line|
	  		  go_count += 1 if line.match(/GO\n/)
        end
        puts "#{file_name} - #{go_count}"
		  end
    end

		private
		def path
			File.expand_path('../../../data',__FILE__)		  
    end

    def files
		  Dir["#{path}/*.sql"]
    end
  end
end