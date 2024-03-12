create table kunde (
  kundennummer varchar not null,
  name varchar not null,
  email varchar not null
);

create unique index kunden_idx on kunde (kundennummer);