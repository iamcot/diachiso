<? if(isset($aPics) && count($aPics)>0):?>
    <ul id="placepics">
        <? foreach($aPics as $pic):?>
            <li>
                <img src="<?=base_url()?>images/<?=$pic->dapic?>">
                <i class="fa fa-quote-left"></i> <?=$pic->dacaption?> <i class="fa fa-quote-right"></i>
            </li>
        <? endforeach;?>
    </ul>
<? endif;?>