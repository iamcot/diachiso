<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?= $sTitle ?></title>
    <link type="text/css" rel="stylesheet" href="<?= base_url() ?>src/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="<?= base_url() ?>src/font-awesome/css/font-awesome.css">
    <link type="text/css" rel="stylesheet" href="<?= base_url() ?>src/frontstyle.css">
    <link type="text/css" rel="stylesheet" href="<?= base_url() ?>src/ckeditor/skins/moono/editor.css">

    <link type="text/css" rel="stylesheet"
          href="<?= base_url() ?>src/smoothness/jquery-ui-1.10.3.custom.css">
    <script src="<?= base_url() ?>src/jquery.min.js"></script>
    <script src="<?= base_url() ?>src/mylib.js"></script>
    <script src="<?= base_url() ?>src/jquery-ui-min.js"></script>
    <script src="<?= base_url() ?>src/jquery.jqpagination.min.js"></script>
    <script src="<?= base_url() ?>src/jupload/vendor/jquery.ui.widget.js"></script>
    <script src="<?= base_url() ?>src/jupload/jquery.iframe-transport.js"></script>
    <script src="<?= base_url() ?>src/jupload/jquery.fileupload.js"></script>
</head>

<body>
<div id="allpage">
<div id="topmenu">
    <div class="wrap">
        <a href="">DigiAddr là gì?</a> | <a href="">Tuyển dụng</a> | <a href="">Hợp tác với DigiAddr</a> | <a href="">Liên hệ</a>
        <div class="headeruser">
            <? if ($this->session->userdata('dauser_id')): ?>
                <? if($this->session->userdata('daavatar')!="") echo '<img class="navavatar" src="'.base_url().'thumbnails/'.$this->session->userdata('daavatar').'">';?>
                <?= $this->session->userdata('dalname') . ' ' . $this->session->userdata('dafname') ?> <?= (($this->mylibs->accessadmin()) ? ' | <a href="' . base_url() . 'admin">Trang quản trị</a>' : '') ?> |
                <a href="<?= base_url() ?>login/logout">Đăng xuất</a>
            <? else: ?>
                <a href="<?= base_url() ?>login">Đăng nhập</a> | <a href="<?= base_url() ?>login/registration">Đăng ký</a>
            <? endif; ?>
        </div>
    </div>
</div>
<header>
    <div class="wrap">
        <h2><?= $this->config->item('sitename') . (($this->lang->line("slogan") != "") ? " - " . $this->lang->line("slogan") : '') ?></h2>
    </div>
</header>
    <div id="topbanner"><?=((isset($topbanner) && $cat=="start")?$topbanner:'')?></div>
<div class="nav">
    <div class="wrap">
        <ul id="navaddr">
         <?
         $sNavCurr = "/";
         $font = 10;
         $parentid = 0;
         $parentname = "";
         foreach($aNavAddr as $level=>$addr):?>
            <li onmouseover="ShowSubCat(this,'<?=$parentname?>',<?=$parentid?>,'<?=$level?>')" onmouseout=""><a class="smalltext<?=($font)?>" href="<?=($sNavCurr = $sNavCurr.$addr->daurl."/")?>"><? if($font==10):?><i class="fa fa-map-marker"></i> <?endif;?><?=$addr->dalong_name?> <i class="fa fa-caret-down"></i></a> </li>
             <div id="subcat_<?=$level?>" style="display: none;"></div>
             <? $parentname=$level;$parentid=$addr->id; $font--; endforeach;?>
        </ul>

        <ul id="navservice">
            <? foreach($aNavService as $row):?>
                <li><a><?=$row->dalong_name?></a></li>
            <? endforeach;?>
        </ul>
    </div>
</div>
<div id="content" class="wrap">
    <?= (isset($sBody) ? $sBody : "") ?>
</div>
<footer>
    <div class="wrap">
        <p>Copyright &copy 2013.</p>
    </div>
</footer>
    <input type="hidden" name="base_url" value="<?=base_url()?>">
    <input type="hidden" name="ajaxloading" value="0">
</div>
</body>
</html>
<script>
    function ShowSubCat(li,parentname,parentid,level){
        if($("input[name=ajaxloading]").val()=="0" &&  $("#subcat_"+level).val()=="" ){
        $("input[name=ajaxloading]").val("1");
        $.ajax({
            type:"post",
            url:"<?=base_url()?>main/loadsubcat",
            data:"parentname="+parentname+"&parentid="+parentid+"&current="+level,
            success: function(msg){
                var cats = eval(msg);
                $("#subcat_"+level).val(msg);
                console.log(cats);
            },
            complete: function(){
                $("input[name=ajaxloading]").val("0")
            }
        });
        }
    }
</script>