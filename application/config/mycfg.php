<?php
$config['sitename'] = 'Sài Gòn - Hà Nội';
$oonfig['slogan'] = 'Thổ đia online';
$config['sufix_title'] = 'saigonhanoi.com.vn - Thổ địa online của bạn.';
$config['submitdealsendemail'] = false;
$config['pp'] = 10;

$config['mapw'] = 400;
$config['maph'] = 200;
$config['mapz'] = 15;
$config['aAddrTree'] = array(  // table,parenttable)
                               'daprovince' => array('daprovince',''            ),
                               'dadistrict' => array('dadistrict','daprovince'  ),
                               'daward'     => array('daward'    ,'dadistrict'  ),
                               'dastreet'   => array('dastreet'  ,'daward'      ),
                               'daservice_place'   => array('daservice_place','dastreet'),
                            );

$config['iHomeServicePlae'] = 10;
$config['num_comment'] = 10;
$config['num_dealhot'] = 9;
$config['num_servicegroup'] = 10;
$config['num_admindealuserlist'] = 10;

$config['iHomeCatDeal'] = 6;
$config['shipfee'] = '10.000';
$config['hotline'] = '04 113 113 113';
$config['skype'] = 'websaigonhanoi';
$config['yahoo'] = 'websaigonhanoi';
$config['dealuserstatus'] = array(
    "nan" => "Không xác định",
    "wait" => "Đang chờ",
    "confirm" => "Xác nhận",
    "sending" => "Đang giao hàng",
    "receive" => "Đã nhận ",
    "cancel" => "Bị Khách hủy",
    "reject" => "Bị Cty từ chối",
);
