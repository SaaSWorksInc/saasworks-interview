echo "Starting postgres..."
docker-compose up -d 
sleep 2
echo
./bin/import.sh