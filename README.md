[![Build Status](https://travis-ci.org/magelle/train_train.svg?branch=master)](https://travis-ci.org/magelle/train_train)
[![Coverage Status](https://coveralls.io/repos/github/magelle/train_train/badge.svg?branch=master)](https://coveralls.io/github/magelle/train_train?branch=master)

# TrainTrain

The goal here is to try to do a fully working event sourced system with elixir.

# Used technologies

- Elixir, Mix, ...
- Phoenix : https://hexdocs.pm/phoenix/
- Ecto : https://hexdocs.pm/ecto
- Commanded : https://github.com/commanded/commanded

## The steps

- [x] Having a working env
- [x] Having a working Phoenix and be able to display a page
- [x] Do a simple CRUD application
  - [x] Create the table
  - [x] Insert in the table
  - [x] Display the elements of the table
  - [x] Add modify and delete feature
  - [x] Test everything, we are not that rude !
- [x] Add interfaces on top of the Ecto CRUD
- [x] add event sourcing on top of CRUD
  - [x] Create an Aggregate
  - [x] Be able to handle command
  - [x] Be able to handle events
  - [x] Be able to query a projection
  - [x] Bind everything to a HTML GUI
  - [x] Tests !!!
    - [x] Test the aggregate
    - [x] Test the projection
    - [x] Test an event handler
- [x] Do some dependency injection
    - [x] With Behaviour
- [x] Add some types with Typespec
- [x] Add travis-ci config
- [x] Add coveralls config
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
