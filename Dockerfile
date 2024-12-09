# Go lang image based on Alpine Linux (a lightweight Linux distribution)
FROM golang:1.22.5-alpine 

# Sets the working directory inside the container
WORKDIR /app

# Copies the project's dependencies (go.mod) to the container's working directory.
COPY go.* ./

# Downloads and organizes all required dependencies based on your go.mod file.
RUN go mod tidy

# Copies all remaining files to the container's working directory.
COPY . .

# It ensure that the templates folder is included, even if Docker's caching interferes with COPY . ..
COPY templates ./templates

# Compiles the app into a binary named "app"
RUN go build -o app

# Informs Docker that the container will listen on port 8080 at runtime.
EXPOSE 8080

# Specifies the command to run when the container starts
CMD ["./app"]
