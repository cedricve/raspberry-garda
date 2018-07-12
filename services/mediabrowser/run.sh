
# run the simple PHP process to act as web interface
while sleep 3; do
    echo "Starting the configurator server..."
    php -S 0.0.0.0:80 KodExplorer/index.php
done


#sleep infinity




