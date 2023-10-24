FROM golang:alpine AS build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM scratch

COPY --from=build /app/main /main

EXPOSE 8080

CMD ["/main"]