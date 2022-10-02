/*==============================================================*/
/* Table: KLUB                                                  */
/*==============================================================*/
create table KLUB  (
   NAZEV                VARCHAR(30)                    not null,
   ID_VEDOUCIHO         INTEGER                         not null,
   ULICE_KLUBU          VARCHAR(30)                    not null,
   CISLO_POPISNE_KLUBU  INTEGER                       not null
	CONSTRAINT CKC_CISLO_POPISNE_KLUBU_KLUB CHECK (CISLO_POPISNE_KLUBU >= 0),
   KAPACITA             INTEGER                         not null
	CONSTRAINT CKC_KAPACITA_KLUB CHECK (KAPACITA >= 0),
   constraint PK_KLUB primary key (NAZEV),
   CONSTRAINT AK_ID_VEDOUCIHO_AK_KLUB UNIQUE (ID_VEDOUCIHO)
);


/*==============================================================*/
/* Table: ZAMESTNANEC                                           */
/*==============================================================*/
create table ZAMESTNANEC  (
   ID_ZAMESTNANCE       INTEGER                         not null,
   JMENO_ZAMESTNANCE    VARCHAR(20)                    not null,
   PRIJMENI_ZAMESTNANCE VARCHAR(20)                    not null,
   PLAT                 INTEGER                         not null
	CONSTRAINT CKC_PLAT_ZAMESTNANEC CHECK (PLAT >= 0),
   POZICE               VARCHAR(20)                    not null,
   ULICE                VARCHAR(30),
   CISLO_POPISNE        INTEGER
	CONSTRAINT CKC_CISLO_POPISNE_ZAMESTNANEC CHECK (CISLO_POPISNE IS NULL OR (CISLO_POPISNE >= 0)),
   constraint PK_ZAMESTNANEC primary key (ID_ZAMESTNANCE)
);


/*==============================================================*/
/* Table: SKLAD                                                 */
/*==============================================================*/
create table SKLAD  (
   ID_SKLADU            INTEGER                         not null,
   NAZEV                VARCHAR(30)                    not null,
   KAPACITA_FLASEK      INTEGER                         not null
	CONSTRAINT CKC_KAPACITA_FLASEK_SKLAD CHECK (KAPACITA_FLASEK >= 0),
   KAPACITA_BALENI      INTEGER                         not null
	CONSTRAINT CKC_KAPACITA_BALENI_SKLAD CHECK (KAPACITA_BALENI >= 0),
   VELIKOST             INTEGER                         not null,
   constraint PK_SKLAD primary key (ID_SKLADU)
);



/*==============================================================*/
/* Table: FLASKA_ALKOHOLU                                       */
/*==============================================================*/
create table FLASKA_ALKOHOLU  (
   ID_ALKOHOLU          INTEGER                         not null,
   DRUH                 VARCHAR(30)                    not null,
   OBJEM                DECIMAL                     not null,
   constraint PK_FLASKA_ALKOHOLU primary key (ID_ALKOHOLU)
);



/*==============================================================*/
/* Table: BALENI_JIDLA                                          */
/*==============================================================*/
create table BALENI_JIDLA  (
   ID_BALENI            INTEGER                         not null,
   NAZEV_BALENI         VARCHAR(20)                    not null,
   TRVANLIVOST          DATE                            not null,
   GRAMAZ               INTEGER                         not null
	CONSTRAINT CKC_GRAMAZ_BALENI_JIDLA CHECK (GRAMAZ >= 0),
   ALERGENY             VARCHAR(50),
   constraint PK_BALENI_JIDLA primary key (ID_BALENI)
);



/*==============================================================*/
/* Table: PISNICKA                                              */
/*==============================================================*/
create table PISNICKA  (
   ID_PISNICKY          INTEGER                         not null,
   INTERPRET            VARCHAR(30)                    not null,
   ZANR                 VARCHAR(30)                    not null,
   constraint PK_PISNICKA primary key (ID_PISNICKY)
);



/*==============================================================*/
/* Table: HOST                                                  */
/*==============================================================*/
create table HOST  (
   OSOBNI_CISLO         INTEGER                         not null,
   JMENO_HOSTA          VARCHAR(20)                    not null,
   VEK                  INTEGER
	CONSTRAINT CKC_VEK_HOST CHECK (VEK IS NULL OR (VEK >= 0)),
   constraint PK_HOST primary key (OSOBNI_CISLO)
);



/*==============================================================*/
/* Table: USKLADNUJE_FLASKY                                     */
/*==============================================================*/
create table USKLADNUJE_FLASKY  (
   ID_SKLADU            INTEGER                         not null,
   ID_ALKOHOLU          INTEGER                         not null,
   POCET_FLASEK         INTEGER                         not null
	CONSTRAINT CKC_POCET_FLASEK_FLASKY CHECK (POCET_FLASEK >= 0),
   constraint PK_USKLADNUJE_FLASKY primary key (ID_SKLADU, ID_ALKOHOLU)
);



/*==============================================================*/
/* Table: USKLADNUJE_BALENI                                     */
/*==============================================================*/
create table USKLADNUJE_BALENI  (
   ID_SKLADU            INTEGER                         not null,
   ID_BALENI            INTEGER                         not null,
   POCET_BALENI         INTEGER                         not null
	CONSTRAINT CKC_POCET_BALENI_BALENI CHECK (POCET_BALENI >= 0),
   constraint PK_USKLADNUJE_BALENI primary key (ID_SKLADU, ID_BALENI)
);



/*==============================================================*/
/* Table: PRACUJE                                               */
/*==============================================================*/
create table PRACUJE  (
   ID_ZAMESTNANCE       INTEGER                         not null,
   NAZEV                VARCHAR(30)                    not null,
   constraint PK_PRACUJE primary key (ID_ZAMESTNANCE, NAZEV)
);



/*==============================================================*/
/* Table: HRAJE                                                 */
/*==============================================================*/
create table HRAJE  (
   NAZEV                VARCHAR(30)                    not null,
   ID_PISNICKY          INTEGER                         not null,
   constraint PK_HRAJE primary key (NAZEV, ID_PISNICKY)
);



/*==============================================================*/
/* Table: NAVSTEVUJE                                            */
/*==============================================================*/
create table NAVSTEVUJE  (
   NAZEV                VARCHAR(30)                    not null,
   OSOBNI_CISLO         INTEGER                         not null,
   constraint PK_NAVSTEVUJE primary key (NAZEV, OSOBNI_CISLO)
);



/*==============================================================*/
/* Index: SEFUJE_FK                                             */
/*==============================================================*/
create index SEFUJE_FK on ZAMESTNANEC (
   ID_ZAMESTNANCE ASC
);

/*==============================================================*/
/* Index: MA_FK                                                 */
/*==============================================================*/
create index MA_FK on SKLAD (
   NAZEV ASC
);

/*==============================================================*/
/* Index: USKLADNUJE_FLASKY_FK                                  */
/*==============================================================*/
create index USKLADNUJE_FLASKY_FK on USKLADNUJE_FLASKY (
   ID_SKLADU ASC
);

/*==============================================================*/
/* Index: USKLADNUJE_FLASKY2_FK                                 */
/*==============================================================*/
create index USKLADNUJE_FLASKY2_FK on USKLADNUJE_FLASKY (
   ID_ALKOHOLU ASC
);

/*==============================================================*/
/* Index: USKLADNUJE_BALENI_FK                                  */
/*==============================================================*/
create index USKLADNUJE_BALENI_FK on USKLADNUJE_BALENI (
   ID_SKLADU ASC
);

/*==============================================================*/
/* Index: USKLADNUJE_BALENI2_FK                                 */
/*==============================================================*/
create index USKLADNUJE_BALENI2_FK on USKLADNUJE_BALENI (
   ID_BALENI ASC
);

/*==============================================================*/
/* Index: PRACUJE_FK                                            */
/*==============================================================*/
create index PRACUJE_FK on PRACUJE (
   ID_ZAMESTNANCE ASC
);

/*==============================================================*/
/* Index: PRACUJE2_FK                                           */
/*==============================================================*/
create index PRACUJE2_FK on PRACUJE (
   NAZEV ASC
);

/*==============================================================*/
/* Index: HRAJE_FK                                              */
/*==============================================================*/
create index HRAJE_FK on HRAJE (
   NAZEV ASC
);

/*==============================================================*/
/* Index: HRAJE2_FK                                             */
/*==============================================================*/
create index HRAJE2_FK on HRAJE (
   ID_PISNICKY ASC
);

/*==============================================================*/
/* Index: NAVSTEVUJE_FK                                         */
/*==============================================================*/
create index NAVSTEVUJE_FK on NAVSTEVUJE (
   NAZEV ASC
);

/*==============================================================*/
/* Index: NAVSTEVUJE2_FK                                        */
/*==============================================================*/
create index NAVSTEVUJE2_FK on NAVSTEVUJE (
   OSOBNI_CISLO ASC
);

alter table KLUB
   add constraint FK_KLUB_SEFUJE_ZAMESTNANEC foreign key (ID_VEDOUCIHO)
      references ZAMESTNANEC (ID_ZAMESTNANCE);

alter table SKLAD
   add constraint FK_SKLAD_MA_KLUB foreign key (NAZEV)
      references KLUB (NAZEV);
      
alter table USKLADNUJE_FLASKY
   add constraint FK_USKLADNU_USKLADNUJ_SKLAD foreign key (ID_SKLADU)
      references SKLAD (ID_SKLADU);
      
alter table USKLADNUJE_FLASKY
   add constraint FK_USKLADNU_USKLADNUJ_FLASKA_A foreign key (ID_ALKOHOLU)
      references FLASKA_ALKOHOLU (ID_ALKOHOLU);
      
alter table USKLADNUJE_BALENI
   add constraint FK_USKLADNU_USKLADNUJ_SKLAD2 foreign key (ID_SKLADU)
      references SKLAD (ID_SKLADU);
      
alter table USKLADNUJE_BALENI
   add constraint FK_USKLADNU_USKLADNUJ_BALENI_J foreign key (ID_BALENI)
      references BALENI_JIDLA (ID_BALENI);
      
alter table PRACUJE
   add constraint FK_PRACUJE_PRACUJE_ZAMESTNA foreign key (ID_ZAMESTNANCE)
      references ZAMESTNANEC (ID_ZAMESTNANCE);
      
alter table PRACUJE
   add constraint FK_PRACUJE_PRACUJE2_KLUB foreign key (NAZEV)
      references KLUB (NAZEV);
      
alter table HRAJE
   add constraint FK_HRAJE_HRAJE_KLUB foreign key (NAZEV)
      references KLUB (NAZEV);
      
alter table HRAJE
   add constraint FK_HRAJE_HRAJE2_PISNICKA foreign key (ID_PISNICKY)
      references PISNICKA (ID_PISNICKY);
      
alter table NAVSTEVUJE
   add constraint FK_NAVSTEVU_NAVSTEVUJ_KLUB foreign key (NAZEV)
      references KLUB (NAZEV);
      
alter table NAVSTEVUJE
   add constraint FK_NAVSTEVU_NAVSTEVUJ_HOST foreign key (OSOBNI_CISLO)
      references HOST (OSOBNI_CISLO);
      
INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (1, 'Pavel', 'Nový', 25000, 'barman', 'Dlouhá', 1243);

INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (2, 'Honza', 'Novotný', 20000, 'uklízeèka', 'Krátká', 3573);

INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (3, 'Pepa', 'Zdepa', 30000, 'dj', 'Tyršova', 2597);

INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (4, 'Tomáš', 'Kopecký', 35000, 'šéf', 'Václavská', 8576);

INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (5, 'Daniel', 'Volný', 35000, 'šéf', 'Ètvercová', 6034);

INSERT INTO ZAMESTNANEC (ID_ZAMESTNANCE, JMENO_ZAMESTNANCE, PRIJMENI_ZAMESTNANCE, PLAT, POZICE, ULICE, CISLO_POPISNE) VALUES (6, 'David', 'Moudrý', 35000, 'šéf', 'Kruhová', 5739);

INSERT INTO KLUB (NAZEV, ID_VEDOUCIHO, ULICE_KLUBU, CISLO_POPISNE_KLUBU, KAPACITA) VALUES ('Duplex', 4, 'Jihlavská', 5638, 500);

INSERT INTO KLUB (NAZEV, ID_VEDOUCIHO, ULICE_KLUBU, CISLO_POPISNE_KLUBU, KAPACITA) VALUES ('Fénix', 5, 'Dejvická', 2245, 300);

INSERT INTO KLUB (NAZEV, ID_VEDOUCIHO, ULICE_KLUBU, CISLO_POPISNE_KLUBU, KAPACITA) VALUES ('Bunkr', 6, 'Teplická', 8774, 200);

INSERT INTO SKLAD (ID_SKLADU, NAZEV, KAPACITA_FLASEK, KAPACITA_BALENI, VELIKOST) VALUES (1, 'Duplex', 800, 800, 100);

INSERT INTO SKLAD (ID_SKLADU, NAZEV, KAPACITA_FLASEK, KAPACITA_BALENI, VELIKOST) VALUES (2, 'Fénix', 500, 500, 60);

INSERT INTO SKLAD (ID_SKLADU, NAZEV, KAPACITA_FLASEK, KAPACITA_BALENI, VELIKOST) VALUES (3, 'Bunkr', 400, 400, 50);

INSERT INTO FLASKA_ALKOHOLU (ID_ALKOHOLU, DRUH, OBJEM) VALUES (1, 'rum', 1.0);

INSERT INTO FLASKA_ALKOHOLU (ID_ALKOHOLU, DRUH, OBJEM) VALUES (2, 'vodka', 0.7);

INSERT INTO FLASKA_ALKOHOLU (ID_ALKOHOLU, DRUH, OBJEM) VALUES (3, 'whisky', 1.5);

INSERT INTO BALENI_JIDLA (ID_BALENI, NAZEV_BALENI, TRVANLIVOST, GRAMAZ, ALERGENY) VALUES (1, 'brambùrky', '2023-5-12', 200, 'mléko, sója');

INSERT INTO BALENI_JIDLA (ID_BALENI, NAZEV_BALENI, TRVANLIVOST, GRAMAZ, ALERGENY) VALUES (2, 'oøíšky', '2023-6-23', 100, 'oøechy');

INSERT INTO BALENI_JIDLA (ID_BALENI, NAZEV_BALENI, TRVANLIVOST, GRAMAZ, ALERGENY) VALUES (3, 'cibulové kroužky', '2023-3-10', 150, 'lepek, mléko');

INSERT INTO PISNICKA (ID_PISNICKY, INTERPRET, ZANR) VALUES (1, 'Lil Peep', 'rap');

INSERT INTO PISNICKA (ID_PISNICKY, INTERPRET, ZANR) VALUES (2, 'Schyzo', 'rap');

INSERT INTO PISNICKA (ID_PISNICKY, INTERPRET, ZANR) VALUES (3, 'Gleb', 'grime');

INSERT INTO HOST (OSOBNI_CISLO, JMENO_HOSTA, VEK) VALUES (1, 'Marek', 20);

INSERT INTO HOST (OSOBNI_CISLO, JMENO_HOSTA, VEK) VALUES (2, 'Daniel', 22);

INSERT INTO HOST (OSOBNI_CISLO, JMENO_HOSTA, VEK) VALUES (3, 'Klára', 18);

INSERT INTO USKLADNUJE_FLASKY (ID_SKLADU, ID_ALKOHOLU, POCET_FLASEK) VALUES (1, 1, 5);

INSERT INTO USKLADNUJE_FLASKY (ID_SKLADU, ID_ALKOHOLU, POCET_FLASEK) VALUES (1, 2, 3);

INSERT INTO USKLADNUJE_FLASKY (ID_SKLADU, ID_ALKOHOLU, POCET_FLASEK) VALUES (1, 3, 2);

INSERT INTO USKLADNUJE_BALENI (ID_SKLADU, ID_BALENI, POCET_BALENI) VALUES (1, 1, 2);

INSERT INTO USKLADNUJE_BALENI (ID_SKLADU, ID_BALENI, POCET_BALENI) VALUES (1, 2, 4);

INSERT INTO USKLADNUJE_BALENI (ID_SKLADU, ID_BALENI, POCET_BALENI) VALUES (1, 3, 6);

INSERT INTO PRACUJE (ID_ZAMESTNANCE, NAZEV) VALUES (1, 'Duplex');

INSERT INTO PRACUJE (ID_ZAMESTNANCE, NAZEV) VALUES (2, 'Duplex');

INSERT INTO PRACUJE (ID_ZAMESTNANCE, NAZEV) VALUES (3, 'Duplex');

INSERT INTO HRAJE (NAZEV, ID_PISNICKY) VALUES ('Duplex', 1);

INSERT INTO HRAJE (NAZEV, ID_PISNICKY) VALUES ('Duplex', 2);

INSERT INTO HRAJE (NAZEV, ID_PISNICKY) VALUES ('Duplex', 3);

INSERT INTO NAVSTEVUJE (NAZEV, OSOBNI_CISLO) VALUES ('Duplex', 1);

INSERT INTO NAVSTEVUJE (NAZEV, OSOBNI_CISLO) VALUES ('Duplex', 2);

INSERT INTO NAVSTEVUJE (NAZEV, OSOBNI_CISLO) VALUES ('Duplex', 3);





