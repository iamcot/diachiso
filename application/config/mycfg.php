<?php
$config['sitename'] = 'Sài Gòn - Hà Nội';
$oonfig['slogan'] = 'Thổ đia online';
$config['sufix_title'] = 'saigonhanoi.com.vn - Thổ địa online của bạn.';
$config['pp'] = 5;

$config['mapw'] = 400;
$config['maph'] = 200;
$config['mapz'] = 15;
$config['aAddrTree'] = array(  // table,parenttable)
                               'daprovince' => array('daprovince',''            ),
                               'dadistrict' => array('dadistrict','daprovince'  ),
                               'daward'     => array('daward'    ,'dadistrict'  ),
                               'dastreet'   => array('dastreet'  ,'daward'      ),
                            );

