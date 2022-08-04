FROM node:14-alpine 
WORKDIR /app
COPY my-app/* /app
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]