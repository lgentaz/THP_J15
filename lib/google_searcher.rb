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

#méthode du clic
#!#submit_button = browser.button(type:"submit")
#!#submit_button.click


browser.driver.manage.timeouts.implicit_wait = 3
#!#browser.window(title: "Foo")wait_while(&:exists?)

#puts browser.url
goto = []
page_title = [] 

search_result_divs = browser.links(:xpath => '//div[@class="rc"]//a')
search_result_divs.each do |a|
	p a.text
	goto << a.href
end


p "Méfait accompli, fermeture du browser"

browser.close

#pour empecher la fermeture de la fenetre
#!#while true
#!#end


Launchy.open(goto[0])


