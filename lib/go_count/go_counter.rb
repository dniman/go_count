module GoCount
  class GoCounter
    def count
			Dir[File.expand_path('../../..',__FILE__) + "/data/*.sql"].each do |file_name| 
	      go_count = 0
  		  File.open(file_name).each do |line|
	  		  go_count += 1 if line.match(/GO\n/)
        end
        puts "#{file_name} - #{go_count}"
		  end
    end
  end
end