﻿drop table comics_title_img;
/*drop table authors;
drop table comics_files;*/
drop table comics_filepaths;
drop table comics;

CREATE TABLE comics (
    comic_id INT NOT NULL AUTO_INCREMENT,
    title    NVARCHAR(255) NOT NULL,
    author   NVARCHAR(255) NULL,
    CONSTRAINT PK_comics PRIMARY KEY NONCLUSTERED (comic_id ASC)
);

CREATE TABLE comics_title_img (
    comic_id  INT             NOT NULL,
    ext       NVARCHAR (25)   NOT NULL,
    title_img MEDIUMBLOB NOT NULL,
    CONSTRAINT PK_comics_title_img PRIMARY KEY CLUSTERED (comic_id ASC)
);

/*CREATE TABLE authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    name      NVARCHAR (255) NOT NULL,
    CONSTRAINT PK_authors PRIMARY KEY NONCLUSTERED (author_id ASC),
    CONSTRAINT AK_authors UNIQUE NONCLUSTERED (author_id ASC, name ASC)
);*/

/*CREATE TABLE comics_files (
    comic_id      INT             NOT NULL,
    org_file_name NVARCHAR (255)  NOT NULL,
    comic_file    LONGBLOB NOT NULL,
    CONSTRAINT PK_comics_files PRIMARY KEY CLUSTERED (comic_id ASC)
);*/

CREATE TABLE comics_filepaths (
    comic_id  INT             NOT NULL,
    org_filename  NVARCHAR (256)  NOT NULL,
    filepath  NVARCHAR (256)   NOT NULL,
    CONSTRAINT PK_comics_title_img PRIMARY KEY CLUSTERED (comic_id ASC)
);

ALTER TABLE comics_title_img
    ADD CONSTRAINT FK_comics_title_img_comics FOREIGN KEY (comic_id) REFERENCES comics (comic_id) ON DELETE CASCADE ON UPDATE CASCADE;

/*ALTER TABLE comics_files
    ADD CONSTRAINT FK_comics_files_comics FOREIGN KEY (comic_id) REFERENCES comics (comic_id) ON DELETE CASCADE ON UPDATE CASCADE;*/

ALTER TABLE comics_filepaths
    ADD CONSTRAINT FK_comics_filepaths_comics FOREIGN KEY (comic_id) REFERENCES comics (comic_id) ON DELETE CASCADE ON UPDATE CASCADE;