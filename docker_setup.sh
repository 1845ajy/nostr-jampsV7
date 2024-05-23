# Function to check if Docker image exists
image_exists() {
    docker image inspect "$1" &>/dev/null
}

# Build Docker images for each project if they don't exist
if ! image_exists nostr-rs-relay_image; then
    cd nostr-rs-relay
    docker build -t nostr-rs-relay_image .
fi

if ! image_exists rnostr_image; then
    cd rnostr
    docker build -t rnostr_image .
fi

if ! image_exists strfry_image; then
    cd strfry
    docker build -t strfry_image .
fi

# Run Docker containers for each project with different ports
docker run -d -p 7000:8080 --name nostr-rs-relay_container nostr-rs-relay_image
docker run -d -p 7001:8080 --name rnostr_container rnostr_image
docker run -d -p 7002:8080 --name strfry_container strfry_image
