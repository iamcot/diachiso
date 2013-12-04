<div id="articlebox">
    <div class="cattabstitle">
        <ul>
            <li><a href="?tab=info" class="<?= ($placetab == 'info') ? 'select' : '' ?>"><i class="fa fa-home"></i> Giới
                    thiệu</a></li>
            <li><a href="?tab=deal" class="<?= ($placetab == 'deal') ? 'select' : '' ?>"><i class="fa fa-tag"></i>
                    Khuyến mãi</a></li>
            <li><a href="?tab=pics" class="<?= ($placetab == 'pics') ? 'select' : '' ?>"><i class="fa fa-picture-o"></i>
                    Thư viện ảnh</a></li>
            <li><a href="?tab=news" class="<?= ($placetab == 'news') ? 'select' : '' ?>"><i
                        class="fa fa-rss-square"></i> Tin tức</a></li>
        </ul>
    </div>
    <? if ($placetab == "info"): ?>
        <div class="articlecontent">
            <div class="placeleft">
                <div class="placepic"><img src="<?= base_url() . 'thumbnails/' . $oCurrentPlace->dapic ?>"></div>
                <div class="placeinfo">
                    <ul>
                        <li><h4><i class="fa fa-home"></i> <?= $oCurrentPlace->dalong_name ?></h4></li>
                        <li><i class="fa fa-map-marker"></i> <span><?= $placeAddres ?></span></li>
                        <? if ($oCurrentPlace->datel != ""): ?>
                            <li><i class="fa fa-phone-square"></i> <span><?= $oCurrentPlace->datel ?></span>
                            </li><? endif; ?>
                        <? if ($oCurrentPlace->dawebsite != ""): ?>
                            <li><i class="fa fa-cloud"></i> <span><?= $oCurrentPlace->dawebsite ?></span>
                            </li><? endif; ?>
                        <? if ($oCurrentPlace->daemail != ""): ?>
                            <li><i class="fa fa-envelope"></i> <span><?= $oCurrentPlace->daemail ?></span>
                            </li><? endif; ?>
                        <li><i class="fa fa-rocket"></i> <span>Lượt xem: <b><?= $oCurrentPlace->daview ?></b></span>
                            <!--<i class="fa fa-thumbs-up"></i>  <span>Like: <b><?=$oCurrentPlace->dalike?></b></span>-->
                        </li>
                    </ul>
                </div>
            </div>
            <div class="placemap"><?= $oCurrentPlace->damap ?></div>
        </div>
    <? endif; ?>
    <div style="clear:both;height:15px"></div>
    <div id="leftside">
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-info-circle"></i></div>
            <div class="articlecontent">
                <? switch ($placetab ){
                    case "info": echo $oCurrentPlace->dainfo; break;
                    case "pics": echo $sTabContent; break;
                    default: echo 'Hiện tại Không có nội dung này.';break;
                } ?>

            </div>
        </div>
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-comments-o"></i> Bình luận</div>
            <div class="articlecontent">

            </div>
        </div>
    </div>
    <div id="rightside">
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-map-marker"></i> Cùng trên đường này</div>
            <div class="articlecontent listplace">

                <? if (count($aStreetPlaces)): ?>
                    <ul>
                        <? foreach($aStreetPlaces as $place):?>
                            <? if($place['id'] == $oCurrentPlace->id) continue; ?>
                            <li><a href="<?=$sCurrentTree.'/'.$place['daurl'].'-'.$place['id'].'.html'?>">
                                    <img src="<?=base_url()?>thumbnails/<?=$place['dapic']?>">
                                    <h2><?=$place['dalong_name']?></h2>
                                    <span><i class="fa fa-rocket"></i> <?= $place['daview'] ?>
                                    <i class="fa fa-thumbs-up"></i>  <?=$place['dalike']?>
                                    <i class="fa fa-comments"></i>  <?=$place['dacomment']?>
                                        </span>
                            </a></li>
                        <? endforeach;?>
                    </ul>
                <? endif; ?>

            </div>
        </div>
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-tags"></i> <?= $this->lang->line('dealname') ?> mới lên</div>
            <div class="articlecontent" id="accordion">

            </div>
        </div>
    </div>
</div>
