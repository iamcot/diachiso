<div id="leftside" class="<? if ($oNews == null) echo 'width100' ?>">
    <div class="articlebox ">


            <? if ($oNews != null): ?>
                <div class="cattitle"><i
                        class="fa fa-info-circle"></i> <? if ($oNews != null): ?><?= $oNews->dalong_name ?>
                        <div>
                <span style="font-size:.7em;"><i
                        class="fa fa-calendar"></i>
                    <?= date("h:i d/m/Y", strtotime($oNews->dacreate)) ?>

                </span>
                <span style="font-size:.7em;padding-left: 10px;"><i class="fa fa-rocket"></i>
                    <span>Lượt xem: <b><?= $oNews->daview ?></b></span> </span>
                        </div>
                    <? endif; ?>
                </div>
        <div class="articlecontent">
                <ul>

                    <li>
                        <i style="font-size:.8em;padding: 10px 15px;"><?= $oNews->dacontent_short ?></i>
                    </li>
                    <? if ($oNews->dapic != ""): ?>
                        <li style="margin:15px auto 15px;text-align: center"><img
                                src="<?= base_url() . 'images/' . $oNews->dapic ?>"
                                style="max-width:80%">
                        </li>
                    <? endif; ?>
                    <li style="text-align: justify;line-height: 1.5em;"><?= $oNews->dacontent ?></li>
                </ul>
        </div>
            <? else: ?>
                <? if ($sType == "help"): ?>

                        <div class="cattitle"><i class="fa fa-folder"></i></div>
                        <div class="articlecontent newsfolder">
                            <? if (count($aCat) > 0): ?>
                                <ul>
                                    <? $currentcat = "";
                                    $i = 0;
                                    foreach ($aCat as $key => $cat):?>
                                        <li>
                                            <i class="fa fa-caret-down"></i> <?= $this->lang->line($key) ?></li>
                                        <li>
                                            <ul>
                                                <? foreach ($cat as $item): ?>
                                                    <li>
                                                        <i class="fa fa-caret-right"></i>
                                                        <a href="/help/<?= $item->daurl . '-' . $item->id . '.html' ?>"><?= $item->dalong_name ?></a>
                                                    </li>
                                                <? endforeach; ?>
                                            </ul>
                                        </li>
                                        <? $i++; endforeach; ?>
                                </ul>
                            <? endif; ?>
                        </div>

                <? else: ?>

                    <? if (count($aCat) > 0): ?>
                        <? $currentcat = "";
                        $i = 0;
                        foreach ($aCat as $key => $cat):?>
                            <div class="cattitle"><i class="fa fa-file-text"></i> <?= $this->lang->line($key) ?></div>
                            <div class="articlecontent newscat">
                                <ul>
                                    <? foreach ($cat as $item): ?>
                                        <li>
                                            <? if ($item->dapic != ""): ?>
                                                <img
                                                    src="<?= base_url() ?>thumbnails/<?= $item->dapic ?>"
                                                    style="width:50px">

                                            <? endif?>
                                            <ul>
                                                <li><a href="/news/<?= $item->daurl . '-' . $item->id . '.html' ?>"><?= $item->dalong_name ?></a></li>
                                                <li class="smalltext8"><i class="fa fa-calendar"></i> <?= date("H:i d/m/Y", strtotime($item->dacreate)) ?></li>
                                            </ul>
                                        </li>
                                    <? endforeach; ?>
                                </ul>
                            </div>
                        <? endforeach;?>

                    <? endif;?>
                <? endif; ?>
            <? endif; ?>

    </div>

    <div class="articlebox">
        <div class="cattitle"><i class="fa fa-comments-o"></i> Bình luận</div>
        <div class="articlecontent">

        </div>
    </div>
</div>
<? if($oNews != null):?>
<div id="rightside">
    <? if ($sType == "help"): ?>
        <div class="articlebox">
            <div class="cattitle"><i class="fa fa-folder"></i></div>
            <div class="articlecontent newsfolder">
                <? if (count($aCat) > 0): ?>
                    <ul>
                        <? $currentcat = "";
                        $i = 0;
                        foreach ($aCat as $key => $cat):?>
                            <li>
                                <i class="fa fa-caret-down"></i> <?= $this->lang->line($key) ?></li>
                            <li>
                                <ul>
                                    <? foreach ($cat as $item): ?>
                                        <li>
                                            <i class="fa fa-caret-right"></i>
                                            <a href="/help/<?= $item->daurl . '-' . $item->id . '.html' ?>"><?= $item->dalong_name ?></a>
                                        </li>
                                    <? endforeach; ?>
                                </ul>
                            </li>
                            <? $i++; endforeach; ?>
                    </ul>
                <? endif; ?>
            </div>
        </div>
    <? else: ?>
        <div class="articlebox">
            <? if (count($aCat) > 0): ?>
            <? $currentcat = "";
            $i = 0;
            foreach ($aCat as $key => $cat):?>
            <div class="cattitle"><i class="fa fa-file-text"></i> <?= $this->lang->line($key) ?></div>
            <div class="articlecontent newscat">
                <ul>
                    <? foreach ($cat as $item): ?>
                        <li>
                            <? if ($item->dapic != ""): ?>
                                <img
                                    src="<?= base_url() ?>thumbnails/<?= $item->dapic ?>"
                                    style="width:50px">

                            <? endif?>
                            <ul>
                                <li><a href="/news/<?= $item->daurl . '-' . $item->id . '.html' ?>"><?= $item->dalong_name ?></a></li>
                                <li class="smalltext8"><i class="fa fa-calendar"></i> <?= date("H:i d/m/Y", strtotime($item->dacreate)) ?></li>
                            </ul>
                        </li>
                    <? endforeach; ?>
                </ul>
            </div>
            <? endforeach;?>
        </div>
          <? endif;?>
    <? endif; ?>
</div>
           <? endif;?>

