if [ $# -eq 0 ]; then
  port=8081  # Default port number
else
  port=$1  # Use the provided port number
fi
docker build -t cow1 .
docker run -d --name cowsay -p $port:$port -e PORT="$port" cow1 

echo "Using port number: $port"

