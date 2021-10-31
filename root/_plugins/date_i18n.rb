require "date"


module Jekyll
  module DateFilter
    def l(input, format=nil, lang=nil)
      format_list = format.scan /%[a-zA-Z]/
      to_translate = format_list.select { |n| n =~ /^(%b|%B|%a|%A)$/ }

      # Load locale
	  lang = lang || @context.registers[:page]["lang"] || @context.registers[:site].config["lang"]
      # Load translation
      trad = YAML.load_file(File.join(File.dirname(__FILE__), "../_data/%s/date.yml" % [lang]))

      str = input.strftime(format)
      index = 0
      for i in to_translate
        en = input.strftime(i)
        translated = trad[i][en]

        # Replace the corresponding string
        index += str[index..-1].index en
        str = str[0...index] + translated + str[index+en.length..-1]
        index = index + translated.length
      end

      str
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateFilter)

