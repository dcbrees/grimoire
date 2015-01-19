Purpose

Grimoire is for creating physical representations of Alliance LARP
Spell Books and Alchemy Recipe Books containing rules text.


Process

Rules text from the Alliance LARP Rule Book have been formatted in
XML. Ruby scripts query the XML using the Nokogiri gem and output
LaTeX markup. The generated LaTeX markup is included in static LaTeX
documents to create a grimoire.


Tools

pdftotext 0.26.5 - Convert the Alliance LARP Rule Book from PDF to
text

ruby 2.1.5p273 - Interpret Ruby scripts

pdflatex 1.40.15 - LaTeX markup compiler to PDF


Status

Grimoire is currently a proof-of-concept in which the tool chain is
used to output rules text similar to the Alliance LARP Rule Book.


Legal

The Alliance LARP Rule Book (of which this is a derivative) is
copyright Michael A. Ventrella, Esq. and this project is not for the
purpose of sale. See the Alliance LARP Rule Book for copyright
information.
