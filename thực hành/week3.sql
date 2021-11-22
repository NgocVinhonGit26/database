use week3;

create table giaovien(
    GV char(10) not null,
    HoTen char(30) character set utf8mb4 not null,
    NamSinh int not null,
    DiaChi char(50) not null,
    constraint kcgv primary key(GV)
);

create table detai(
    DT char(10) not null,
    TenDT char(50) character set utf8mb4 not null,
    TheLoai char(20) character set utf8mb4 not null,
    constraint kcdt primary key(DT)
);

create table sinhvien(
    SV int not null,
    TenSV char(30) character set utf8mb4 not null,
    NgaySinh date not null,
    QueQuan char(20) character set utf8mb4 not null,
    Lop char(20) not null,
    constraint kcsv primary key(SV)
);

create table huongdan(
    GV char(10) not null,
    DT char(10) not null,
    SV int not null,
    NamThucHien int not null,
    KetQua double not null,
    foreign key(GV) references giaovien(GV),
    foreign key(DT) references detai(DT),
    foreign key(SV) references sinhvien(SV)
);

drop table detai;
drop table giaovien;
drop table sinhvien;
drop table huongdan;