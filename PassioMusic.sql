create database Passio;
create table tbl_Login(
id_acc int auto_increment not null, 
userName varchar(50) not null,
passWord varchar(50) not null,
primary key(id_acc)
);

create table tbl_User(
id_user int auto_increment not null primary key,
user_name varchar(50),
user_dob date,
user_gender varchar(20) default 'Male',
user_phoneNumber int unique,
user_email varchar(50) unique,
user_address varchar(100)
);

create table tbl_Roles(
id_role int auto_increment not null primary key,
role_name varchar(50),
role_desc varchar(100)
);

create table tbl_Singer(
id_sing int auto_increment not null primary key,
sing_name varchar(50),
sing_phoneNumber int unique,
sing_email varchar(50) unique,
sing_address varchar(100)
);

create table tbl_CategorySong(
id_Category int auto_increment not null primary key,
category_name varchar(50) unique
);

create table tbl_Songs(
id_song int auto_increment not null primary key,
song_name varchar(50) not null,
song_price double not null,
song_desc varchar(100),
foreign key (id_Category) references tbl_CategorySong(id_Category),
foreign key (id_sing) references tbl_Singer(id_sing)
);

create table tbl_Album(
id_Album int auto_increment not null primary key,
album_name varchar(50) not null,
foreign key (id_sing) references tbl_Singer(id_sing),
foreign key (id_song) references tbl_Songs(id_song)
);

create table tbl_Playlist(
id_playlist int auto_increment not null primary key,
foreign key (id_song) references tbl_Songs(id_song)
);

create table tbl_Cart(
id_Cart int auto_increment not null primary key,
foreign key (id_song) references tbl_Songs(id_song)
);

create table tbl_Bills(
id_bill int auto_increment not null primary key,

);



