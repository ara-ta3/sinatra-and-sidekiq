@dir = "./"

worker_processes 2
working_directory @dir

timeout 300
listen 8081

stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
