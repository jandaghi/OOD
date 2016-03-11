# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table assignment (
  dtype                         varchar(10) not null,
  id                            bigint auto_increment not null,
  constraint pk_assignment primary key (id)
);

create table comment_system (
  id                            bigint auto_increment not null,
  constraint pk_comment_system primary key (id)
);

create table course (
  dtype                         varchar(10) not null,
  id                            varchar(255) not null,
  course_name                   varchar(255),
  course_num                    varchar(255),
  department                    varchar(255),
  year                          integer,
  term                          integer,
  group_number                  integer,
  time                          varchar(255),
  place                         varchar(255),
  constraint pk_course primary key (id)
);

create table course_map (
  id                            bigint auto_increment not null,
  constraint pk_course_map primary key (id)
);

create table course_material (
  id                            bigint auto_increment not null,
  constraint pk_course_material primary key (id)
);

create table grade (
  id                            bigint auto_increment not null,
  value                         integer,
  constraint pk_grade primary key (id)
);

create table inbox (
  id                            bigint auto_increment not null,
  user_id                       bigint,
  constraint uq_inbox_user_id unique (user_id),
  constraint pk_inbox primary key (id)
);

create table message (
  id                            bigint auto_increment not null,
  thread_id                     bigint,
  content                       varchar(255),
  time                          varchar(255),
  writer                        varchar(255),
  constraint pk_message primary key (id)
);

create table message_thread (
  id                            bigint auto_increment not null,
  inbox_id                      bigint,
  subject                       varchar(255),
  constraint pk_message_thread primary key (id)
);

create table my_user (
  dtype                         varchar(10) not null,
  id                            bigint auto_increment not null,
  fname                         varchar(255),
  lname                         varchar(255),
  password                      varchar(255),
  eaddress                      varchar(255),
  inbox_id                      bigint,
  student_id                    bigint,
  constraint pk_my_user primary key (id)
);

create table project (
  dtype                         varchar(10) not null,
  id                            bigint auto_increment not null,
  constraint pk_project primary key (id)
);

create table project_phase (
  id                            bigint auto_increment not null,
  deadline                      varchar(255),
  constraint pk_project_phase primary key (id)
);

create table resources (
  dtype                         varchar(10) not null,
  id                            bigint auto_increment not null,
  constraint pk_resources primary key (id)
);

create table task (
  dtype                         varchar(10) not null,
  id                            bigint auto_increment not null,
  constraint pk_task primary key (id)
);

alter table inbox add constraint fk_inbox_user_id foreign key (user_id) references my_user (id) on delete restrict on update restrict;

alter table message add constraint fk_message_thread_id foreign key (thread_id) references message_thread (id) on delete restrict on update restrict;
create index ix_message_thread_id on message (thread_id);

alter table message_thread add constraint fk_message_thread_inbox_id foreign key (inbox_id) references inbox (id) on delete restrict on update restrict;
create index ix_message_thread_inbox_id on message_thread (inbox_id);


# --- !Downs

alter table inbox drop foreign key fk_inbox_user_id;

alter table message drop foreign key fk_message_thread_id;
drop index ix_message_thread_id on message;

alter table message_thread drop foreign key fk_message_thread_inbox_id;
drop index ix_message_thread_inbox_id on message_thread;

drop table if exists assignment;

drop table if exists comment_system;

drop table if exists course;

drop table if exists course_map;

drop table if exists course_material;

drop table if exists grade;

drop table if exists inbox;

drop table if exists message;

drop table if exists message_thread;

drop table if exists my_user;

drop table if exists project;

drop table if exists project_phase;

drop table if exists resources;

drop table if exists task;

