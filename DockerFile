# Dockerfile
FROM hexpm/elixir:1.15.5-erlang-26.1.2-alpine-3.18 as build

RUN apk add --no-cache build-base npm git python3

WORKDIR /app

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only prod
RUN mix deps.compile

COPY assets assets
RUN npm --prefix ./assets install
RUN npm --prefix ./assets run deploy
RUN mix phx.digest

COPY lib lib
COPY priv priv
RUN mix release

# Runtime stage
FROM alpine:3.18 AS app

RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app

COPY --from=build /app/_build/prod/rel/todoist_clone ./

ENV REPLACE_OS_VARS=true \
    PHX_SERVER=true \
    MIX_ENV=prod

CMD ["bin/todoist_clone", "start"]
