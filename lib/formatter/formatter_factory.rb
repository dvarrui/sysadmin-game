# encoding: utf-8

require_relative 'csv_formatter'
require_relative 'html_formatter'
require_relative 'txt_formatter'
require_relative 'xml_formatter'

module FormatterFactory
	
  def FormatterFactory.get(pReport, pFormat, pFilename)
    case pFormat
    when :csv
      f=CSVFormatter.new(pReport)
    when :html
      f=HTMLFormatter.new(pReport)
    when :txt
      f=TXTFormatter.new(pReport)
    when :xml
      f=XMLFormatter.new(pReport) if pFormat==:xml
    end
    f.init(pFilename)
    return f
  end	
end