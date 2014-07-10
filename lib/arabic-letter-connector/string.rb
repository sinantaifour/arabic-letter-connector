class String
  def connect_arabic_letters
  	# Number in arabic letters appears reversed
    ArabicLetterConnector.transform(self).gsub(/\d+/) {|m| m.reverse}
  end
end
