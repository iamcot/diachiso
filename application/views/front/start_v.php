<? if (isset($promotedeal)): ?>
    <ul id="promotedeal">
        <? foreach ($promotedeal as $deal): ?>
            <li><?= $deal ?></li>
        <? endforeach; ?>
    </ul>
<? endif; ?>
<? if (isset($hotdeal)): ?>
    <ul id="hotdeal">
        <? foreach ($hotdeal as $deal): ?>
            <li><?= $deal ?></li>
        <? endforeach; ?>
    </ul>
<? endif; ?>
<? if (isset($catsdeal)): ?>
    <? foreach ($catsdeal as $catdeal): ?>
        <div class="catdeal">
            <div class="cattitle"><a href="?s=<?=$catdeal[1]?>"><?=$catdeal[0]?></a></div>
            <ul>
            <? foreach($catdeal[2] as $deal):?>
                 <li><?=$deal?></li>
            <? endforeach;?>
            </ul>
        </div>
    <? endforeach; ?>
<? endif; ?>
<div id="articlebox">
    <div id="leftside">
        <div class="articlebox">
            <div class="cattitle">Địa chỉ được quan tâm</div>
            <div class="articlecontent">
                <? if(count($sServicePlace_hot)>0):?>
                    <ul class="bxslider">
                        <? foreach($sServicePlace_hot as $place):?>
                            <li>
                                <a href="<?=$this->mylibs->makePlaceUrl($place)?>">
                                <img src="<?=base_url()?>main/makethumb/?f=<?=$place->dapic?>&w=320&h=200"
                                title="<?=$place->dalong_name.'<br>'.$place->provincename?>">
                                </a>
                            </li>
                        <? endforeach;?>
                    </ul>
                <? endif;?>
            </div>
        </div>
        <div class="articlebox">
            <div class="cattitle">Gợi ý dịch vụ</div>
            <div class="articlecontent"></div>
        </div>
        <div class="articlebox">
            <div class="cattitle">Địa chỉ mới</div>
            <div class="articlecontent">
                <? if(count($sServicePlace_new)>0):?>
                    <ul class="bxslider">
                        <? foreach($sServicePlace_new as $place):?>
                            <li>
                                <a href="<?=$this->mylibs->makePlaceUrl($place)?>">
                                    <img src="<?=base_url()?>main/makethumb/?f=<?=$place->dapic?>&w=320&h=200"
                                         title="<?=$place->dalong_name.'<br>'.$place->provincename?>">
                                </a>
                            </li>
                        <? endforeach;?>
                    </ul>
                <? endif;?>
            </div>
        </div>
        <div class="articlebox">
            <div class="cattitle">Dịch vụ phổ biến</div>
            <div class="articlecontent"></div>
        </div>
    </div>
    <div id="rightside">
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-map-marker"></i> Quận/Huyện</div>
            <div class="articlecontent licolor">
                <? //var_dump($aDistrict);?>
                <? if(isset($aDistrict)):?>
                <ul >
                    <? foreach($aDistrict as $dist):?>
                        <li><a href="<?=$sCurrentTree.$dist['daurl']?>"><i class="fa fa-caret-right"></i> <?=$dist['dalong_name']?></a></li>
                    <? endforeach;?>
                </ul>
                <? endif;?>
            </div>
        </div>
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-comment-o"></i> Đánh giá mới</div>
            <div class="articlecontent"></div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
 $(".bxslider").bxSlider({
     captions: true,
     auto: true,
     autoControls: true,
     minSlides: 2,
     maxSlides: 2,
     slideWidth: 320,
     slideMargin: 10
 });
});
</script>