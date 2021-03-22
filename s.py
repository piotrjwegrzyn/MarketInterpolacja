import webbrowser
import time

for i in range(32):
	
	time.sleep(1)
	
	if i < 10:
	
		webbrowser.open('https://www.gpw.pl/archiwum-notowan-full?type=10&instrument=CDPROJEKT&date=0' + str(i) + '-12-2020', new=2)
	
	else:
	
		webbrowser.open('https://www.gpw.pl/archiwum-notowan-full?type=10&instrument=CDPROJEKT&date=' + str(i) + '-12-2020', new=2)

