require 'nokogiri'

effects =  Nokogiri::XML(File.open("../xml/effects.xml"))

def sanitize(s)
  s = s.gsub('#', '\#')
  s = s.gsub('<', '\\textless{}')
  s = s.gsub('>', '\\textgreater{}')
  return s
end

def wrap(tag, content)
  "\\" + tag + "{" + sanitize(content) + "}"
end

output = ""
list = []
s = []

output << wrap("section*", "Effects") + "\n"

effects.xpath('//effect').each do |effect|
  list.clear
  
  output << wrap("subsection*", effect.at('name').text) + "\n"
  output << wrap("index", effect.at('name').text) + "\n"
  
  if effect.at('spell')
    list.push 'Spell'
  end

  if effect.at('potion')
    list.push 'Potion'
  end

  if effect.at('scroll')
    list.push 'Scroll'
  end

  if effect.at('contact')
    list.push 'Contact Gel'
  end
  
  if effect.at('elixir')
    list.push 'Elixir'
  end
  if effect.at('gas')
    list.push 'Gas'
  end

  if effect.at('weapon')
    list.push 'Weapon'
  end
  
  if !list.empty?
    output << wrap("begin", "itemize") + "\n"
    list.each do |l|
      output << "\\item " + l + "\n"
    end
    output << wrap("end", "itemize") + "\n"
  end

  output << "\\noindent " + wrap("textbf", effect.at('group').text)
  output << " \\hfill " + wrap("textbf", effect.at('duration').text) + "\n"

  output << sanitize(effect.at('description').text) + "\n\n"

  if effect.at('spell')
    output << wrap("begin", "center")
    output << wrap("textbf", wrap("textit", "``" + effect.at('spell/verbal').text + "\""))
    output << "\\linebreak\n"

    c, e = false
    effect.search('.//school').each do |school|
      if school.text == "Celestial"
        c = true
      end
      if school.text == "Earth"
        e = true
      end
    end
    
    output << wrap("begin", "tabular}{lcr") + "\n"
    if c
      output << "Celestial "
    end
    output << "\& " + effect.search('.//level').text + " \& "
    if e
      output << "Earth "
    end
    output << "\\\\" + "\n"
    output << wrap("end", "tabular") + "\n"
    output << wrap("end", "center")
  end
  
  File.write('../tex/generated/effects.tex', output)
end

