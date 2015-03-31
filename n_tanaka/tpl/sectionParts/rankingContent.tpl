<?php $rankingContentData = $myController->_templateAssign->getAssignData("rankingContent"); ?>
<?php $rankingContentDataCount = count($rankingContentData); ?>
<?php if($rankingContentDataCount > 0 ){ ?>
<section id="ranking">
    <h3>人気ランキング</h3>
	<div class="sectionBody">
    <?php for ($i = 0 ; $i < 3 ; $i++ ) { ?>
        <?php if ( isset($rankingContentData[$i]["c_id"])) { ?>
		<ul class="horizonList">
			<li class="horizonItem tapflag">
            <?php if(strpos($rankingContentData[$i]["charge_exp"], "無料") !== false){ ?>
				<div class="plusBonus">
					<div class="plusText"></div>
					<div class="BonusFrame">無料</div>
				</div>
            <?php } ?>
				<a href="../../cn/index.php?cid=<?php print($rankingContentData[$i]["c_id"])?><?php $myController->_templateAssign->makeQueryString("extendParam-fromid-cmp20140100card"); ?>" onclick="ga('send', 'event', 'cmp20140100card', 'ranking', '<?php print($i); ?>', {'nonInteraction' : 1}); ga('secondTracker.send', 'event', 'cmp20140100card', 'ranking', '<?php print($i); ?>', {'nonInteraction' : 1})">
					<div class="itemWrap">
						<p class="name"><span class="rankMark rank<?php print($i+1); ?>"><i class="icon">x</i> <?php print($i+1); ?></span><?php print($rankingContentData[$i]["banner_text_1"]);?></p>
						<p class="banner" style="background:url(<?php print($rankingContentData[$i]["banner_img_2"]);?>);"></p>
						<p class="description"><?php print($rankingContentData[$i]["description"]);?></p>
						<p class="coin"><span class="coinNumber"><?php print(number_format(round($rankingContentData[$i]["total_point"])));?></span><span class="coinUnit">コイン</span></p>
					</div>
				</a>
			</li>
		</ul>
        <?php } // end if isset($rankingContentDataCount["c_id"])?>
    <?php } // end for?>
        <ul class="grid-col3-c">
    <?php for ($i = 3; $i < $rankingContentDataCount; $i++) { ?>
        <?php if(isset($rankingContentData[$i]["c_id"]) ) { ?>
            <li class="item none tapflag">
				<div class="gridInner">
                	<span class="rankMark grid-col3 rank<?php print($i+1)?>"><?php print($i+1)?></span>
                	<?php if(strpos($rankingContentData[$i]["charge_exp"], "無料") !== false){ ?>
                	<div class="plusBonus grid-col3">
                    	<div class="plusText"></div>
                    	<div class="BonusFrame">無料</div>
                	</div>
                	<?php } ?>
                	<a href="/cn/index.php?cid=<?php print($rankingContentData[$i]["c_id"]);?><?php $myController->_templateAssign->makeQueryString("extendParam-fromid-cmp20140100card"); ?>" onclick="ga('send', 'event', 'Wama1', 'item', '<?php print($rankingContentData[$i]["c_id"]);?>', {'nonInteraction' : 1}); ga('secondTracker.send', 'event', 'Wama1', 'item', '<?php print($rankingContentData[$i]["c_id"]);?>', {'nonInteraction' : 1});">
                    	<p class="banner grid_col3" style="background:url(<?php print($rankingContentData[$i]["banner_img_2"]);?>)">
                    	</p>
                    	<p class="grid_3col_coin">
                        	<span class="coinNumber"><?php print(number_format(round($rankingContentData[$i]["total_point"])));?></span>
                        	<span class="coinUnit">コイン</span>
                    	</p>
                	</a>
				</div>
           	</li>
        <?php } // end if isset($rankingContentData[$i]["c_id"])?>
    <?php } // end for ?>
        </ul>
	</div>
</section>
<?php } ?>
