@dir = "./"

worker_processes 2 # CPUのコア数に揃える
working_directory @dir

timeout 300
listen 8081

# unicornは標準出力には何も吐かないのでログ出力を忘れずに
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
