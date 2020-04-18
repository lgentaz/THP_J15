require 'watir'
require 'pry'
require 'launchy'

search_what = ARGV.join(" ")

browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'


search_bar = browser.text_field(class: "gsfi")
search_bar.set(search_what)

#appuie sur entrer

(search_bar.send_keys(:enter))

browser.driver.manage.timeouts.implicit_wait = 3
#!#browser.window(title: "Foo")wait_while(&:exists?)

search_result_divs = browser.divs(class:"rc")
search_result_divs.each { |div| puts div.h3.text }

binding.pry

p "Méfait accompli, fermeture du browser"

browser.close

#pour empecher la fermeture de la fenetre
#!#while true
#!#end

#méthode du clic
#!#submit_button = browser.button(type:"submit")
#!#submit_button.click

Launchy.open("http://stackoverflow.com")