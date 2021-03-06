require "SRTParses/version"

module SRTParses
  class SRTParser
	
	def parse_file(path_to_file)	
		file = File.read(path_to_file)
		
		hash = Hash.new
		hash["number_of_words"] = number_of_words(file)
		hash["number_of_lines"] = number_of_lines(file).length
		hash["number_of_symbols"] = number_of_symbols(file)
		hash["average_symbols_per_line"] = average_symbols_per_line(file).round(2)
		hash["max_symbols_per_line"] = max_symbols_per_line(file)
		hash["number_of_sentences"] = number_of_sentences(file).length
		hash["average_symbols_per_sentence"] = average_symbols_per_sentence(file).round(2)
		hash["duration"] = duration(file)
		hash["average_duration"] = average_duration(file).round(2)
		return hash
	end
	
	def number_of_words(file)	
		return wCount = file.scan(/[a-zA-Z']+/).length
	end	
	
	def number_of_lines(file)
		return lCount = file.scan(/^[a-zA-Z',~ !@#$%^&*()\-{}\[\]|”:><?.]+$/)
	end

	def number_of_symbols(file)
		
		lines = number_of_lines(file)	
		
		sCount = 0
		
		lines.each do |line|
			sCount += line.scan(/[~!@#$%^&*()\-\{}\[\]|”:><?]/).length
		end

		return sCount
	end
	
	def average_symbols_per_line(file)

		lines = number_of_lines(file).length
		symbols = number_of_symbols(file)
		
		avrS = 0
		avrS = symbols.to_f/lines.to_f
		if avrS.to_i == avrS.to_f 
			number = avrS.to_f.round(0)
		else 
			number = avrS.to_f.round(2)
		end
		return number
	end

	def max_symbols_per_line(file)
		
		lines = number_of_lines(file)
		max = 0
		sCount = 0
		lines.each do |line|
			sCount = number_of_symbols(line)
			if max < sCount
			
				max = sCount
			end
		end
		return max
		
	end
	
	def number_of_sentences(file)
		return file.scan(/[A-Z][^.!?]+./)
	end
	
	def average_symbols_per_sentence(file)
		symNumber = 0
		sentences = number_of_sentences(file)
		sentences.each do |sentence|
			symNumber += number_of_symbols(sentence)	
		end

		number = symNumber.to_f/sentences.length.to_f
		
		if number.to_i == number.to_f 
			result = number.to_f.round(0)
		else 
			result = number.to_f.round(2)
		end
		
		return result
		
	end
		
	def duration(file) 
		dur = file.scan(/([0-9]{2}):([0-9]{2}):([0-9]{2}),([0-9]{3})/)
		result = 0
		result = dur[dur.length-1][0].to_i*3600 + dur[dur.length-1][1].to_i*60 + dur[dur.length-1][2].to_i + dur[dur.length-1][3].to_i.round(2)/1000
	end
	
	def average_duration(file)
		dur = duration(file)
		numberSub = file.scan(/^\d+$/).length
		avgDur = dur.to_f/numberSub.to_f
		return avgDur
	end	

	
end
	
	
end
