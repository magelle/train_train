-- sudo docker run --name train_train_postgres -e POSTGRES_PASSWORD=traintrain -d postgres
-- sudo docker exec -ti train_train_postgres bash
-- psql -U postgres -W -d train_train_dev

create role train_train_user WITH LOGIN createdb PASSWORD 'train_train_password';

create database train_train_dev OWNER = train_train_user;
create database train_train_test OWNER = train_train_user;

create database train_ticket_ev_test ;
create database train_train_projections_test ;