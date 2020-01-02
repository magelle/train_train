# TrainTrain.Umbrella

The goal here is to try to do a fully working event sourced system with elixir.

# Used technologies

- Elixir, Mix, ...
- Phoenix : https://hexdocs.pm/phoenix/
- Ecto : https://hexdocs.pm/ecto
- Commanded : https://github.com/commanded/commanded

## The steps

- [V] Having a working env
- [V] Having a working Phoenix and be able to display a page
- [V] Do a simple CRUD application
  - [V] Create the table
  - [V] Insert in the table
  - [V] Display the elements of the table
  - [V] Add modify and delete feature
  - [V] Test everything, we are not that rude !
- [V] Add interfaces on top of the Ecto CRUD
- [V] add event sourcing on top of CRUD
  - [V] Create an Aggregate
  - [V] Be able to handle command
  - [V] Be able to handle events
  - [V] Be able to query a projection
  - [V] Bind everything to a HTML GUI
- [ ] Learned skills by writing a software which handle train ticket reservation
- [ ] Do some load tests


## Notes

### Ecto
To re-create the database, do : 
```
mix ecto.drop
mix ecto.create
mix ecto.migrate
```
To create a new migration script, do :
```mix ecto.gen.migration```

Dispatch an event : 
```TrainTicket.Application.dispatch(%TrainTicket.Commands.Create{uuid: "4438a241-f50a-495c-b167-dd749aeb673f", name: "My event"})```