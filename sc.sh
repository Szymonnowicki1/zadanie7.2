#!/bin/bash

echo "Testing connection to frontend..."
docker exec szymu-frontend-1 curl -s http://localhost > /dev/null
if [ $? -eq 0 ]; then
    echo "Frontend connection successful."
else
    echo "Failed to connect to frontend."
fi

echo "Testing connection to backend..."
docker exec szymu-frontend-1 curl -s http://localhost:3000 > /dev/null
if [ $? -eq 0 ]; then
    echo "Backend connection successful."
else
    echo "Failed to connect to backend."
fi

echo "Testing database connection from backend..."
docker exec szymu-database-1 psql -h localhost -U postgres -c "SELECT 1" > /dev/null
if [ $? -eq 0 ]; then
    echo "Database connection from backend successful."
else
    echo "Failed to connect to database from backend."
fi
