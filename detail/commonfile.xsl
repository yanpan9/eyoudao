<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- 发音小喇叭模板 -->
<!--
<xsl:template match="speech|dictcn-speach|key-speech">
<xsl:param name="objId"/>
<xsl:param name="keyfrom"/>
	<xsl:if test="text()!=''">
	<xsl:element name="a">
		<xsl:attribute name="hidefocus">true</xsl:attribute>
		<xsl:attribute name="class">sp dictvoice</xsl:attribute>
		<xsl:attribute name="title">发音</xsl:attribute>
		<xsl:attribute name="href">#</xsl:attribute>
		<xsl:attribute name="ref">http://dict.youdao.com/dictvoice?audio=<xsl:value-of select="text()"/>&amp;keyfrom=deskdict.<xsl:value-of select="$keyfrom"/></xsl:attribute>
		<xsl:attribute name="onmouseover">this.style.cursor='hand';playVoice(this.getAttribute('ref'));return false;</xsl:attribute>
		<xsl:attribute name="onmouseout">stopVoice(this.getAttribute('ref'));return false;</xsl:attribute>
		<xsl:attribute name="onclick">playVoice(this.getAttribute('ref'));return false;</xsl:attribute>
	</xsl:element>
	</xsl:if>
</xsl:template>
-->
<xsl:template match="speech|dictcn-speach|key-speech|ukspeech|usspeech|voaspeech">
<xsl:param name="objId"/>
<xsl:param name="keyfrom"/>
<xsl:param name="title">发音</xsl:param>
<xsl:param name="logName">speech</xsl:param>
	<xsl:if test="text()!=''">
	<xsl:element name="a">
		<xsl:attribute name="hidefocus">true</xsl:attribute>
		<xsl:attribute name="class">sp dictvoice</xsl:attribute>
		<xsl:attribute name="title"><xsl:value-of select="$title"/></xsl:attribute>
		<xsl:attribute name="href">javascript:void(0);</xsl:attribute>
		<xsl:attribute name="ref">http://dict.youdao.com/dictvoice?audio=<xsl:value-of select="text()"/>&amp;keyfrom=deskdict.<xsl:value-of select="$keyfrom"/></xsl:attribute>
		<xsl:attribute name="onmouseover">this.style.cursor='hand';playVoice(this.getAttribute('ref'));return false;</xsl:attribute>
		<xsl:attribute name="onmouseout">stopVoice(this.ref);return false;</xsl:attribute>
		<xsl:attribute name="onclick">playVoice(this.getAttribute('ref'));return false;;</xsl:attribute>
	</xsl:element>
	<xsl:element name="span">
		<xsl:attribute name="id">noSound<xsl:value-of select="$objId"/></xsl:attribute>
		<xsl:attribute name="style">display:none</xsl:attribute>
		<a href="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank">
			<IMG SRC="images/nosound.gif" WIDTH="17" HEIGHT="17" BORDER="0" ALT="想启用英文朗读功能吗？请先安装flash插件！" align="absmiddle" />
		</a>
	</xsl:element>
	</xsl:if>
</xsl:template>

<xsl:template match="sentence-translation-speech|sentence-speech|sent/speech">
<xsl:param name="objId"/>
<xsl:param name="keyfrom"/>
	<xsl:if test="text()!=''">
	<xsl:element name="a">
		<xsl:attribute name="hidefocus">true</xsl:attribute>
		<xsl:attribute name="class">sp dictvoice</xsl:attribute>
		<xsl:attribute name="title">点击发音</xsl:attribute>
		<xsl:attribute name="href">#</xsl:attribute>
		<xsl:attribute name="ref">http://dict.youdao.com/dictvoice?audio=<xsl:value-of select="text()"/>&amp;keyfrom=deskdict.<xsl:value-of select="$keyfrom"/></xsl:attribute>
		<xsl:attribute name="onclick">playVoice(this.getAttribute('ref'));return false;</xsl:attribute>
	</xsl:element>
	<xsl:element name="span">
		<xsl:attribute name="id">noSound<xsl:value-of select="$objId"/></xsl:attribute>
		<xsl:attribute name="style">display:none</xsl:attribute>
		<a href="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank">
			<IMG SRC="file:///opt/eyoudao/detail/images/nosound.gif" WIDTH="17" HEIGHT="17" BORDER="0" ALT="想启用英文朗读功能吗？请先安装flash插件！" align="absmiddle" />
		</a>
	</xsl:element>
	</xsl:if>
</xsl:template>

<xsl:template name="ead_block">
<xsl:param name="ead_id"/>
<xsl:param name="style"/>
	<xsl:if test="/yodaodict/result-advt-show[text() = '1']">
		<xsl:element name="div">
			<xsl:attribute name="id"><xsl:value-of select="$ead_id"/></xsl:attribute>
			<xsl:attribute name="class"><xsl:value-of select="$style"/></xsl:attribute>
		</xsl:element>
	</xsl:if>
</xsl:template>

<xsl:template name="get_language_name">
<xsl:param name="lang_type"/>
	<xsl:if test="$lang_type='eng'">汉英互译</xsl:if>
	<xsl:if test="$lang_type='jap'">汉日互译</xsl:if>
	<xsl:if test="$lang_type='fr'">汉法互译</xsl:if>
	<xsl:if test="$lang_type='ko'">汉韩互译</xsl:if>
	<xsl:if test="$lang_type='cn'">汉语释义</xsl:if>
</xsl:template>

<xsl:template name="get_language_env">
<xsl:param name="lang_type"/>
	<xsl:if test="$lang_type='eng'">英汉释义</xsl:if>
	<xsl:if test="$lang_type='jap'">日汉释义</xsl:if>
	<xsl:if test="$lang_type='fr'">法汉释义</xsl:if>
	<xsl:if test="$lang_type='ko'">韩汉释义</xsl:if>
	<xsl:if test="$lang_type='cn'">汉语释义</xsl:if>
</xsl:template>

<!-- 显示语言切换时的提示栏-->
<xsl:template name="show_language_tip">
<xsl:param name="cur_lang"/>
<xsl:param name="switch_lang"/>
	<xsl:if test="$cur_lang != $switch_lang">
		<div id="langTip">
		<table border="0" height="20" width="100%" >
			<tr><td>
			<div class="f13" style="padding-top:3px; background-color:#fefcd1;height:24px;margin-bottom:10px;">
			您正在查看<b>
			<xsl:call-template name="get_language_name">
			<xsl:with-param name="lang_type" select="$switch_lang"/>
			</xsl:call-template>
			</b>，可以通过查词框前的图标切换语言环境。
			</div>
			</td></tr>
		</table>
		</div>
	</xsl:if>
</xsl:template>

<xsl:template name="show_enter_for_more">
<xsl:param name="cur_lang"/>
<xsl:param name="switch_lang"/>
  <p class="additional">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="/yodaodict/return-phrase" />
      </xsl:attribute>
      <xsl:attribute name="target">_self</xsl:attribute>
      <xsl:choose>
        <xsl:when test="$cur_lang = $switch_lang">按Enter查看完整结果</xsl:when>
        <xsl:otherwise>
          按Enter查看<strong>
            <xsl:call-template name="get_language_name">
              <xsl:with-param name="lang_type" select="$switch_lang"/>
            </xsl:call-template>
          </strong>的完整结果</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="/yodaodict/return-phrase" />
      </xsl:attribute>
      <xsl:attribute name="target">_self</xsl:attribute>
      <xsl:attribute name="class">enter</xsl:attribute>
    </xsl:element>
  </p>
</xsl:template>

<xsl:template name="data_from">
<xsl:param name="from_type"/>
<xsl:param name="from_name"/>
<xsl:param name="from_url"/>
	<div id="source">
    	<table width="97%"><tr><td align="right">
        <xsl:if test="$from_name!=''">
        以上来源于:
        </xsl:if>
		<xsl:choose>
			<xsl:when test="$from_url=''">
				<xsl:value-of select="$from_name"/>
			</xsl:when>
			<xsl:otherwise>
			<xsl:element name="a">
				<xsl:attribute name="href"><xsl:value-of select="$from_url"/></xsl:attribute>
				<xsl:attribute name="target">_blank</xsl:attribute>
				<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', 1, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '<xsl:value-of select="$from_name"/>'+'_deskdict')</xsl:attribute>
				<xsl:value-of select="$from_name"/>
			</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
		</td></tr></table>
	</div>		
</xsl:template>

<xsl:template match="source">
<xsl:param name="dict_type"/>
	<xsl:if test=".">
		<xsl:call-template name="data_from">
			<xsl:with-param name="from_type"></xsl:with-param>
			<xsl:with-param name="from_name" select="name"/>
			<xsl:with-param name="from_url" select="url"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="baike_tab">
	<xsl:call-template name="single_tab">
    	<xsl:with-param name="tab_title">百科</xsl:with-param>
    </xsl:call-template>
</xsl:template>

<!-- 替换函数 -->
<xsl:template   name="SubStringFun">   
  <xsl:param   name="input" />   
    <xsl:param   name="from" />   
    <xsl:param   name="to" />   
    <xsl:if   test="$input">   
  <xsl:choose>   
  <xsl:when   test="contains($input,$from)">   
  <xsl:value-of   select="substring-before($input,$from)"/><xsl:value-of   select="$to"/><xsl:call-template   name="SubStringFun">   
  <xsl:with-param   name="input"   select="substring-after($input,$from)"   />   
  <xsl:with-param   name="from"   select="$from"   />   
  <xsl:with-param   name="to"   select="$to"   />   
  </xsl:call-template>   
  </xsl:when>   
  <xsl:otherwise>   
  <xsl:value-of   select="$input"   />   
  </xsl:otherwise>   
  </xsl:choose>   
    </xsl:if>   
</xsl:template>

<!-- 输出标准的return_phrase字段,去掉其中的‘\’符号 -->
<xsl:template name="standard_return_phrase">
  <xsl:variable name="yinhao">'</xsl:variable>
  <xsl:call-template   name="SubStringFun">   
  	<xsl:with-param   name="input"   select="translate(/yodaodict/input,$yinhao, '_')" />   
	<xsl:with-param   name="from"   select="'\'"   />   
    <xsl:with-param   name="to"   select="'\\'"   />   
  </xsl:call-template>
</xsl:template>

<xsl:template name="baike_more">
<xsl:param name="key"/>
	<div>
		<xsl:element name="a">
      <xsl:attribute name="class">see_more</xsl:attribute>
			<xsl:attribute name="href"><xsl:value-of select="$key"/></xsl:attribute>
			<xsl:attribute name="target">_self</xsl:attribute>
			更多与"<xsl:value-of select="$key"/>"相关的百科词条&gt;&gt;
		</xsl:element>
	</div>
</xsl:template>

  <xsl:template name="baike_item">
    <xsl:param name="key"/>
    <xsl:param name="summary"/>
    <xsl:param name="image"/>
    <xsl:param name="show_external"/>
    <xsl:param name="show_more"/>
    <xsl:param name="ctype_title"/>
    <xsl:param name="ctype_external"/>
    <div class="suggest"><xsl:if test="$image">
      <span class="img_r img">

        
          <xsl:element name="img">
            <xsl:attribute name="src">
              <xsl:value-of select="$image" />
            </xsl:attribute>
          </xsl:element>
        
        <strong>
          <xsl:value-of select="$key" />
        </strong>
      </span></xsl:if>
      <xsl:choose>
        <xsl:when test="external-link">
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="external-link/url" />
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="external-link/url" />
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="onclick">
              javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', '0', '<xsl:value-of select="/yodaodict/keyfrom"/>', 0, 'CLICK', "<xsl:value-of select="$ctype_title" />")
            </xsl:attribute>
            <xsl:value-of select="$key" />
			<img src="file:///opt/eyoudao/detail/images/outlink.gif" border="0"/>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="$key" />
            </xsl:attribute>
            <xsl:attribute name="class">title</xsl:attribute>
            <xsl:attribute name="target">_self</xsl:attribute>
            <xsl:value-of select="$key" />
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>




      <p>
        <xsl:value-of select="summary" disable-output-escaping="yes" />
      </p>
      
      <xsl:if test="$show_external = 'true'">
        <span class="details" style="white-space: nowrap;">
          <xsl:choose>
            <xsl:when test="external-link">
              <xsl:element name="a">
                <xsl:attribute name="href">
                  <xsl:value-of select="external-link/url" />
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="external-link/url" />
                </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:attribute name="onclick">
                  javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', '0', '<xsl:value-of select="/yodaodict/keyfrom"/>', 0, 'CLICK', "<xsl:value-of select="$ctype_external" />")
                </xsl:attribute>
                <xsl:value-of select="external-link/name" />
				<img src="file:///opt/eyoudao/detail/images/outlink.gif" border="0"/>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <p>
                <xsl:element name="a">
                  <xsl:attribute name="class">see_more</xsl:attribute>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$key" />
                  </xsl:attribute>
                  <xsl:attribute name="target">_self</xsl:attribute>
                  详细内容
                </xsl:element>
              </p>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:if>


      <xsl:if test="$show_more = 'true'">
        <xsl:call-template name="baike_more">
          <xsl:with-param name="key" select="$key"/>
        </xsl:call-template>
      </xsl:if>
    </div>
  </xsl:template>


<xsl:template name="basic_tab">
	<xsl:param name="tab_type"/>
	<xsl:param name="tab_num"/>
	<xsl:param name="tab_name"/>
<xsl:if test="$tab_num != 100">
	<xsl:choose>
	<xsl:when test="$tab_name[text()!='']">
    	<xsl:call-template name="single_tab">
        	<xsl:with-param name="tab_title"><xsl:value-of select="$tab_name"/></xsl:with-param>
        </xsl:call-template>
	</xsl:when>
	<xsl:otherwise>
	<xsl:if test="$tab_type[text()='ec']">
    	<xsl:call-template name="single_tab">
        	<xsl:with-param name="tab_title">英汉翻译</xsl:with-param>
        </xsl:call-template>
    </xsl:if>
	<xsl:if test="$tab_type[text()='ce']">
    	<xsl:call-template name="single_tab">
        	<xsl:with-param name="tab_title">汉英翻译</xsl:with-param>
        </xsl:call-template>
    </xsl:if>
	<xsl:if test="$tab_type[text()='ee']">
    	<xsl:call-template name="single_tab">
        	<xsl:with-param name="tab_title">英英翻译</xsl:with-param>
        </xsl:call-template>
    </xsl:if>
    <xsl:if test="$tab_type[text()='trans']">
    	<xsl:call-template name="single_tab">
        	<xsl:with-param name="tab_title">翻译</xsl:with-param>
        </xsl:call-template>
    </xsl:if>
	</xsl:otherwise>
	</xsl:choose>
</xsl:if>

</xsl:template>

<xsl:template name="single_tab">
  <xsl:param name="tab_title"/>
     <h3>
         <span class="tabs">
             <a class="tab-current"><span><xsl:value-of select="$tab_title"/></span></a>
         </span>
         <div class="tail"></div>
     </h3>
</xsl:template>
<xsl:template name="keyword_top_line">
<xsl:param name="keyword"/>
<xsl:param name="phone"/>
<xsl:param name="speech"/>
<xsl:param name="phonesup"/> <!-- 音标，上标的形式出现 [日语]-->
<xsl:param name="field"/> <!-- 域  [日语]-->
<xsl:param name="origin"/> <!-- 词源 [日语]-->
<xsl:param name="showadd2wordbook"/>
<xsl:param name="showfeedback" select="false"/>
	<xsl:if test="$keyword">
		<h2><span class="keyword">
			<xsl:choose>
				<xsl:when test="$keyword/l">
				<xsl:apply-templates select="$keyword/l"/>
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="$keyword" />
				</xsl:otherwise>
			</xsl:choose></span>
		  <span class="phonetic">
		    <xsl:if test="$phone[text()!='']">
			  [<xsl:value-of select="$phone" />]
		    </xsl:if>
		  </span>
	       <!-- 输出上标发音 [日语]-->
		    <xsl:if test="$phonesup[text()!='']">
			  <sup><xsl:value-of select="$phonesup" /></sup>
		    </xsl:if>
	      <!-- 输出发音-->
			<xsl:if test="$speech[text()!='']">
			<xsl:apply-templates select="$speech">
				<xsl:with-param name="objId" select="'EC'"/>
				<xsl:with-param name="keyfrom">main.word</xsl:with-param>
			</xsl:apply-templates>
			</xsl:if>

			<!-- 域 -->
			<xsl:if test="$field[text()!='']">
			<span class="field"><xsl:value-of select="$field"/></span> 
			</xsl:if>
			<xsl:if test="$origin[text()!='']">
			<span class="origin">【<xsl:value-of select="$origin"/>】</span>
			</xsl:if>
			<!--
			<xsl:if test="$showadd2wordbook = 'true'">
			<xsl:element name="a">
			    <xsl:attribute name="hidefocus">true</xsl:attribute>
				<xsl:attribute name="class">sp add-fav</xsl:attribute>
				<xsl:attribute name="title">加入单词本</xsl:attribute>
				<xsl:attribute name="id">addFav</xsl:attribute>
				<xsl:attribute name="ref"><xsl:value-of select="$keyword"/></xsl:attribute>
				<xsl:attribute name="href"><xsl:value-of select="$keyword" disable-output-escaping="yes"/></xsl:attribute>
				<xsl:attribute name="onclick">if (INBOOK == 1) return false;else return true;</xsl:attribute>
			</xsl:element>
			</xsl:if>
			-->
		</h2>
	</xsl:if>

</xsl:template>

<xsl:template name="keyword_top_line_pronounce">
<xsl:param name="keyword"/>
<xsl:param name="phone"/>
<xsl:param name="ukphone"/>
<xsl:param name="usphone"/>
<xsl:param name="speech"/>
<xsl:param name="ukspeech"/>
<xsl:param name="usspeech"/>
<xsl:param name="phonesup"/> <!-- 音标，上标的形式出现 [日语]-->
<xsl:param name="field"/> <!-- 域  [日语]-->
<xsl:param name="origin"/> <!-- 词源 [日语]-->
<xsl:param name="showadd2wordbook"/>
<xsl:param name="showfeedback">false</xsl:param>
	<xsl:if test="$keyword">
		<h2>
			<!-- 单词 -->
			<span class="keyword">
			<xsl:choose>
				<xsl:when test="$keyword/l">
				<xsl:apply-templates select="$keyword/l"/>
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="$keyword" />
				</xsl:otherwise>
			</xsl:choose>
			</span>

			<!-- 上标发音 [日语]-->
			<xsl:if test="$phonesup[text()!='']">
			<sup><xsl:value-of select="$phonesup" /></sup>
			</xsl:if>

	        <!-- 输出发音-->
			<xsl:if test="$speech[text()!=''] or $phone[text()!='' and not($ukspeech[text()!=''] or $ukphone[text()!=''] or $usspeech[text()!=''] or $usphone[text()!=''])]">
				<span class="pronounce-top"><xsl:if test="$phone[text()!='']"><span class="phonetic pr-phone">[<xsl:value-of select="$phone"/>]</span></xsl:if>
					<xsl:if test="$speech[text()!='']">
						<xsl:apply-templates select="$speech">
							<xsl:with-param name="objId" select="'EC'"/>
							<xsl:with-param name="keyfrom">main.word</xsl:with-param>
						</xsl:apply-templates>
					</xsl:if>
				</span>
			</xsl:if>

			<!-- 域 -->
			<xsl:if test="$field[text()!='']">
			<span class="field"><xsl:value-of select="$field"/></span> 
			</xsl:if>
			<xsl:if test="$origin[text()!='']">
			<span class="origin">【<xsl:value-of select="$origin"/>】</span>
			</xsl:if>

			<!-- 单词本 -->
			<!--
			<xsl:if test="$showadd2wordbook = 'true'">
			<xsl:element name="a">
				<xsl:attribute name="hidefocus">true</xsl:attribute>
				<xsl:attribute name="class">sp add-fav</xsl:attribute>
				<xsl:attribute name="title">加入单词本</xsl:attribute>
				<xsl:attribute name="id">addFav</xsl:attribute>
				<xsl:attribute name="ref"><xsl:value-of select="$keyword"/></xsl:attribute>
				<xsl:attribute name="href">app:addword:<xsl:value-of select="$keyword" disable-output-escaping="yes"/></xsl:attribute>
				<xsl:attribute name="onclick">ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'WordBook');</xsl:attribute>
			</xsl:element>
			</xsl:if>
			-->

			<!-- 报错 -->
			<!--
			<xsl:if test="$showfeedback = 'true'">
				<span id="rptErrSucceed" class="tipDevotion errorTip" style="display:none"></span>
				<xsl:element name="a">
					<xsl:attribute name="href">javascript:void(0);</xsl:attribute>
					<xsl:attribute name="title">报错</xsl:attribute>
					<xsl:attribute name="class">tipDevotion errorTip rptErrLink</xsl:attribute>
					报错
				</xsl:element>
			</xsl:if>
			-->

			<!-- 输出发音-->
			<div class="baav">
				<xsl:if test="$ukspeech[text()!=''] or $ukphone[text()!=''] or $usspeech[text()!=''] or $usphone[text()!='']">
					<xsl:if test="$ukspeech[text()!=''] or $ukphone[text()!='']">
						<span class="pronounce">英<xsl:if test="$ukphone[text()!='']"><span class="phonetic pr-ukphone">[<xsl:value-of select="$ukphone" />]</span></xsl:if>	
							<xsl:if test="$ukspeech[text()!='']">
								<xsl:apply-templates select="$ukspeech">
									<xsl:with-param name="objId" select="'EC'"/>
									<xsl:with-param name="keyfrom">main.word</xsl:with-param>
									<xsl:with-param name="title">真人发音</xsl:with-param>
									<xsl:with-param name="logName">ukspeech</xsl:with-param>
								</xsl:apply-templates>
							</xsl:if>
						</span>
					</xsl:if>
					<xsl:if test="$usspeech[text()!=''] or $usphone[text()!='']">
						<xsl:if test="$ukspeech[text()!=''] or $ukphone[text()!='']">
							<xsl:text> </xsl:text>
						</xsl:if>
						<span class="pronounce">美<xsl:if test="$usphone[text()!='']"><span class="phonetic pr-usphone">[<xsl:value-of select="$usphone"/>]</span></xsl:if>
							<xsl:if test="$usspeech[text()!='']">
								<xsl:apply-templates select="$usspeech">
									<xsl:with-param name="objId" select="'EC'"/>
									<xsl:with-param name="keyfrom">main.word</xsl:with-param>
									<xsl:with-param name="title">真人发音</xsl:with-param>
									<xsl:with-param name="logName">usspeech</xsl:with-param>
								</xsl:apply-templates>
							</xsl:if>
						</span>
					</xsl:if>
				</xsl:if>
			</div>
		</h2>
	</xsl:if>
</xsl:template>

<xsl:template name="keyword_line">
<xsl:param name="keyword"/>
<xsl:param name="phone"/>
<xsl:param name="speech"/>
<xsl:param name="phonesup"/> <!-- 音标，上标的形式出现 [日语]-->
<xsl:param name="field"/> <!-- 域  [日语]-->
<xsl:param name="origin"/> <!-- 词源 [日语]-->
<xsl:param name="showadd2wordbook"/>

	<xsl:if test="$keyword">
    	  <h5>
			<xsl:choose>
				<xsl:when test="$keyword/l">
				<xsl:apply-templates select="$keyword/l"/>
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="$keyword" />
				</xsl:otherwise>
			</xsl:choose>
		  <span class="phonetic">
		    <xsl:if test="$phone[text()!='']">
			  [<xsl:value-of select="$phone" />]
		    </xsl:if>
		  </span>
	       <!-- 输出上标发音 [日语]-->
		    <xsl:if test="$phonesup[text()!='']">
			  <sup><xsl:value-of select="$phonesup" /></sup>
		    </xsl:if>
	      <!-- 输出发音-->
			<xsl:if test="$speech[text()!='']">
			<xsl:apply-templates select="$speech">
				<xsl:with-param name="objId" select="'EC'"/>
				<xsl:with-param name="keyfrom">main.word</xsl:with-param>
			</xsl:apply-templates>
			</xsl:if>

			<!-- 域 -->
			<xsl:if test="$field[text()!='']">
			<span class="field"><xsl:value-of select="$field"/></span> 
			</xsl:if>
			<xsl:if test="$origin[text()!='']">
			<span class="origin">【<xsl:value-of select="$origin"/>】</span>
			</xsl:if>
			<xsl:if test="$showadd2wordbook = 'true'">
			<xsl:element name="a">
			    <xsl:attribute name="hidefocus">true</xsl:attribute>
				<xsl:attribute name="class">sp add-fav</xsl:attribute>
				<xsl:attribute name="title">加入单词本</xsl:attribute>
				<xsl:attribute name="id">addFav</xsl:attribute>
				<xsl:attribute name="ref"><xsl:value-of select="$keyword"/></xsl:attribute>
				<xsl:attribute name="href"><xsl:value-of select="$keyword"/></xsl:attribute>
			</xsl:element>
			</xsl:if>
		  </h5>
	  
	</xsl:if>
</xsl:template>

<!-- 输出line -->
<xsl:template match="l">
	<xsl:for-each select="i">
		<xsl:choose>
		 <xsl:when test="@action">
			<!-- 处理link -->
			 <xsl:if test="@action='link'">
		 		<xsl:choose>
				 <xsl:when test="@href">
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
						<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
						<xsl:choose>
						<xsl:when test="l">
							<xsl:apply-templates select="l"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="." />
						</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
						<xsl:value-of select="." />
					</xsl:element>
				</xsl:otherwise>
				</xsl:choose>
			 </xsl:if>
			<!-- 处理高亮 -->
			 <xsl:if test="@action='highlight'">
				 <strong>
					<xsl:choose>
						<xsl:when test="l">
							<xsl:apply-templates select="l"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="." />
						</xsl:otherwise>
					</xsl:choose>
				 </strong>
			 </xsl:if>
 			<!-- 处理上标 -->
			 <xsl:if test="@action='sup'">
			 	<sup style="font-size:85%;"><xsl:value-of select="."/></sup>
			 </xsl:if>
  			<!-- 处理图片 -->
			 <xsl:if test="@action='img'">
				<xsl:element name="img">
					<xsl:attribute name="src"><xsl:value-of select="/yodaodict/hh/imgbase"/>/<xsl:value-of select="@src" /></xsl:attribute>
					<xsl:attribute name="border">0</xsl:attribute>
					<xsl:attribute name="align">absmiddle</xsl:attribute>
				</xsl:element>
			 </xsl:if>

		 </xsl:when>
		 <xsl:otherwise>
			<!-- 如果什么都没有，就如实输出-->
			<xsl:choose>
			<xsl:when test="l">
				<xsl:apply-templates select="l"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="." />
			</xsl:otherwise>
			</xsl:choose>
		 </xsl:otherwise>
	 	</xsl:choose>	 
	</xsl:for-each>
</xsl:template>

<!-- 简明词典模板-->
<xsl:template match="simple-dict">
	<xsl:for-each select="word">
			<div class="trans-container">
			
			<!-- 居右的广告-->
			<xsl:call-template name="ead_block">
				<xsl:with-param name="ead_id">ead_dictr_right</xsl:with-param>
				<xsl:with-param name="style">ead_right</xsl:with-param>
			</xsl:call-template>
			 
			<!-- 循环输出解释项 -->
			<ul>
			<xsl:for-each select="trs/tr">
				<li>
          <span class="def" >
            <xsl:apply-templates select="l"/>
          </span>
				</li>
			</xsl:for-each>
			</ul>
			<!-- 输出单词变形-->
			<xsl:if test="wfs">
				<p class="additional">
				[
				    	<xsl:for-each select="wfs/wf">
				    	 	<xsl:value-of select="name" /> <xsl:value-of select="value" /> &#000032;
				    	</xsl:for-each> ]
				
				</p>
			</xsl:if>
			
			</div>
		
			<xsl:if test="similar-words">
				<div class="attr">
					<IMG SRC="file:///opt/eyoudao/detail/images/pointd.gif" WIDTH="5" HEIGHT="5" BORDER="0" ALT="" align="absmiddle"/>
				<font class="dot">. </font>
				<B>近义词或词组</B>
			  </div>		
			  <div class="attr">
					<span>
					<xsl:for-each select="similar-words/similar">
						<xsl:if test="position() &lt;= 4" >
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
							<xsl:attribute name="class">blue12other</xsl:attribute>
							<xsl:attribute name="target">_self</xsl:attribute>
							<xsl:value-of select="." />
						</xsl:element>
						<xsl:if test="not(position() = count(../similar)) and not(position() = 4) "> | </xsl:if> 
						</xsl:if>
					</xsl:for-each>
					</span>			
					<span  id="moreSimwords" style="display:none">
					<xsl:for-each select="similar-words/similar">
						<xsl:if test="position() &gt; 4" >
							 | 
							<xsl:element name="a">
								<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
								<xsl:attribute name="class">blue12other</xsl:attribute>
								<xsl:attribute name="target">_self</xsl:attribute>
								<xsl:value-of select="." />
							</xsl:element>
						</xsl:if>
						</xsl:for-each>
					</span>		
					<xsl:if test="count(similar-words/similar) &gt; 4" >
						<xsl:element name="span">
							<xsl:attribute name="id">showmoreSimwords</xsl:attribute>
							<font class="dot"> . </font>
							<IMG SRC="file:///opt/eyoudao/detail/images/dictrstarbu.gif" WIDTH="4" HEIGHT="8" BORDER="0" ALT="展开" align="absmiddle"/>
							<xsl:element name="a">
		  	 				<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
			   				<xsl:attribute name="title">点击查看更多的近义词</xsl:attribute>
								<xsl:attribute name="onclick">changeMoreSpan('moreSimwords')</xsl:attribute>
								更多
		    			</xsl:element>
						</xsl:element>
		
						<xsl:element name="span">
							<xsl:attribute name="id">hidemoreSimwords</xsl:attribute>
							<xsl:attribute name="style">display:none</xsl:attribute>
							<font class="dot"> . </font>
							<IMG SRC="file:///opt/eyoudao/detail/images/dictlstarbu.gif" WIDTH="4" HEIGHT="8" BORDER="0" ALT="隐藏更多" align="absmiddle"/>
							<xsl:element name="a">
		  	 				<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
		   					<xsl:attribute name="class">blue12other</xsl:attribute>
								<xsl:attribute name="onclick">changeMoreSpan('moreSimwords')</xsl:attribute>
								隐藏更多
		    			</xsl:element>
						</xsl:element>
					</xsl:if>
				</div>
			</xsl:if>
			<xsl:if test="/yodaodict/basic/type[text()='trans']">
			<br/>
			<span style="color:#666666">
			来自<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="/yodaodict/return-phrase" /></xsl:attribute>有道翻译</xsl:element>的自动转换
			</span>
			</xsl:if>
	</xsl:for-each>

</xsl:template>


<!-- 词性模板 -->
<xsl:template name="category">
	<xsl:param name="cat_name"/>
	<xsl:param name="cat_extra"/>
	<div style="margin:6px 0;">   
      <span class="pos" style="font-weight:bold;">
        <xsl:value-of select="$cat_name"/>
      </span>
      <span style="margin-left:5px">
        <xsl:value-of select="$cat_extra" disable-output-escaping="no"/>
      </span>
      </div>
	 
	
</xsl:template>

<!-- 权威词典中的例句模板-->
<xsl:template match="exam">
	<xsl:if test="i">
	<xsl:choose>
	<xsl:when test="i/f">
 <br/>
	</xsl:when>
	<xsl:otherwise>
 
	</xsl:otherwise>
	</xsl:choose>

 
	<xsl:for-each select="i">
  
		<xsl:if test="f">
		   <xsl:apply-templates select="f/l"/> 
		</xsl:if>
		<xsl:if test="count(../i) &gt; 1">
			<xsl:if test="not(f)">
				<img src="file:///opt/eyoudao/detail/images/displaypoint.gif" alt="" width="13" align="absmiddle" border="0" height="20" />
      </xsl:if>
     
		</xsl:if>
		   
		   
     <br/>
	</xsl:for-each>
 
 
	</xsl:if>
</xsl:template>

<!-- 近义词/反义词模板 -->
<xsl:template match="syno|anto">
<xsl:param name="cat_title"/>
	<xsl:call-template name="category">
		<xsl:with-param name="cat_name"><xsl:value-of select="$cat_title"/></xsl:with-param>
		<xsl:with-param name="cat_extra"></xsl:with-param>
	</xsl:call-template>
	<div style="float:left;width:6px"> </div>
		<div class="meaning">
			<xsl:for-each select="i">
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
						<xsl:value-of select="." />
					</xsl:element> <font class="dot"> . </font>
			</xsl:for-each>
		</div>
</xsl:template>

<!-- 权威词典中的词性 -->
<xsl:template match="wfs">
  <xsl:if test="wf">
	<xsl:call-template name="category">
		<xsl:with-param name="cat_name">变形:</xsl:with-param>
		<xsl:with-param name="cat_extra"></xsl:with-param>
	</xsl:call-template>

	<xsl:for-each select="wf">
		<div style="margin-left:16px">
			<xsl:value-of select="pos" />
			<xsl:for-each select="i">
				<span style="margin-left:5px;">
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
						<xsl:value-of select="." />
					</xsl:element>
				</span>
			</xsl:for-each>
		</div>
	</xsl:for-each>
  </xsl:if>
</xsl:template>

<!-- 词组短语模板 -->
<xsl:template match="phrs">
	<xsl:call-template name="category">
		<xsl:with-param name="cat_name">短语</xsl:with-param>
		<xsl:with-param name="cat_extra"></xsl:with-param>
	</xsl:call-template>

	<xsl:for-each select="i">
		<div style="float:left;width:6px"> </div>
		<xsl:if test="count(../i) &gt; 1">
			<div style="float:left;margin-right:5px"><xsl:number value="position()" format="1. "/></div>
		</xsl:if>
		<div style="float:left;">
			<div style="float:left;margin-left:0px">

				<!-- 直接输出 -->			
				<xsl:if test="text() != ''">
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
						<xsl:value-of select="." />
					</xsl:element>
				</xsl:if>
				
				<xsl:apply-templates select="phr/l" />
				<span style="width:8px"> </span>
				<xsl:apply-templates select="des/l" />
			</div>
			<xsl:if test="tr">
				<br/>
				<xsl:for-each select="tr/l">
					<div style="margin-left:0px;">
					<xsl:number value="position()" format="a. "/>
					<xsl:apply-templates select="."/>
					</div>
				</xsl:for-each>			
			</xsl:if>
		</div>
		<div style="overflow:hidden;height:1px;clear:both"></div>
	</xsl:for-each>
</xsl:template>

<xsl:template match="tr">
<xsl:param name="num"/>
<xsl:param name="level_num"/>
  <div style="margin-bottom:13px;">
	<xsl:if test="$num &gt; 0">
		<span><xsl:value-of select="$num"/></span>
	</xsl:if>
	<span>
		<xsl:apply-templates select="l"/>
		<!-- 输出解释的子项-->
		<xsl:for-each select="./tr">
			<xsl:apply-templates select=".">
				<xsl:with-param name="num">
					<!-- 这里对输出的序号格式做个规划 -->
					<xsl:if test="$level_num='1'"> <xsl:number value="position()" format="1) "/> </xsl:if>
					<xsl:if test="$level_num='2'"> <xsl:number value="position()" format="a. "/> </xsl:if>
					<xsl:if test="$level_num='3'"> <xsl:number value="position()" format="a) "/> </xsl:if>
					<!--xsl:if test="number($level_num)>=4">~</xsl:if-->
				</xsl:with-param>
				<xsl:with-param name="level_num" select="number($level_num)+1" />
			</xsl:apply-templates>
		</xsl:for-each>
	</span> 
    
	<!-- 输出例句 -->
	<xsl:if test="exam">
		<xsl:for-each select = "exam/i">
		<p class="additional">
			<xsl:value-of select="./f" />
		</p>
    <p class="additional">
      <xsl:value-of select="./n" />
    </p>
		</xsl:for-each>
	</xsl:if>
  </div>
</xsl:template>

<xsl:template name="xyz_exam">
<xsl:param name="exam"/>
	<xsl:if test="$exam">
	<ul class="sense-ex">
	<xsl:choose>
	<xsl:when test="$exam/i/@type">
		<li><span class="title"><xsl:value-of select="$exam/i/@type"/>：</span>
		<ul>
		<xsl:for-each select="$exam/i">
		  <li>
		  	<xsl:apply-templates select="f/l"/> / <xsl:apply-templates select="n/l"/>
		  </li>
		</xsl:for-each>
		</ul>
		</li>
	</xsl:when>
	<xsl:otherwise>
		<xsl:for-each select="$exam/i">
		  <li><span class="title">
		  	<xsl:apply-templates select="f/l"/> / <xsl:apply-templates select="n/l"/>
			</span>
		  </li>
		</xsl:for-each>
	</xsl:otherwise>
	</xsl:choose>
	</ul>
	</xsl:if>

</xsl:template>

<xsl:template name="xyz_trs">
<xsl:param name="trs"/>
			<xsl:for-each select="$trs">
				<!-- 如果只有一项，则和词性放在同一行-->
				<xsl:if test="count(tr)&lt;=1">
					<li>
					<xsl:if test="pos">
						<span class="pos">
						[<xsl:value-of select="pos"/>]
						</span>
					</xsl:if>
					<xsl:if test="field">
						<span class="field">&lt;<xsl:value-of select="field"/>&gt;</span>
					</xsl:if>
					<span class="def">
						<xsl:apply-templates select="l"/>
						<xsl:apply-templates select="tr/l"/>
					</span>
					<xsl:call-template name="xyz_exam">
						<xsl:with-param name="exam" select="exam"/>
					</xsl:call-template>
					<xsl:call-template name="xyz_exam">
						<xsl:with-param name="exam" select="tr/exam"/>
					</xsl:call-template>

					</li>
				</xsl:if>
				
				<xsl:if test="count(tr) &gt; 1">
				<li class="small-lang">
					<xsl:if test="pos">
					<span class="pos">
						[<xsl:value-of select="pos"/>]
					</span>
					</xsl:if>
					<xsl:if test="field">
						<span class="field">&lt;<xsl:value-of select="field"/>&gt;</span> 
					</xsl:if>
					<xsl:element name="ul">
						<xsl:if test="count(tr) &gt; 1">
							<xsl:attribute name="class">ol</xsl:attribute>
						</xsl:if>	
					<xsl:for-each select="tr">
						<!-- 输出解释 -->
						<li>
							<span class="def">
							<xsl:choose>
								<xsl:when test="i">
								<xsl:value-of select="i"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="l"/>
							</xsl:otherwise>
							</xsl:choose>
							</span>
						</li>
					<xsl:call-template name="xyz_exam">
						<xsl:with-param name="exam" select="exam"/>
					</xsl:call-template>
					</xsl:for-each>
					</xsl:element>
				</li>
				</xsl:if>
			</xsl:for-each>
</xsl:template>

<xsl:template match="dict">
<div class="trans-container">
	<xsl:for-each select="word">
		<div id="classic"  >
			<!-- 输出关键词、音标、发音小喇叭 -->
			<xsl:call-template name="keyword_line">
				<xsl:with-param name="keyword" select="return-phrase"/>
				<xsl:with-param name="phone" select="phone"/>
				<xsl:with-param name="phonesup" select="phonesup"/>
				<xsl:with-param name="speech" select="speech"/>
				<xsl:with-param name="field" select="field"/>
				<xsl:with-param name="origin" select="origin"/>
				<xsl:with-param name="showadd2wordbook">false</xsl:with-param>
			</xsl:call-template>
							
			<!-- 循环输出解释项 -->
			<xsl:choose>
			<xsl:when test="count(trs) &gt; 1">
			<xsl:element name="ul">
			<xsl:if test="count(xyz_trs) &gt; 1">
				<xsl:attribute name="class">ol</xsl:attribute>
			</xsl:if>
				<xsl:call-template name="xyz_trs">
					<xsl:with-param name="trs" select="trs"/>
				</xsl:call-template>
			</xsl:element>
			</xsl:when>
			<xsl:otherwise>
			<ul>
				<xsl:call-template name="xyz_trs">
					<xsl:with-param name="trs" select="trs"/>
				</xsl:call-template>
			</ul>
			</xsl:otherwise>
			</xsl:choose>
			
			
			<!-- 显示近义词 反义词-->
			<xsl:apply-templates select="syno">
				<xsl:with-param name="cat_title">近义词:</xsl:with-param>
			</xsl:apply-templates>
			<xsl:apply-templates select="anto">
				<xsl:with-param name="cat_title">反义词:</xsl:with-param>
			</xsl:apply-templates>
			
			<!-- 显示短语-->
			<xsl:apply-templates select="phrs"/>
			
			<!-- 显示词性变形-->
			<xsl:apply-templates select="wfs"/>
		</div>
		<xsl:if test="not(position() = count(../word))"><br/></xsl:if>
	</xsl:for-each>
</div>
</xsl:template>

<xsl:template match="authoritative-dict">
<div class="trans-container">
	<xsl:for-each select="word">
		<xsl:if test="position() &gt; 1" >
			<div style="overflow:hidden;height:1px;background:url(detail/images/cidian_point_empty.gif) repeat-x;margin-top:10px;clear:both"/>
		</xsl:if>
		<div id="classic" >
			<!-- 输出关键词、音标、发音小喇叭 -->
			<xsl:call-template name="keyword_line">
				<xsl:with-param name="keyword" select="return-phrase"/>
				<xsl:with-param name="phone" select="phone"/>
				<xsl:with-param name="phonesup" select="phonesup"/>
        <xsl:with-param name="speech" select="speech"/> 
				<xsl:with-param name="field" select="field"/>
				<xsl:with-param name="origin" select="origin"/>
				<xsl:with-param name="showadd2wordbook">false</xsl:with-param>
			</xsl:call-template>
							
			<!-- 循环输出解释项 -->
			<xsl:for-each select="trs">
        <div style="margin-bottom:18px">
          <!-- 如果只有一项，则和词性放在同一行-->
          <xsl:if test="count(tr)=1">
            <xsl:call-template name="category">
              <xsl:with-param name="cat_name" select="pos"/>
              <xsl:with-param name="cat_extra"/>
            </xsl:call-template>

            <xsl:apply-templates select="tr">
              <!--xsl:with-param name="num"/-->
              <xsl:with-param name="level_num">1</xsl:with-param>
            </xsl:apply-templates>

          </xsl:if>


          <xsl:if test="count(tr) &gt; 1">
            <xsl:call-template name="category">
              <xsl:with-param name="cat_name" select="pos"/>
              <xsl:with-param name="cat_extra"/>
            </xsl:call-template>

            <xsl:for-each select="tr">
              <!-- 输出解释 -->
              <xsl:apply-templates select=".">
                <xsl:with-param name="num">
                  <xsl:number value="position()" format="1. "/>
                </xsl:with-param>
                <xsl:with-param name="level_num">1</xsl:with-param>
              </xsl:apply-templates>
            </xsl:for-each>
          </xsl:if>
        </div>
			</xsl:for-each>
			
			<!-- 显示近义词 反义词-->
			<xsl:apply-templates select="syno">
				<xsl:with-param name="cat_title">近义词:</xsl:with-param>
			</xsl:apply-templates>
			<xsl:apply-templates select="anto">
				<xsl:with-param name="cat_title">反义词:</xsl:with-param>
			</xsl:apply-templates>
			
			<!-- 显示短语
			<xsl:apply-templates select="phrs"/>-->
			
			<!-- 显示词性变形-->
			<xsl:apply-templates select="wfs"/>
		</div>
	</xsl:for-each>

</div>
</xsl:template>

<xsl:template name="web-translation-first">
	 
	<xsl:param name="query-word"/>
	<xsl:param name="node"/>
	
	
	<xsl:for-each select="$node/trans">
	<xsl:if test="position() = 1">
	<div class="wt-container wt-collapse">
	  <div class="title">
        <a href="javascript:void(0);" title="详细释义" rel="#rw1" class="sp do-detail" style="cursor: pointer;">
          <xsl:attribute name="onclick">
            isClose = $(this).closest('.wt-container').hasClass('wt-collapse');
            if (isClose == true)
              ctlog('', '' , 0, 'webtranslation.fold' , 1, 'CLICK',  '网络释义展开');
            else
              ctlog('', '' , 0, 'webtranslation.fold' , 1, 'CLICK',  '网络释义关闭');
          </xsl:attribute>
		  <xsl:attribute name="onmouseover">
		     isClose = $(this).closest('.wt-container').hasClass('wt-collapse');
            if (isClose == true)
			{ 
			    $(this).attr('title','展开详细释义') 
			}
			else{
			    $(this).attr('title','收起详细释义')
			}
		   </xsl:attribute>
        </a>
        <span>
			      <xsl:if test="./cls">
							  <font color="#959595">
							  <xsl:for-each select="./cls/cl">[<xsl:value-of select="."/>]</xsl:for-each>
							  </font>&#160;
							</xsl:if>
            <xsl:value-of select="./value"/>
          </span>
      </div>
      <p class="collapse-content">
        <xsl:for-each select="./summary/line">

          <xsl:value-of select ="." disable-output-escaping="yes"/>
        </xsl:for-each>
      </p>
      <p class="via collapse-content">
        基于<xsl:value-of select="./support"/>个网页<span class="sl">-</span>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="./url"/>
          </xsl:attribute>相关网页</xsl:element>
        <a href="javascript:void(0);"></a>
      </p> 
    </div>
	</xsl:if>
	<xsl:if test="position() &gt; 1">
	<div class="wt-container wt-collapse">
    <div class="title">
        <a href="javascript:void(0);" title="详细释义" rel="#rw1" class="sp do-detail" style="cursor: pointer; ">
          <xsl:attribute name="onclick">
            isClose = $(this).closest('.wt-container').hasClass('wt-collapse');
            if (isClose == true)
            ctlog('', '' , 0, 'webtranslation.fold' , 1, 'CLICK',  '网络释义展开');
            else
            ctlog('', '' , 0, 'webtranslation.fold' , 1, 'CLICK',  '网络释义关闭');
          </xsl:attribute>
		   <xsl:attribute name="onmouseover">
		    isClose = $(this).closest('.wt-container').hasClass('wt-collapse');
            if (isClose == true)
			{ 
			    $(this).attr('title','展开详细释义') 
			}
			else{
			    $(this).attr('title','收起详细释义')
			}
		   </xsl:attribute>
        </a>
        <span>
          <xsl:if test="./cls">
            <font color="#959595">
              <xsl:for-each select="./cls/cl">
                [<xsl:value-of select="."/>]
              </xsl:for-each>
            </font>&#160;
          </xsl:if>
            <xsl:value-of select="./value"/>
          </span>
      </div>
      <p class="collapse-content">
        <xsl:for-each select="./summary/line">

          <xsl:value-of select ="." disable-output-escaping="yes"/>
        </xsl:for-each>
      </p>
      <p class="via collapse-content">
        基于<xsl:value-of select="./support"/>个网页<span class="sl">-</span>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="./url"/>
          </xsl:attribute>
          相关网页
        </xsl:element>
        <a href="javascript:void(0);"></a>
      </p>
    </div>
	</xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="web-translation-other">


</xsl:template>

<!-- 网络释义词条 -->
<xsl:template match="web-translation">
<xsl:param name="query-word"/>
<xsl:param name="pos"/>
		<xsl:element name="div">
		  <xsl:attribute name="class">wt-container wt-collapse</xsl:attribute>
		  <xsl:attribute name="id">wt_item_<xsl:value-of select="$pos"/></xsl:attribute>
            <h4>
				<xsl:element name="a">
					<xsl:attribute name="title">详细释义</xsl:attribute>
					<xsl:attribute name="onclick">javascript:ctlog_fold_or_not(this, '<xsl:call-template name="standard_return_phrase" />', '<xsl:number value="$pos"/>', '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '网络释义', this.parentNode.parentNode.className.indexOf('wt-collapse'));changeWebTranFirstItemState(this.parentNode.parentNode.className.indexOf('wt-collapse'),<xsl:number value="$pos"/>);</xsl:attribute>
					<span class="sp do-detail">-</span>
				<xsl:value-of select="key"/> 
				<span class="collapsed-def">：
					<!--折叠模式中, 输出所有的value, 并以 ‘；’ 隔开 -->
					<xsl:for-each select="trans">
						<xsl:value-of select="value"/>
						 <xsl:if test="not(position() = count(../trans))">；</xsl:if>
					</xsl:for-each>
				</span>
				</xsl:element>
				<span name="nullid">
					<font color="#ffffff"> </font>
					<xsl:if test="key-speech[text()!='']">
						<xsl:apply-templates select="key-speech">
							<xsl:with-param name="objId" select="'EC'"/>
							<xsl:with-param name="keyfrom">main.phrase</xsl:with-param>
						</xsl:apply-templates>
					</xsl:if>
				</span>

				 
			</h4>
			<xsl:element name="ul">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="count(trans) &gt; 1">ol</xsl:when>
					<xsl:otherwise>ul</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
            
			<xsl:for-each select="trans">
              <li>
                <h5><xsl:value-of select="value"/></h5>
                <p>
					<xsl:for-each select="summary/line">
						<xsl:if test="text() != ''">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</xsl:if>
					</xsl:for-each>
				</p>
                <p class="via">
				 基于<xsl:value-of select="support"/>个网页<span style="font-family:'宋体'"> - </span>
				 <xsl:element name="a">
						<xsl:attribute name="href">http://www.youdao.com/search?keyfrom=deskdict.webtrans.relatedpage&amp;q=%22<xsl:value-of select="../key"/>%22%2B%22<xsl:value-of select="value"/>%22</xsl:attribute>
						<xsl:attribute name="target">_blank</xsl:attribute>
						<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', '1.'+'<xsl:number value="position()"/>', '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'deskdict_phrase_search')</xsl:attribute>
						搜索相关网页
					</xsl:element>
				 </p>
              </li>
			</xsl:for-each>
            </xsl:element>
          </xsl:element>
</xsl:template>

<xsl:template name="hh_keyword">
<xsl:param name="word"/>
<xsl:param name="phone"/>
<xsl:param name="speech"/>
<xsl:param name="fkey"/>
<xsl:param name="ykey"/>
	<h4>
	<span class="title"><xsl:apply-templates select="$word/l"/></span>
	<xsl:if test="phone[text()!='']">
	<span class="spell">[<xsl:value-of select="$phone"/>]</span> 
	</xsl:if>
	<!-- 输出发音-->
	<xsl:if test="speech[text()!='']">
	<xsl:apply-templates select="$speech">
		<xsl:with-param name="objId" select="'EC'"/>
		<xsl:with-param name="keyfrom">main.word</xsl:with-param>
	</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$fkey">
	<span class="complexfont">
		繁体:&lt;<xsl:apply-templates select="$fkey/l"/>&gt;
	</span>
	</xsl:if>
	<xsl:if test="$ykey">
	<span class="complexfont">
		异体:&lt;<xsl:apply-templates select="$ykey/l"/>&gt;
	</span>
	</xsl:if>
	</h4>
</xsl:template>

 


  <xsl:template match="word">
    <xsl:param name="bHide"/>
    <xsl:element name="div">
      <xsl:attribute name="class">
        <xsl:if test="$bHide='true'">hh-more</xsl:if>
      </xsl:attribute>

      <!--<xsl:call-template name="hh_keyword">
			<xsl:with-param name="word" select="key"/>
			<xsl:with-param name="phone" select="phone"/>
			<xsl:with-param name="speech" select="speech"/>
			<xsl:with-param name="fkey" select="fkey"/>
			<xsl:with-param name="ykey" select="ykey"/>
		</xsl:call-template>-->
     
     <strong>   <xsl:value-of select="key"/></strong>
        <span class="spell">
        [<xsl:value-of select="phone"/>]
      </span>
     
      
      <xsl:element name="ul">
			<xsl:if test="count(trs/tr) &gt; 1">
			<xsl:attribute name="class">ol</xsl:attribute>
			</xsl:if>
			<!-- 循环输出解释项 -->
			<xsl:for-each select="trs/tr">
				<xsl:call-template name="hh_tr">
					<xsl:with-param name="tr" select="."/>
					<xsl:with-param name="bHide">
						<xsl:if test="position() &gt; 3">true</xsl:if>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			</xsl:element>
	</xsl:element>
	<!-- 相关词 -->
	<xsl:if test="phrs">
	<span class="hh-more">
	<xsl:call-template name="category">
		<xsl:with-param name="cat_name">常见词组</xsl:with-param>
		<xsl:with-param name="cat_extra"></xsl:with-param>
	</xsl:call-template>
	</span>
	</xsl:if>

	<xsl:for-each select="phrs/word">
		<xsl:apply-templates select=".">
			<xsl:with-param name="bHide">
				<xsl:if test="(count(../../trs/tr) &gt; 4) or (position() &gt; 2)">true</xsl:if>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:for-each>
</xsl:template>

<xsl:template name="hh_tr">
<xsl:param name="tr"/>
<xsl:param name="bHide"/>
	<xsl:element name="li">
		<xsl:attribute name="class">
			<xsl:if test="$bHide='true'">hh-more</xsl:if>
		</xsl:attribute>
				<!-- 输出解释 -->
        <p>
          <xsl:apply-templates select="$tr/l"/>
        </p> 
				<xsl:for-each select="$tr/exam/i">


          <p class="additional">
            <xsl:apply-templates select="n/l"/>
          </p>
			 
			 
				</xsl:for-each>
			 
	</xsl:element>
</xsl:template>

<xsl:template match="hh">
 

	<div class="trans-container">
	<xsl:for-each select="word">
	<xsl:choose>
		<xsl:when test="position() &lt; 3">
			<xsl:apply-templates select=".">
				<xsl:with-param name="bHide">false</xsl:with-param>
			</xsl:apply-templates>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select=".">
				<xsl:with-param name="bHide">true</xsl:with-param>
			</xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:for-each>
	<xsl:if test="(count(word) &gt; 2) or (count(word/trs/tr) &gt; 3)">
	<div>
		
	</div>
	</xsl:if>

 
</div>
</xsl:template>

<xsl:template name="local-phrs">
    <xsl:param name="phr_data"/>

            <!--<p class="wordGroup"><span class="contentTitle">many people </span> 许多人；很多人；好多人</p>
            <p class="wordGroup"><span class="contentTitle">some people </span> 有些人；有人；一些人</p>
            <p class="wordGroup"><span class="contentTitle">other people </span> 其他人</p>
            <p class="wordGroup"><span class="contentTitle">chinese people </span> 中国人</p>
            <p class="wordGroup"><span class="contentTitle">young people </span> n. 年 年轻人</p>
            <p class="wordGroup"><span class="contentTitle">most people </span> 多数人</p>-->
    <div id="word_phrs" class="pr-container more-collapse">
      <xsl:for-each select ="$phr_data/phr">
        <p class="wordGroup">
          <span>
            <strong>
              <xsl:value-of select="headword" />
            </strong>
          </span>
          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
          <xsl:value-of select="trs"/>
          <xsl:if test="./source[text()='21世纪']">
            <a href="javascript:void(0);" class="century21" title="来源于21世纪大英汉词典"> &#160; </a>
          </xsl:if>
        </p>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template name="phrs">
    <xsl:param name="phr_data"/>

            <!--<p class="wordGroup"><span class="contentTitle">many people </span> 许多人；很多人；好多人</p>
            <p class="wordGroup"><span class="contentTitle">some people </span> 有些人；有人；一些人</p>
            <p class="wordGroup"><span class="contentTitle">other people </span> 其他人</p>
            <p class="wordGroup"><span class="contentTitle">chinese people </span> 中国人</p>
            <p class="wordGroup"><span class="contentTitle">young people </span> n. 年 年轻人</p>
            <p class="wordGroup"><span class="contentTitle">most people </span> 多数人</p>-->
    <div id="word_phrs" class="pr-container more-collapse">
      <xsl:for-each select ="$phr_data/phr[position() &lt;  6]">
        <p class="wordGroup">
          <span class="contentTitle">
            <xsl:element name="a">
              <xsl:attribute name="onclick">
                ctlog(this, '<xsl:call-template name="standard_return_phrase" />' , 0, 'deskdict.main.cizu' , 1, 'CLICK',  '点击词组短语');
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="headword" />
              </xsl:attribute>
              <xsl:value-of select="headword" />
            </xsl:element>
          </span>
          <xsl:value-of select="trs"/>
		  <xsl:if test="./source[text()='21世纪']">
		  <a href="javascript:void(0);" class="century21" title="来源于21世纪大英汉词典"> &#160; </a>
		  </xsl:if>
        </p>
      </xsl:for-each>
      <xsl:if test="count($phr_data/phr) &gt; 5">
        <xsl:for-each select ="$phr_data/phr[position() &gt;  5]">
          <p class="wordGroup collapse">
            <span class="contentTitle">
              <xsl:element name="a">
                <xsl:attribute name="onclick">
                  ctlog(this, '<xsl:call-template name="standard_return_phrase" />' , 0, 'deskdict.main.cizu' , 1, 'CLICK',  '点击词组短语');
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="headword" />
                </xsl:attribute>
                <xsl:value-of select="headword" />
              </xsl:element>
            </span>
            <xsl:value-of select="trs"/>
			<xsl:if test="./source[text()='21世纪']">
			  <a href="javascript:void(0);" class="century21" title="来源于21世纪大英汉词典"> &#160; </a>
			</xsl:if>
          </p>

        </xsl:for-each>
        <div class="more">
          <a href="javascript:void(0);" class="sp more_sp">
            &#160;
          </a>
          <span class="show_more">更多</span>
          <span class="show_less">收起</span>词组短语
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  
<!--用于输出双语例句的每个句子-->
<xsl:template match="aligned-words/src | aligned-words/tran">
  <xsl:param name="sentence"/>
  <xsl:param name="sentence_id"/>

  <xsl:variable name="lang" select="name()"/>
  <xsl:for-each select="*">
    <xsl:choose>
      <xsl:when test="position()=1"><xsl:value-of select="substring($sentence, 1, @s - 1)" disable-output-escaping="yes"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="substring($sentence, preceding-sibling::*[1]/@e, @s - preceding-sibling::*[1]/@e)" disable-output-escaping="yes"/></xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="name()='chars'">
        <span>
          <xsl:variable name="highlight_str">
            <xsl:for-each select="aligns/*">
              <xsl:choose>
                <xsl:when test="name()='sc'">#src</xsl:when>
                <xsl:when test="name()='tc'">#tran</xsl:when>
              </xsl:choose>_<xsl:value-of select="$sentence_id"/>_<xsl:value-of select="@id"/>
              <xsl:if test="position()!=last()">,</xsl:if>
            </xsl:for-each>
          </xsl:variable>
          <xsl:attribute name="id"><xsl:value-of select="$lang"/>_<xsl:value-of select="$sentence_id"/>_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="data-aligning"><xsl:value-of select="$highlight_str"/></xsl:attribute>
          <xsl:choose>
            <xsl:when test="q">
							<xsl:for-each select="q">
								<xsl:if test="position()=1">
									<xsl:value-of select="substring($sentence, ../@s, @s - ../@s)" disable-output-escaping="yes"/>
								</xsl:if>
								<b>
									<xsl:value-of select="substring($sentence, @s, @e - @s)" disable-output-escaping="yes"/>
								</b>
								<xsl:if test="position()=last()">
									<xsl:value-of select="substring($sentence, @e, ../@e - @e)" disable-output-escaping="yes"/>
								</xsl:if>
							</xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring($sentence, @s, @e - @s)" disable-output-escaping="yes"/>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:when>
      <xsl:when test="name()='q'">
        <b>
          <xsl:value-of select="substring($sentence, @s, @e - @s)" disable-output-escaping="yes"/>
        </b>
      </xsl:when>
    </xsl:choose>
    <xsl:if test="position()=last()">
      <xsl:value-of select="substring($sentence, @e)" disable-output-escaping="yes"/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!--双语例句-->
<xsl:template match="example-sentences">
	<xsl:param name="keyfrom"/>
	
	<xsl:element name="ul">
		<!-- 只有一个例句时候使用ul -->
		<xsl:if test="count(sentence-pair) &gt; 1">
			<xsl:attribute name="class">ol</xsl:attribute>
		</xsl:if>
		<xsl:for-each select="sentence-pair">
			<li>
				<p>
					<xsl:choose>
						<xsl:when test="aligned-words/src">
							<xsl:apply-templates select="aligned-words/src">
								<xsl:with-param name="sentence" select="sentence"/>
								<xsl:with-param name="sentence_id" select="position()"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="sentence" disable-output-escaping="yes"/>
						</xsl:otherwise>
					</xsl:choose>
						<xsl:if test="sentence-speech[text()!='']">
						<xsl:apply-templates select="sentence-speech">
							<xsl:with-param name="objId" select="'EC'"/>
							<xsl:with-param name="keyfrom" select="$keyfrom"/>
						</xsl:apply-templates>
					</xsl:if>
				</p>
				<p>
					<xsl:choose>
						<xsl:when test="aligned-words/tran">
							<xsl:apply-templates select="aligned-words/tran">
								<xsl:with-param name="sentence" select="sentence-translation"/>
								<xsl:with-param name="sentence_id" select="position()"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="sentence-translation" disable-output-escaping="yes"/>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:if test="sentence-translation-speech[text()!='']">
						<xsl:apply-templates select="sentence-translation-speech">
							<xsl:with-param name="objId" select="'EC'"/>
							<xsl:with-param name="keyfrom" select="$keyfrom"/>
						</xsl:apply-templates>
					</xsl:if>
				</p>
				<p class="example-via">
					<xsl:if test="not(source-url)">
						<span class="via"><xsl:value-of select="source" /></span>
					</xsl:if>
					<xsl:if test="source-url">
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="source-url"/></xsl:attribute>
							<xsl:attribute name="target">_blank</xsl:attribute>
							<xsl:attribute name="title">来源</xsl:attribute>
							<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', '<xsl:number value="position()"/>', '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '双语例句来源点击_'+'<xsl:value-of select="$keyfrom"/>')</xsl:attribute>
							<xsl:value-of select="source" />
						</xsl:element>
					</xsl:if>
					<xsl:if test="url">
						<xsl:if test="not(source)">
							<xsl:element name="a">
								<xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
								<xsl:attribute name="target">_blank</xsl:attribute>
								<xsl:attribute name="title">来源</xsl:attribute>
								<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase" />', '<xsl:number value="position()"/>', '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '双语例句来源点击_'+'<xsl:value-of select="$keyfrom"/>')</xsl:attribute>
								<xsl:if test="source">
									<xsl:value-of select="source" />
								</xsl:if>
								<xsl:if test="not(source)">
									<xsl:value-of select="substring-before(substring-after(url, 'http://'), '/')"/>
								</xsl:if>
							</xsl:element>
						</xsl:if>
					</xsl:if>
				</p>
			</li>
		</xsl:for-each>
	</xsl:element>
</xsl:template>

<!--权威例句-->
<xsl:template match="auth-sents">
	<xsl:param name="keyfrom"/>

	<xsl:element name="ul">
		<!-- 只有一个例句时候使用ul -->
		<xsl:if test="count(sent) &gt; 1">
			<xsl:attribute name="class">ol</xsl:attribute>
		</xsl:if>
		<xsl:for-each select="sent">
			<li>
				<p>
					<xsl:value-of select="foreign" disable-output-escaping="yes"/>
					<xsl:if test="speech">
						<xsl:apply-templates select="speech">
							<xsl:with-param name="objId" select="'EC'"/>
							<xsl:with-param name="keyfrom" select="$keyfrom"/>
						</xsl:apply-templates>
					</xsl:if>
				</p>
				<p class="example-via">
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
						<xsl:attribute name="target">_blank</xsl:attribute>
						<xsl:attribute name="title">来源</xsl:attribute>
						<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase"/>', "<xsl:number value="position()"/>", "<xsl:value-of select="/yodaodict/keyfrom"/>", 1, 'CLICK', '权威例句来源点击_'+'<xsl:value-of select="$keyfrom"/>');</xsl:attribute>
						<xsl:value-of select="source" disable-output-escaping="yes"/>
					</xsl:element>
				</p>
			</li>
		</xsl:for-each>
	</xsl:element>
</xsl:template>

<!--原声例句-->
<xsl:template match="media-sents">
	<xsl:param name="keyfrom"/>
				
	<xsl:element name="ul">
		<!-- 只有一个例句时候使用ul -->
		<xsl:if test="count(sent) &gt; 1">
			<xsl:attribute name="class">ol</xsl:attribute>
		</xsl:if>
		<xsl:for-each select="sent">
			<li>
				<xsl:choose>
					<xsl:when test="@type='audio'">
						<!--音频-->
						<p>
							<xsl:if test="eng"><xsl:value-of select="eng" disable-output-escaping="yes"/></xsl:if>
							<xsl:element name="a">
								<xsl:attribute name="class">sp humanvoice</xsl:attribute>
								<xsl:attribute name="title">点击发音</xsl:attribute>
								<xsl:attribute name="href">#</xsl:attribute>
								<xsl:attribute name="ref">
									<xsl:value-of select="snippets/snippet/streamUrl"/>&amp;keyfrom=deskdict.<xsl:value-of select="yodaodict/keyfrom"/>
								</xsl:attribute>
								<xsl:attribute name="onclick">playVoice(this.getAttribute('ref'));return false;javascript:ctlog("", '<xsl:call-template name="standard_return_phrase"/>', "<xsl:number value="position()"/>", "<xsl:value-of select="/yodaodict/keyfrom"/>", 1, 'CLICK', '音频例句点击发音_'+'<xsl:value-of select="$keyfrom"/>');return false;</xsl:attribute>
							</xsl:element>
						</p>
						<xsl:if test="chn"><p><xsl:value-of select="chn" disable-output-escaping="yes"/></p></xsl:if>
						<xsl:if test="snippets/snippet/name"><p class="example-via"><a><xsl:if test="snippets/snippet/source"><xsl:value-of select="snippets/snippet/source" disable-output-escaping="yes"/>: </xsl:if><i><xsl:value-of select="snippets/snippet/name" disable-output-escaping="yes"/></i></a></p></xsl:if>
					</xsl:when>
			
					<xsl:when test="@type='video'">
						<!--视频-->
						<xsl:if test="eng"><p><xsl:value-of select="eng" disable-output-escaping="yes"/></p></xsl:if>
						<xsl:if test="chn"><p><xsl:value-of select="chn" disable-output-escaping="yes"/></p></xsl:if>
						<div class="video">
							<a class="play">
								<xsl:attribute name="href"><xsl:value-of select="snippets/snippet/swf"/><xsl:if test="snippets/snippet/streamUrl[text()!='']">?<xsl:value-of select="snippets/snippet/streamUrl"/></xsl:if></xsl:attribute>
								<xsl:attribute name="onclick">javascript:isFalshReady();javascript:ctlog("", '<xsl:call-template name="standard_return_phrase"/>', "<xsl:number value="position()"/>", "<xsl:value-of select="/yodaodict/keyfrom"/>", 1, 'CLICK', '视频例句点击播放_'+'<xsl:value-of select="$keyfrom"/>');</xsl:attribute>
								<xsl:element name="img">
									<xsl:attribute name="src"><xsl:value-of select="snippets/snippet/imageUrl"/></xsl:attribute>
									<xsl:attribute name="alt">点击播放</xsl:attribute>
								</xsl:element>
								<span class="playicon"><img src="file:///opt/eyoudao/detail/css/play.png"/></span>
							</a>
							<a href="javascript:void(0);" class="close"></a>
						</div>

						<xsl:if test="snippets/snippet/name and snippets/snippet/source">
							<p class="example-via">
								<xsl:element name="a">
									<xsl:if test="snippets/snippet/sourceUrl">
										<xsl:attribute name="href"><xsl:value-of select="snippets/snippet/sourceUrl"/></xsl:attribute>
										<xsl:attribute name="target">_blank</xsl:attribute>
										<xsl:attribute name="title">来源</xsl:attribute>
										<xsl:attribute name="onclick">javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase"/>', "<xsl:number value="position()"/>", "<xsl:value-of select="/yodaodict/keyfrom"/>", 1, 'CLICK', '视频例句来源点击_'+'<xsl:value-of select="$keyfrom"/>');</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="snippets/snippet/name" disable-output-escaping="yes"/>&#160;-&#160;<xsl:value-of select="snippets/snippet/source" disable-output-escaping="yes"/>
								</xsl:element>	
							</p>
						</xsl:if>
					</xsl:when>
				</xsl:choose>
			</li>
		</xsl:for-each>
	</xsl:element>
</xsl:template>

  <xsl:template match="yodaodict/sentences-result">
    <xsl:param name="keyfrom"/>
    <xsl:param name="input"/>
    <xsl:param name="inputEncode"/>
    <div>
      <xsl:call-template name="sentence_result">
        <xsl:with-param name="keyfrom" select="$keyfrom"/>
        <xsl:with-param name="input" select="$input"/>
        <xsl:with-param name="inputEncode" select="$inputEncode"/>
      </xsl:call-template>

    </div>
  </xsl:template>

  <xsl:template match="/yodaodict/local-dicts/dict/sentences-result">
    <xsl:param name="keyfrom"/>
    <xsl:param name="input"/>
    <xsl:param name="inputEncode"/>
    <div>
      <xsl:call-template name="sentence_result">
        <xsl:with-param name="keyfrom" select="$keyfrom"/>
        <xsl:with-param name="input" select="$input"/>
        <xsl:with-param name="inputEncode" select="$inputEncode"/>
      </xsl:call-template>

    </div>
  </xsl:template>

  <xsl:template name="sentence_result">
    <xsl:param name="keyfrom"/>
    <xsl:param name="input"/>
    <xsl:param name="inputEncode"/>
        <div id="examples" class="trans-wrapper">
          <h3>
            <xsl:if test="example-sentences/sentence-pair">
              <span class="tabs">
                <a rel="#bilingual">
                  <xsl:attribute name="onclick">
                    ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换双语例句');
                  </xsl:attribute>
                  <span>双语例句</span>
                </a>
              </span>
            </xsl:if>
            
			<xsl:if test="media-sents/sent">
            <span class="tabs">
              <a rel="#yuansheng" >
                <xsl:attribute name="onclick">
                  ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换原声例句');
                </xsl:attribute>
                <span>原声例句</span>
              </a>
            </span>
          </xsl:if>
          <xsl:if test="auth-sents/sent">
            <span class="tabs">
              <a rel="#quanwei" >
                <xsl:attribute name="onclick">
                  ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换权威例句');
                </xsl:attribute>
                  <span>权威例句</span>
                </a>
              </span>
            </xsl:if>
            <div class="tail"></div>
            <a class="toggle toggleOpen" rel="#examplesToggle"></a>
          </h3>
          <div id="examplesToggle">
            <div id ="bilingual" class="trans-container tab-content">
			<xsl:if test="example-sentences/sentence-pair">
              <xsl:apply-templates select="example-sentences">
                <xsl:with-param name="keyfrom">main.sentence</xsl:with-param>
              </xsl:apply-templates>
			  <xsl:element name="a">
				<xsl:attribute name="class">more-example</xsl:attribute>
				<xsl:attribute name="href"><xsl:value-of select="$inputEncode"/>?ljtype=blng&amp;ljblngcont=0</xsl:attribute>
          <xsl:attribute name="onclick">
            ctlog('', '<xsl:call-template name="standard_return_phrase" />' , 0, 'deskdict.main.morelj.blng' , 1, 'CLICK',  '点击更多双语例句');
        </xsl:attribute>
        更多双语例句
      </xsl:element>
    </xsl:if>
  </div>
  <div id ="yuansheng" class="trans-container tab-content">
    <xsl:if test="media-sents/sent">
      <xsl:apply-templates select="media-sents">
        <xsl:with-param name="keyfrom" select="$keyfrom"/>
      </xsl:apply-templates>

      <xsl:element name="a">
        <xsl:attribute name="class">more-example</xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="$inputEncode"/>?ljtype=mdia&amp;ljmdia=0</xsl:attribute>
        <xsl:attribute name="onclick">
          ctlog('', '<xsl:call-template name="standard_return_phrase" />' , 0, 'deskdict.main.morelj.mdia' , 1, 'CLICK',  '点击更多原声例句');
        </xsl:attribute>
        更多原声例句
      </xsl:element>
    </xsl:if>
  </div>
  <div id ="quanwei" class="trans-container tab-content">
    <xsl:if test="auth-sents/sent">
      <xsl:apply-templates select="auth-sents">
        <xsl:with-param name="keyfrom" select="$keyfrom"/>
      </xsl:apply-templates>
      <xsl:element name="a">
        <xsl:attribute name="class">more-example</xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="$inputEncode"/>?ljtype=auth</xsl:attribute>
        <xsl:attribute name="onclick">
          ctlog('', '<xsl:call-template name="standard_return_phrase" />' , 0, 'deskdict.main.morelj.auth' , 1, 'CLICK',  '点击更多权威例句');
        </xsl:attribute>
				更多权威例句
			  </xsl:element>
			   </xsl:if>
            </div>
			<xsl:call-template name="ead_block">
					<xsl:with-param name="ead_id">ead_dictr_3</xsl:with-param>
					<xsl:with-param name="style">ead_line</xsl:with-param>
				</xsl:call-template>
          </div>
        </div>
</xsl:template>

<xsl:template match="special-dict">
  <div id="tPETrans" class="trans-container tab-content">
    <div class="type-list" id="tPETrans-type-list">
		<xsl:if test="count(entries/entry) &gt; 0">
			<span class="boldWord">专业: </span>
		</xsl:if>
        <xsl:for-each select="entries/entry">
          <xsl:choose>
            <xsl:when test="position() = 1">
              <xsl:element name="a">
                <xsl:attribute name="class">p-type selected_link</xsl:attribute>
                <xsl:attribute name="href">#</xsl:attribute>
                <xsl:attribute name="rel">type<xsl:value-of select="position()"/></xsl:attribute>
                <xsl:attribute name="onclick">
                  javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '切换专业')
                </xsl:attribute>
                <xsl:attribute name="hidefocus">true</xsl:attribute>
                <xsl:value-of select="major"/>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <ins> | </ins>
              <xsl:element name="a">
                <xsl:attribute name="class">p-type</xsl:attribute>
                <xsl:attribute name="href"></xsl:attribute>
                <xsl:attribute name="rel">type<xsl:value-of select="position()"/>
                </xsl:attribute>
                <xsl:attribute name="onclick">
                  javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '切换专业')
                </xsl:attribute>
                <xsl:attribute name="hidefocus">true</xsl:attribute>
                <xsl:value-of select="major"/>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
    </div>
    <ul class="all-trans" id="tPETrans-all-trans">
        <xsl:for-each select="entries/entry">
          <xsl:element name="li">
            <xsl:attribute name="class">type<xsl:value-of select="position()"/> types</xsl:attribute>
              <xsl:for-each select="trs">
                  <xsl:for-each select="tr">
                    <xsl:element name="div">
                      <xsl:attribute name="class">items</xsl:attribute>
                    <span class="title"><xsl:value-of select="nat" disable-output-escaping="yes"/></span>
                    <xsl:if test="not(cite[text() = '0'])">
                      <span class="additional"> - 引用次数：<xsl:value-of select="cite"/></span>
                    </xsl:if>
                    <p class="source">
                    <xsl:value-of select="engSent" disable-output-escaping="yes"/>
                    </p>
                    <p class="trans">
                      <xsl:value-of select="chnSent" disable-output-escaping="yes"/>
                    </p>            
                    <xsl:if test="docTitle">
                        <span class="additional">参考来源 - </span>
                        <xsl:element name="a">
                          <xsl:attribute name="href">
                            <xsl:value-of select="url"/>
                          </xsl:attribute>
                          <xsl:attribute name="onclick">
                            javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '点击专业释义来源')
                          </xsl:attribute>
                          <xsl:value-of select="docTitle"/>
                         </xsl:element>
                    </xsl:if>
                    </xsl:element>
                  </xsl:for-each>
            </xsl:for-each>
          </xsl:element>
        </xsl:for-each>
    </ul>
    <p class="additional">
      <span class="middot">&#183;</span>
      <!--以上统计来自-->
      <xsl:value-of select="summary/text"/> <!--篇论文数据，部分数据来源于 -->
      <xsl:for-each select="summary/sources/source">
        <xsl:choose>
          <xsl:when test="not(position() = 1)">
            &amp;
          </xsl:when>
        </xsl:choose>
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="url"/>
          </xsl:attribute>
          <xsl:attribute name="onclick">
            javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', '点击数据来源')
          </xsl:attribute>
          <xsl:value-of select="site"/>
        </xsl:element>
      </xsl:for-each>
    </p>
  </div>
</xsl:template>

</xsl:stylesheet>
