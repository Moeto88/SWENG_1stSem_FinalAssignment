# Use a lighter version of Node as a parent image
FROM mhart/alpine-node:latest
# Set up arguments
ARG PORT=local
ENV PORT ${PORT}
# Set the working directory to /api
WORKDIR /api
# install dependencies
RUN npm install
# Copy the current directory contents into the container at /api
COPY . .
# Expose port
EXPOSE ${PORT}
# Run the app when the container launches
CMD ["node", "app.js"]
