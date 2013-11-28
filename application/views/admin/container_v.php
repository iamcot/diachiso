<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?=$title?></title>
    <link type="text/css" rel="stylesheet" href="<?=base_url()?>src/style.css">
    <link type="text/css" rel="stylesheet" href="<?=base_url()?>src/smoothness/jquery-ui-1.10.3.custom.css">
    <script src="<?=base_url()?>src/jquery.min.js"></script>
    <script src="<?=base_url()?>src/jquery-ui-min.js"></script>
</head>

<body>
    <header>
        <div class="wrap">
            <h2>DigiAddr: Trang quản trị</h2>
        </div>
    </header>
    <div class="nav">
        <div class="wrap">
        <ul>
            <li><a href="<?=base_url()?>admin/">Tổng quan</a></li>
            <li><a href="<?=base_url()?>admin/address">Địa chỉ</a></li>
            <li><a href="<?=base_url()?>admin/service">Dịch vụ</a></li>
            <li><a href="<?=base_url()?>admin/deal">Khuyến mãi</a></li>
            <li><a href="<?=base_url()?>admin/user">Người dùng</a></li>
        </ul>
            <div class="headeruser">
                <? if($this->session->userdata('username')):?>
                     <?=$this->session->userdata('username')?>
                <? else:?>
                    <a href="<?=base_url()?>login">Đăng nhập</a>
                <? endif;?>
            </div>
        </div>
    </div>
    <div id="content" class="wrap">
        <?=(isset($body)?$body:"")?>
    </div>

</body>
</html>