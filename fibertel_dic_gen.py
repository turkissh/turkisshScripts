#!/usr/bin/env python
import time,sys,signal

#Define signal handler
def signal_handler(signal, frame):
        file.close()
        sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

print('Welcome to fibertel dic generator')

try:
	file = open('fibertel.dic' , 'w')
except Exception, e:
	print('Fail to open file: %s' % e)


try:
	print('Lets generate numbers!')
	time.sleep(2)

	for i in xrange(100000000) :
		
		

		for x in xrange(10) :

			num = (x + i * 10)

			sys.stdout.write('\r')
			sys.stdout.write("[%-100s] %d%%" % ( '='* ((num * 100) /  100000000), ((num * 100) /  100000000) ))
			sys.stdout.flush()

			#print('%012d' % (x + i * 10) )
			file.write('%012d\n' % (num) )

except Exception, e:
	file.close()
	raise e


file.close()

print('Bye bye!')