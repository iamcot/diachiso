<!DOCTYPE html>
<html>
<head>


    <title><?= $sTitle ?></title>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="<?=$_SERVER['SERVER_NAME']?> là cổng thông tin tìm kiếm dịch vụ chất lượng nhất Việt Nam. <?=$_SERVER['SERVER_NAME']?> cung cấp hàng trăm nghìn địa điểm dịch vụ và thẻ ưu đãi cho cộng đồng Việt Nam." />
    <meta name="keyword" content="<?= $sTitle ?>" />
    <meta name="author" content="<?=$_SERVER['SERVER_NAME']?>">
    <meta name="robots" content="INDEX, FOLLOW">
    <meta property="og:title" content="<?= $sTitle ?>" />
    <meta property="og:image" content="<?=base_url()?>empty.png" />
    <meta property="og:description" content="<?=$_SERVER['SERVER_NAME']?> là cổng thông tin tìm kiếm dịch vụ chất lượng nhất Việt Nam. <?=$_SERVER['SERVER_NAME']?> cung cấp hàng trăm nghìn địa điểm dịch vụ và thẻ ưu đãi cho cộng đồng Việt Nam." />
    <meta property="og:type" content="" />
    <meta property="og:url" content="<?="http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"?>" />
    <meta property="og:site_name" content="<?=$_SERVER['SERVER_NAME']?>" />
    <link id="page_favicon" href="/favicon.ico" rel="icon" type="image/x-icon" />

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
         <?=$aNavAddr?>
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
    function ShowSubCat(li,parentname,parentid,level,parenturl){
        //console.log($("input[name=ajaxloading]").val());
       // console.log($("#subcat_"+level).html())
        if($("input[name=ajaxloading]").val()=="0" &&  $("#subcat_"+level).html()=="" ){
        $("input[name=ajaxloading]").val("1");
        $.ajax({
            type:"post",
            url:"<?=base_url()?>main/loadsubcat",
            data:"parentname="+parentname+"&parentid="+parentid+"&current="+level,
            success: function(msg){
                var oSubcats = eval(msg);
                //$("#subcat_"+level).val(msg);
                var sSubcat = "<ul class='SubNavAddr'>";
                $.each(oSubcats, function (index, oCat) {
                    sSubcat += '<li><a href="'+parenturl+oCat.daurl+'">'+oCat.dalong_name+'</a></li>';
                });
                sSubcat += '</ul>';
                $("#subcat_"+level).html(sSubcat);


               // console.log(sSubcat);
                //console.log(oSubcats);
            },
            complete: function(){
                $("input[name=ajaxloading]").val("0")
            }
        });
        }

            $("#subcat_"+level).show();

    }
function HideSubCat(level){
    $('div[id^="subcat_"]').hide();
}
</script>