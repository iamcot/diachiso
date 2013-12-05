<? if ($oDealInfo != ""): ?>
    <div id="dealinfocontent">
        <div class="left margin15">
           <div style="position: relative;overflow: hidden">
            <img src="<?= base_url() ?>main/makethumb/?f=<?= $oDealInfo->dapic ?>&w=300&h=300">
            <span class="dt-hightlight-saleoff" style="top:5px;right: 5px;">
                <span style="position: relative">
                    <img src="/sale_promotion.png" width="50px" height="50px">
                    <span class="dt-sale-bbb">
                        <?=(($oDealInfo->datype=="percent")?($oDealInfo->daamount):number_format(ceil($oDealInfo->daamount/$oDealInfo->daoldprice*100),0))?></b> <span style="font-size: .8em"> %</span>
                    </span>
                </span>
            </span>
           </div>
            <h4>ĐIỂM NỔI BẬT</h4>

            <div class="liicon"><?= $oDealInfo->daspecial ?></div>
        </div>
        <div class="left">
            <ul>
                <li><h4><b><?= $oDealInfo->dalong_name ?></b></h4></li>
                <li><i class="fa fa-home"></i>
                    <span><?= $oCurrentPlace->dalong_name ?></span></li>
                <li><i class="fa fa-dollar"></i>
                    <span><b
                            class="colorred size15"><?= (($oDealInfo->datype == "percent") ? number_format($oDealInfo->daoldprice * (100- $oDealInfo->daamount)/100, 0, ',', '.') : number_format(($oDealInfo->daoldprice - $oDealInfo->daamount), 0, ',', '.')) ?></b> <span
                            style="font-size: .8em">đ</span> </span>
                </li>
                <li><i class="fa fa-strikethrough"></i>
                    <span
                        style="text-decoration: line-through;font-size:.8em"><?= number_format($oDealInfo->daoldprice, 0, ',', '.') ?>
                        đ </span>
                </li>
                <li>
                    <div id="countdown" class="colorgreen"></div>
                    <br>
                    <? $now = time();
                        if($now < $oDealInfo->dafrom): ?>
                        <b class="colorred">Khuyến mãi chưa bắt đầu</b>
                    <? elseif($now > $oDealInfo->dato):?>
                        <b  class="colorred">Khuyến mãi đã hết hạn</b>
                        <? else:?>
                            <input type="button" value="Nhận <?=$this->lang->line('dealname')?>" style="height:50px;padding: 10px 20px 10px 20px;font-size:1.7em">

                        <? endif;?>
                </li>
                <li class="noticegetdeal">
                    <div>- Nhận thẻ <?= $this->lang->line('dealname') ?> free ( giao thẻ tận nơi phí
                         ship <b class="colorred"><?= $this->config->item("shipfee") ?></b> đ)
                    </div>
                    <div>- Quý khách cầm thẻ <?= $this->lang->line('dealname') ?> đến sử dụng dịch
                         vụ và được giảm <b
                            class="colorred"><?= number_format($oDealInfo->daamount, 0, ',', '.') ?></b>
                        <span
                            style="font-size: .8em"><?= (($oDealInfo->datype == "percent") ? "%" : "đ") ?></span></b>
                         theo đúng như thông tin ghi trên thẻ.
                    </div>
                </li>
                <li>
                </li>
                <li id="supportdeal">
                    <hr>
                    <br>
                    <div><i class="fa fa-rocket"></i>
                    <span>Lượt xem: <b><?= $oDealInfo->daview ?></b></span></div>
                    <br>
                    <hr>
                    <br>
                    <h4>HỖ TRỢ </h4>
                    <div><i class="fa fa-phone-square"></i> Hotline: <?=$this->config->item('hotline')?></div>
                    <div><i class="fa fa-skype"></i> Skype: <?=$this->config->item('skype')?></div>
                    <div><i class="fa fa-skype"></i> Yahoo: <?=$this->config->item('yahoo')?></div>
                    <br>
                    <hr>
                </li>
                <li>
                    <h4>ĐIỀU KHOẢN SỬ DỤNG</h4>

                    <div class="liicon"><?= $oDealInfo->dacondition ?></div>
                </li>
            </ul>

        </div>
    </div>
    <script>
    $(function () {

       // var dsince = new Date(<?=date("Y",$oDealInfo->dafrom)?>, <?=date("m",$oDealInfo->dafrom)?> - 1, <?=date("d",$oDealInfo->dafrom)?>);
        var duntil = new Date(<?=date("Y",$oDealInfo->dato)?>, <?=date("m",$oDealInfo->dato)?> - 1, <?=date("d",$oDealInfo->dato)?>);
        $('#countdown').countdown({until: duntil});
    });
    </script>
<? endif; ?>
