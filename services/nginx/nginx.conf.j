daemon off;

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/conf.d/*.conf;
    server_names_hash_bucket_size 128;
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    proxy_connect_timeout       1200;
    proxy_send_timeout          1200;
    proxy_read_timeout          1200;
    send_timeout                1200;
    client_max_body_size        999M;

    server {
            server_name _; # This is just an invalid value which will never trigger on a real hostname.
            listen 80;
            location /configurator {
                proxy_pass http://configurator/;
            }
    }

}