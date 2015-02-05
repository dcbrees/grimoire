# Create build/ if necessary
if !Dir.exist?("build")
  Dir.mkdir("build")
end

# Generate ./build/effects.tex
Dir.chdir("rb") do
  `ruby effects.rb`
end

# Generate ./build/grimoire.pdf
Dir.chdir("build") do
  `pdflatex ../tex/grimoire.tex` # Creates files for index
  `makeindex grimoire`
  `pdflatex ../tex/grimoire.tex` # Finishes pdf
end
