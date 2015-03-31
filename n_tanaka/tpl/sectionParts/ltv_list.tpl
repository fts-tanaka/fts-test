<?php $ltvContent = $myController->_templateAssign->getAssignData("ltvContent"); ?>
<?php $ltvContentCount = count($ltvContent); ?>
<?php if($ltvContentCount > 0){ ?>
<section id="pickup">
    <h3>カード利用で<br>さらにボーナスコインがGETできる！</h3>
    <div class="imgBox">
        <img src="img/detailDescription.png" alt="" width="100%" height="auto">
    </div>
    <div class="sectionBody">
<?php for ($i = 0 ; $i < $ltvContentCount ; $i++){ ?>
    <?php if($ltvContent[$i]["card_point"] > 0){ ?>
        <?php if($i%2 == 0){ ?>
        <ul class="horizonList">
        <?php } ?>
            <li class="horizonItem tapflag">
                <a href="../../cn/index.php?cid=<?php print($ltvContent[$i]["c_id"])?><?php $myController->_templateAssign->makeQueryString("extendParam-fromid-cmp20140100card"); ?>">
                    <div class="itemWrap">
                        <div class="plusBonus">
                            <span class="plusText"></span>
                            <div class="ltvBonusFrame">ボーナス<br>付き</div>
                        </div>
                        <p class="banner" style="background:url(<?php print($ltvContent[$i]["banner_img_2"]);?>);"></p>
                        <p class="recommend star">
                            <span class="rateNumber"><?php print($ltvContent[$i]["trial"]);?></span>
                        </p>
                        <p class="coin">
                            <span class="coinNumber"><?php print(number_format(round($ltvContent[$i]["total_point"])));?></span>
                            <span class="coinUnit">コイン</span>
                        </p>
                        <p class="coin">
                            <span class="coinUnit">カード利用で</span>
                            <span class="coinNumber nextMonth">+<?php print($ltvContent[$i]["card_point"]);?></span>
                            <span class="coinUnit">コイン</span>
                        </p>
                    </div>
                </a>
            </li>
        <?php if($i%2 == 1){?>
        </ul>
        <?php } ?>
    <?php } // endif card_point > 0?>
<?php } // end for?>
<?php if($ltvContentCount%2 == 1 ){ ?>
			<li class="horizonItem"></li>
		</ul>
<?php } ?>
<!------------------------------------------------
        コイン稼ぐTOPへもどる
------------------------------------------------->
<p class="commonMore">
        <a class="moreBtn tapflag" href="http://amebame.mobadme.jp/cn/index.php"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUEAAAAaBAMAAADbHvOCAAAABGdBTUEAALGPC/xhBQAAADBQTFRF////////////////////////////////////////////////////////AAAA////vgrS8QAAAA90Uk5TqlWZM4gizO5mEd1Ed7sAiF6tWwAABUlJREFUWMOll19oW1UYwPskOHABmQ8ybBFfRGXBZ9egL4rCOlDwxZFOVBg+NKgvSnWBvYiiSf2DK1ivovgg00aQCRqbjLLi2t42o4robJrEm8ymSU+zmiVdcu8+v++c++fcm5twt52Xe8+553zf73zn+3PuELvl9v7GkbFbl/JI+id6HFt4L+EaLw71WVAGGGPaD97huxirALiGnsldL2yU81b7DYdOxQBa9+KLJsbW3sH3OkC0lhYNuzWAVVlMAbr0yHYLG2wbrLaLhEds2XnZElskAGeuLfOuqiZYXVXD3ZRY2bHmlZ7SidCRiXp+Fm9fcQze2glOyHbMPn75BeBBkzdCgkJ9CQt2DzYkwiTuWMw0FrFLH7dIv5tQWwHoIdy0sCI2Iex5CXfAozcH+g0RanEwmDnT6EdYvZN6OvmhTHjaep11CNsKK0Lrxgn1foTVHD+uXsLFFJoWXZEIayFTCGNMJjyKG8jn42Q4m5C7jDGYsMlVp9H3N1VquP3dqOyHEqH2BK47hDPnL0mE9XNII9nwqHj921qV5TMZTmnhLmp0CmY4/EjLiZBHSpg21UNIq2vnL4EphLFfOaAcyzZh5RRhtBTeqa3YhOhgOhOIHRHt2NYzzEOIsX5NdMEi1AAmOKHpQPt9YjkLncftIxOn2FSYH2H1gDDTIWv8gzukUzYcwnF8vjjs0sGF10xBWw4hLr+O/Qaf9k/+ouJDOG5ZVGxTHNCbkR7C6oGYmHfGnQcdwkoB/mLCceBJxnwJV03XzMiEO8JjreYlTMqEWsjsNBQvockHJ1g/whEr04QxFdw8YX0ePYTigX2aPov9KRHya+pBjJSaE75fewmd0HM1jSoMJyRJq0m9REVAD0pYIz90E9qRgstwvEqmaT0WFR+p822GVZZQoR+hofYQlvhIHWVl4X64mtT3kQ0bAQm1d0n2+CBCylZ/Kg4KPM9EoYHvewiN5R4XQe9GbSTGULKvTEEzSScd0A/tQyESLJz+hEmX5wO8Ll4uAzzqITSWfZyYUZnADX4O8NLccyloZ4kQx9r3BSXEmkIkjh09hCHoKBLhrnIYk02GKuVxn3zoQ5jDisWtZig5iAOvULz8nlAGEbrqMpHkRKp0KeGEAFckdZ1MWZQnnPRFIMJKnKRo5KOfgfEshNt0HXmbpLwa6ZcP/5UIO8OCpODULVsJbVcDBx3bmKhXXfL/YDb8BOAN7hSNt7IwloPbqDizSpjHVcJDWAW4KrptkvQdFtT1YZ6SdRb3IQwLW13z5I6WGuuS/w8FISzF+QBmG300O1nEUiK+V5e4fRZ76zISTccx1mVJO3g1ADgpEU5wIXH4j5TvyRrrBFOapAA6F4BwuiCqNBFW5j7CsncGvhGf7uFRsOgmzFnOd8VDaKANjbsdfXvm+ZykDNhOuAln8fb+IQqf8rt92XIxOajn/6BPr1GhbZI3joABsynrAvI0R4y6CE878ryEIfv2xXPd+sH0vDgf3FXnIX7nUi+I/NtS1RW62xUHEtopgUfG1gUkLEPrGMwm7b+AGdQAGRehFjcXRV2E25gPkhLhiCWc8sxlh8IQR2+2/QEJ+V2hvMlrCt6nJ7ZtQjaT8hKyUbHoduYhBPJ8m9B65+dTjbkI6erGW5MFIzQvqZxwEu2wWn3Z8ZnNlEk4mv/dHDqM8XtxQfzrJSTfirIlh5CFTSLuIzNuwpogbkT8//U8hMcXmEM4pyTp+D5mMmImyA8xZngM8Ye5rwk1D5D0L83F0/tkQlZRY6Crg/6XhQy8s5+Vdej8IveCV3fkJv/iq/zPeXAr/g+vctAiKsMU9gAAAABJRU5ErkJggg==" alt="コイン稼ぐTOPにもどる" width="160" height="13"></a>
</p>
<style>
.commonMore {
        padding: 12px 0;
}
.commonMore a {
        display: block;
        height: 100%;
        color: inherit;
        text-decoration: none;
        -webkit-tap-highlight-color: rgba(255,255,255,0);
}
.commonMore .moreBtn {
        width: 285px!important;
        margin: 0 auto;
        padding: 1px 0 6px;
        text-align: center;
        background: #fd4f85;
        border: 2px solid #ec2b6f;
        -webkit-box-shadow: inset 1px 1px 1px 1px #fff,inset -1px -1px -1px -1px #fff;
        box-shadow: inset 1px 1px 1px 1px #fff,inset -1px -1px -1px -1px #fff;
        -moz-box-shadow: inset 1px 1px 1px #fff,inset -1px -1px 1px #fff;
        -webkit-box-shadow: inset 1px 1px 1px #fff,inset -1px -1px 1px #fff;
        -o-box-shadow: inset 1px 1px 1px #fff,inset -1px -1px 1px #fff;
        -ms-box-shadow: inset 1px 1px 1px #fff,inset -1px -1px 1px #fff;
        border-radius: 6px;
        -webkit-background-clip: padding-box;
        background-clip: padding-box;
}
.commonMore .moreBtn.tap {
        background: #e8004c;
}
</style>
</section>
<?php } // endif $ltvContentCount > 0 ?>
