<?php $pickupContentData = $myController->_templateAssign->getAssignData("pickupContent"); ?>
<?php $pickupContentDataCount = count($pickupContentData); ?>
<?php if($pickupContentDataCount > 0 ){ ?>
<section class="otherC">
    <h3>その他のおすすめクレジットカードリスト</h3>
    <div class="sectionBody">
        <ul class="grid-col3-c">
    <?php for ($i = 0 ; $i < $pickupContentDataCount; $i++) { ?>
            <li class="item none tapflag">
				<div class="gridInner">
                	<?php if(strpos($pickupContentData[$i][charge_exp], "無料") !== false){ ?>
                	<div class="plusBonus grid-col3">
                    	<div class="plusText"></div>
                    	<div class="BonusFrame">無料</div>
                	</div>
                	<?php } ?>
                	<a href="../../cn/index.php?cid=<?php print($pickupContentData[$i]["c_id"])?><?php $myController->_templateAssign->makeQueryString("extendParam-fromid-cmp20140100card"); ?>" onclick="ga('send', 'event', 'cmp20140100card', 'pickup', '<?php print($i)?>', {'nonInteraction' : 1}); ga('secondTracker.send', 'event', 'cmp20140100card', 'pickup', '<?php print($i)?>', {'nonInteraction' : 1});">
                    	<p class="banner grid_col3" style="background:url(<?php print($pickupContentData[$i]["banner_img_2"])?>)"></p>
                    	<p class="grid_3col_coin">
                        	<span class="coinNumber"><?php print(number_format(round($pickupContentData[$i]["total_point"])))?></span>
                        	<span class="coinUnit">コイン</span>
                    	</p>
                	</a>
				</div>
            </li>
    <?php } // end for ?>
        </ul>
    </div>
</section>
<?php } // end if $pickupContentDataCount > 0 ?>
