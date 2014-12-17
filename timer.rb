#!/usr/bin/env ruby
require 'terminal-notifier'

def print_help
    print 'help'
end
def parse_time(time_str)
    time = time_str.scan(/([\d.]    +)/).flatten.first.to_f
    if time_str=~/m$/i
        time *=60
    elsif time_str=~/s$/i
        time *=1
    elsif time_str=~/h$/i
        time *=3600
    end
    time
end
wait_sec='10s'
title='Timer'
content='Time out!'
if ARGV.size >= 3
    time = ARGV[0]
    title = ARGV[1]
    content = ARGV[2..-1].join(' ')
elsif ARGV.size == 2
    time, content = *ARGV
elsif ARGV.size == 1
    time =ARGV[0]
else
    print_help
    exit()
end

wait_sec = parse_time(time)
puts  wait_sec
sleep(wait_sec)
TerminalNotifier.notify(content,title: title)


    


