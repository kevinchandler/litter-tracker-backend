# README

API to log my cat's litter box usage. Who wouldn't want to predict when their
cat's going to go next? 💩

- get `/pause` # pause logging events for 1 hour
- get `/resume` # resume logging events
- post `/log-event` # tries to create log entry
- get `/events` # view log entries

# .env

`API_KEY_PUBLIC` provides access to `/events` only. `API_KEY_PRIVATE` can access
any resource

```
API_KEY_PUBLIC='super-secret'
API_KEY_PRIVATE='super-duper-secret'
```
