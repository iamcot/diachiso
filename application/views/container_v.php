<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?= $title ?></title>
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
<div class="nav">
    <div class="wrap">
        <ul>
            <li><a href="<?= base_url() ?>"
                   class="<?= (($cat == 'home') ? 'select' : '') ?>">Trang chủ</a></li>

        </ul>

    </div>
</div>
<div id="content" class="wrap">
    <?= (isset($body) ? $body : "") ?>
</div>
<footer>
    <div class="wrap">
        <p>Copyright &copy 2013.</p>
    </div>
</footer>
</div>
</body>
</html>