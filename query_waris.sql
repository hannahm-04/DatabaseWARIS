create database waris;
use waris;

create table pengguna(
	id int not null auto_increment, -- unique sudah implicit pada primary key
    email varchar(255) not null unique,
    username varchar(45) not null,
    kata_sandi varchar(255) not null, -- disesusaikan untuk hash kata sandi
    no_hp varchar(15) not null,
    peran varchar(16) not null,
    alamat varchar(255),
    create_time datetime default current_timestamp,
    primary key(id)
);

create table kategori(
	id int not null auto_increment, -- unique sudah implicit pada primary key
    nama_kategori varchar(255) not null unique,
    deskripsi varchar(255) not null,
    create_time datetime default current_timestamp,
    primary key(id)
);

create table produk(
	id int not null auto_increment, -- unique sudah implicit pada primary key
    nama_produk varchar(45) not null,
    kategori_id int not null,
    harga int not null,
    stok int not null,
    deskripsi varchar(255) not null,
    url_gambar varchar(255),
    create_time datetime default current_timestamp,
    primary key(id),
    foreign key(kategori_id) references kategori(id) on delete cascade
);

create table review(
	id int not null auto_increment, -- unique sudah implicit pada primary key
    pengguna_id int not null,
    produk_id int not null,
    komentar varchar(255),
    rating int not null,
    create_time datetime default current_timestamp,
    primary key(id),
    foreign key(pengguna_id) references pengguna(id) on delete cascade,
    foreign key(produk_id) references produk(id) on delete cascade
);

create table favorit(
	id int not null auto_increment, -- unique sudah implicit pada primary key
    produk_id int not null,
    pengguna_id int not null,
    create_time datetime default current_timestamp,
    primary key(id), 
    foreign key(produk_id) references produk(id) on delete cascade,
    foreign key(pengguna_id) references pengguna(id) on delete cascade
);


show tables;