require 'watir'
require 'pry'
require 'launchy'

search_what = ARGV.join(" ")

browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'


search_bar = browser.text_field(class: "gsfi")
search_bar.set(search_what)

#appuie sur entrer
search_bar.send_keys(:enter)

#méthode du clic
##submit_button = browser.button(type:"submit")
##submit_button.click

sleep (30)

Launchy.open("http://stackoverflow.com")