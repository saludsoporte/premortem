working_directory "/home/ruby3/premortem"
pid "/home/ruby3/premortem/tmp/pids/unicorn.pid"
stderr_path "/home/ruby3/premortem/log/unicorn.log"
stdout_path "/home/ruby3/premortem/log/unicorn.log"

listen "/tmp/unicorn.premortem.sock", :backlog=>64
#listen "0.0.0.0:8443", :tcp_nopush => true
worker_processes 2
timeout 30