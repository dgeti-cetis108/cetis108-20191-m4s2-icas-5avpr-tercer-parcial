-- michi-library.com
create database michidb;
use michidb;

create user 'admin_michidb'@'localhost' identified by '123';
grant all on michidb.* to 'admin_michidb'@'localhost';

-- books, clients, users, categories, loans, authors, editorials
-- strong entities: clients, users, categories, authors, editorials

create table clients (
    id int auto_increment primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(200) default null,
    cellphone varchar(20) default null,
    address text not null
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table users (
    id int auto_increment primary key,
    name varchar(16) not null unique,
    password varchar(200) not null,
    email varchar(200) not null unique,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    remember_token varchar(200) default null,
    status enum('0','1') not null -- 0:Inactive 1:Active
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table categories (
    id int auto_increment primary key,
    name varchar(100) not null
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table authors (
    id int auto_increment primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(200) default null,
    website varchar(200) default null
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table editorials (
    id int auto_increment primary key,
    name varchar(100) not null,
    email varchar(200) not null,
    website varchar(200) default null,
    phone varchar(20) not null,
    address text not null
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table books (
    id int auto_increment primary key,
    title varchar(200) not null,
    isbn varchar(16) default null,
    num_pages smallint not null,
    edition year not null,
    editorial_id int not null,
    category_id int not null,
    constraint fk_books__editorials
        foreign key (editorial_id)
        references editorials(id)
            on update cascade
            on delete restrict,
    constraint fk_books__categories
        foreign key (category_id)
        references categories(id)
            on update cascade
            on delete restrict
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table books_has_authors (
    book_id int,
    author_id int,
    primary key (book_id, author_id),
    constraint fk_books_has_authors__books
        foreign key (book_id)
        references books(id)
            on update cascade
            on delete restrict,
    constraint fk_books_has_authors__authors
        foreign key (author_id)
        references authors(id)
            on update cascade
            on delete restrict
) engine=innodb, charset=utf8, collate=utf8_general_ci;


create table loans (
    id int auto_increment primary key,
    user_id int not null,
    client_id int not null,
    date_outgoing timestamp not null deafult current_timestamp,
    date_incoming timestamp null default null
) engine=innodb, charset=utf8, collate=utf8_general_ci;

create table loans_has_books (
    loan_id int not null,
    book_id int not null,
    quantity tinyint not null,
    primary key (loan_id, book_id)
    constraint fk_loans_has_books__loans
        foreign key (loan_id)
        references loans(id)
            on update cascade
            on delete restrict,
    constraint fk_loans_has_books__books
        foreign key (book_id)
        references books(id)
            on update cascade
            on delete restrict
) engine=innodb, charset=utf8, collate=utf8_general_ci;