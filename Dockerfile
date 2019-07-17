# This is the base image which determines from which Docker image the container should derive.
FROM microsoft/dotnet:latest

# Copy the files and folders from current directory to "app" directory.
COPY . /Idt.Test.Service

# Set the working directory as "app" directory
WORKDIR /Idt.Test.Service

# Run the following commands in Linux Terminal to restore .NET Core packages
RUN dotnet restore
 
# Build the application
RUN dotnet build

# Expose a port number from the container to outside world
EXPOSE 5000

# Determine an entry point of the application.
ENTRYPOINT ["dotnet", "run", "--project", "Idt.Test.Service"]