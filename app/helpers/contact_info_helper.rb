module ContactInfoHelper
  def phone_number_formatter
    return 'не предоставлен' if phone_number.nil?
    if phone_number.scan(/\d/).count==11
      phone_number.gsub!(/[\s+\(\)]/, '')
      "+#{phone_number[0]}"+
          "(#{phone_number[1..3]})"+
          "#{phone_number[4..6]}-"+
          "#{phone_number[7..8]}-"+
          "#{phone_number[9..10]}"
    else
      phone_number
    end
  end
end
