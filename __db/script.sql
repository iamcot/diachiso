/*add old price for deal*/
ALTER TABLE `dadeal` ADD `daoldprice` INT  NOT NULL  DEFAULT '0'  AFTER `dauser_id`;
ALTER TABLE  `daprovince` CHANGE  `daprefix`  `daprefix` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '';

ALTER TABLE `daprovince` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daorder`;

ALTER TABLE `dadistrict` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `daward` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `dastreet` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `dadistrict_id`;

/*add old dapic for deal*/
ALTER TABLE  `dadeal` ADD  `dapic` VARCHAR( 50 ) NOT NULL ;

/* 12:49:50 PM localhost */
ALTER TABLE `dadeal` ADD `dainfo` TEXT  COLLATE utf8_unicode_ci  NOT NULL  AFTER `dapic`;





