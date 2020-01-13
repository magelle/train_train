[![Build Status](https://travis-ci.org/magelle/train_train.svg?branch=master)](https://travis-ci.org/magelle/train_train)

# TrainTrain

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
  - [V] Tests !!!
    - [V] Test the aggregate
    - [V] Test the projection
    - [V] Test an event handler
- [V] Do some dependency injection
    - [V] With Behaviour
- [V] Add some types with Typespec
- [ ] Learned skills by writing a software which handle train ticket reservation
- [ ] Do some load tests, to see how it' goes


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

### Observer

Run the observer to display lot of information about the running elixir programs
```:observer.start```

### Tests

With ExUnit

- run tests ```mix test```
- with coverage ```mix test --cover``` 

### Typings : typescpec

https://hexdocs.pm/elixir/typespecs.html

- Create a type with @type
- Create a signature with @spec
- Verify everything with ```mix dialyzer```
