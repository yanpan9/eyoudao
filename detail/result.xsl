<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="commonfile.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Local Query Result</title>
				<!--link href="css/default.css" rel="stylesheet" type="text/css"/-->
				<!--<link href="css/new.css" rel="stylesheet" type="text/css"/>-->
				<!--<script language="javascript" src="js/default.js"/>-->
				<link href="file:///opt/eyoudao/detail/css/default.css" rel="stylesheet" type="text/css"/>
				<script language="javascript" src="file:///opt/eyoudao/detail/js/default.js"/>
			</head>
			<body>
	<!--
	<div id="mask"></div>  
	<div id="classify">  
		<h4 style="text-align: center">选择分类</h4>
		<hr id="sed_add_flag" style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" color="#ccc" SIZE="3" />
		<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" color="#ccc" SIZE="3" />
		<a id="addbooklink" class="addbookstyle" href="#" onclick="return add_to_book();">ok</a>
		<a class="addbookstyle" href="#" onclick="hideAll();return false;">no</a>
	</div>  
    <div id="actionTips" style="display:none">
        <div class="at-container">正在查询……</div>
    </div>
	-->
				<div id="results">
<audio id="my_sound"></audio>
					<a href="javascript:void(0);" class="go-top sp" id="go-top"  hidefocus="true">go top</a>
					<div id="result_navigator" class="result_navigator">
						<div class="nav-list">
							<ul class="sub-catalog group_1">
								<xsl:if test="yodaodict/thirdpart-result/fanyi-result">
									<li class="sub1_all">
										<a href="#fanyiResult" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '翻译结果'); ">翻译结果</a>
									</li>
								</xsl:if>
								<xsl:if test="yodaodict/thirdpart-result/websearch-result">
									<li class="sub1_all">
										<a href="#wsResult" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '搜索结果');" >网页搜索</a>
									</li>
								</xsl:if>
								<xsl:if test="(/yodaodict/basic/dict) or (/yodaodict/basic/simple-dict) or (/yodaodict/yodao-web-dict/web-translation)">
									<li class="sub1_all">
										<a href="#" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '释义'); ">释义</a>
									</li>
								</xsl:if>
								<xsl:if test="/yodaodict/basic/eng-phrs-dict/phrs/phr or /yodaodict/basic/eng-syno-dict/synos/syno">
									<li class="spoken">
										<a href="#phrsSynoTab" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '用法'); ">用法</a>
									</li>
								</xsl:if>
								<xsl:if test="yodaodict/sentences-result/example-sentences/sentence-pair or
					yodaodict/sentences-result/media-sents/sent or
					yodaodict/sentences-result/auth-sents/sent">
									<li class="written">
										<a href="#yodao_anchor_sentence" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '例句'); ">例句</a>
									</li>
								</xsl:if>
								<xsl:if test="/yodaodict/baike">
									<li class="thesis">
										<a href="#eBaike" hidefocus="true" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '百科'); ">百科</a>
									</li>
								</xsl:if>

                                <xsl:if test="yodaodict/basic/collins-dict or /yodaodict/basic/authoritative-dict">
                                    <xsl:if test="yodaodict/thirdpart-result/fanyi-result or yodaodict/thirdpart-result/websearch-result or (/yodaodict/basic/dict) or (/yodaodict/basic/simple-dict) or (/yodaodict/yodao-web-dict/web-translation) or /yodaodict/basic/eng-phrs-dict/phrs/phr or /yodaodict/basic/eng-syno-dict/synos/syno or yodaodict/sentences-result/example-sentences/sentence-pair or
                        yodaodict/sentences-result/media-sents/sent or
                        yodaodict/sentences-result/auth-sents/sent or /yodaodict/baike">
                                        <xsl:if test="count(/yodaodict/basic/authoritative-dict) &gt; 1">
                                            <div class="split group_1" style="display: block;"></div>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>

                                <xsl:if test="yodaodict/basic/collins-dict">
                                        <li class="sub1_all">
                                            <a class="lable" href="#collins" hidefocus="true" title="柯林斯高级英汉双解词典" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  'collins'); ">柯林斯</a>
                                        </li>
                                    </xsl:if>
                                    <xsl:if test="/yodaodict/basic/authoritative-dict">
                                        <xsl:if test="/yodaodict/basic/authoritative-dict/source/name[text()='新汉英大辞典']">
                                            <li class="sub1_all">
                                                <a class="lable" href="#powertranstab" hidefocus="true" title="新汉英大辞典" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '21'); ">新汉英</a>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="/yodaodict/basic/authoritative-dict/source/name[text()='21世纪大英汉词典']">
                                            <li class="sub1_all">
                                                <a class="lable" href="#powertranstab" hidefocus="true" title="21世纪大英汉词典" onclick="ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  '21'); ">21世纪</a>
                                            </li>
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:for-each select="yodaodict/local-dicts/dict">
                                        <li class="sub1_all">
                                            <xsl:element name="a">
                                                <xsl:attribute name="class">lable</xsl:attribute>
                                                <xsl:attribute name="href">#ecTrans_local<xsl:number value="position()"/></xsl:attribute>
                                                <xsl:attribute name="hidefocus">true</xsl:attribute>
                                                <xsl:attribute name="title"><xsl:value-of select="name"/></xsl:attribute>
                                                <xsl:attribute name="onclick">ctlog('', '' , 0, 'deskdict.main.navigator' , 1, 'CLICK',  'custom');</xsl:attribute>
                                                <xsl:value-of select="name"/>
                                            </xsl:element>
                                        </li>
                                </xsl:for-each>
							</ul>
						</div>
						<a href="javascript:void(0);" class="control" id="nav-control" hidefocus="true"/>
					</div>
					<div id="results-content">
						<xsl:call-template name="ead_block">
							<xsl:with-param name="ead_id">ead_dictr_top</xsl:with-param>
							<xsl:with-param name="style">ead_line_top</xsl:with-param>
						</xsl:call-template>
						<div id="zoomFont">
							<div id="queryword" style="display:none">
								<xsl:value-of select="/yodaodict/input"/>
							</div>
							<div id="lang" style="display:none">
								<xsl:value-of select="/yodaodict/lang"/>
							</div>
							<!-- UCG -->
							<xsl:if test="not(yodaodict/basic)">
								<xsl:if test="not(yodaodict/yodao-web-dict/web-translation)">
									<div id="transDevotion" class="trans-wrapper showDevotion">
										<div id="ugcReportButton">
											<p class="devotionTip">
												<span class="sp wordTrans contributeBtn"/>
												<a href="javascript:void(0);" class="tipDevotion contributeBtn">如果你找到了答案，请贡献本词条释义，利人利己</a>
											</p>
										</div>
										<div id="ugcContentEdit">
											<h3 class="devotionTip">
												<span class="tab-current">
													<span>释义贡献</span>
												</span>
												<div class="tail"/>
												<a class="toggle toggleOpen" rel="#transformToggleUgc"/>
											</h3>
											<div id="transformToggleUgc" class="trans-container devotionTip">
												<p id="ugcCotent"/>
												<p class="additional">
													<a href="javascript:void(0);" class="returnEdit">返回编辑</a>
												</p>
											</div>
										</div>
										<form class="trans-container edit">
											<p>
												<label for="currentWord">当前词条：</label>
												<strong id="currentWord"/>
											</p>
											<p>
												<label for="inputTrans" class="center">输入释义：<span class="required">*</span>
												</label>
												<textarea id="inputTrans" class="trans-content" name="inputTrans"/>
												<span class="error-message"/>
											</p>
											<p>
												<label for="source">来源参考：</label>
												<input type="text" id="source" name="source" class="trans-message"/>
											</p>
											<p>
												<label for="contact">联系方式：</label>
												<input type="text" id="contact" name="contact" class="trans-message"/>
											</p>
											<p class="submitTip">
												<a class="sp ensure" href="javascript:void(0);" title="确定"/>
												<a class="sp cancel" href="javascript:void(0)" title="取消"/>
											</p>
										</form>
									</div>
								</xsl:if>
							</xsl:if>
							<!-- 语种切换 typo -->
							<xsl:if test="/yodaodict/auto_switch_lang">
								<div class="error-wrapper">
									<div class="error-typo">
            您的查询在<xsl:call-template name="get_language_name">
											<xsl:with-param name="lang_type" select="/yodaodict/language"/>
										</xsl:call-template>下没有结果，以下为<strong>
											<xsl:call-template name="get_language_name">
												<xsl:with-param name="lang_type" select="/yodaodict/lang"/>
											</xsl:call-template>
										</strong>结果：
          </div>
								</div>
							</xsl:if>
							<!-- hanhan typo -->
							<xsl:if test="/yodaodict/typos/typo/hh">
								<xsl:if test="count(../../typo) &lt; 2">
									<div id="hanyuTip">
										<table border="0" height="20" width="100%">
											<tr>
												<td>
													<div class="f13" style="padding-top:3px; background-color:#f1f6fb;height:24px;margin-bottom:10px;">
                    您是不是要找"<strong>
															<xsl:value-of select="/yodaodict/input"/>
														</strong>"的
                    <xsl:element name="a">
															<xsl:attribute name="title">
                        点击查看“<xsl:value-of select="/yodaodict/input"/>”的汉语解释
                      </xsl:attribute>
															<xsl:attribute name="href">javascript:void(0)</xsl:attribute>
															<xsl:attribute name="onclick">javascript:gotoHanhan()</xsl:attribute>
                      汉语解释
                    </xsl:element>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</xsl:if>
							</xsl:if>
							<!--typo start-->
							<xsl:if test="not(/yodaodict/basic)">
								<xsl:if test="yodaodict/typos">
									<xsl:if test="not(/yodaodict/typos/typo/hh)">
										<div class="error-wrapper">
											<div class="error-typo">
                您是不是要找: 
                <xsl:for-each select="yodaodict/typos/typo">
													<p class="typo-rel">
														<xsl:element name="a">
															<xsl:attribute name="class">title</xsl:attribute>
															<xsl:attribute name="style">text-decoration:none</xsl:attribute>
															<xsl:attribute name="href">
                      <xsl:value-of select="./word"/></xsl:attribute>
															<xsl:attribute name="onclick">
                      ctlog(this, '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.noresult.typo' , 1, 'CLICK',  '点击typo');
                    </xsl:attribute>
															<xsl:attribute name="target">_self</xsl:attribute>
															<xsl:value-of select="./word"/>：
                  </xsl:element>
														<xsl:value-of select="./trans"/>
													</p>
												</xsl:for-each>
											</div>
										</div>
									</xsl:if>
								</xsl:if>
								<xsl:if test="yodaodict/thirdpart-result/fanyi-result">
									<div id="fanyiResult" class="trans-wrapper">
										<h3>
											<span class="tab-current">
												<span>翻译结果</span>
											</span>
											<div class="tail"/>
											<a class="toggle toggleOpen" rel="#fanyiformToggle"/>
										</h3>
										<div id="fanyiformToggle">
											<div class="trans-container">
												<p>
													<xsl:value-of select="yodaodict/thirdpart-result/fanyi-result/input"/>
												</p>
												<p>
													<xsl:value-of select="yodaodict/thirdpart-result/fanyi-result/tran"/>
												</p>
												<p class="additional">
                  长段文字建议使用<xsl:element name="a">
														<xsl:attribute name="onclick">
                      ctlog(this, '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.noresult.fanyi' , 1, 'CLICK',  '点击无结果翻译');
                    </xsl:attribute>
														<xsl:attribute name="style">text-decoration:none</xsl:attribute>
														<xsl:attribute name="href">
                      <xsl:value-of select="yodaodict/input" disable-output-escaping="yes"/></xsl:attribute>有道翻译</xsl:element>，翻译结果仅供参考
                </p>
											</div>
										</div>
									</div>
								</xsl:if>
							</xsl:if>
							<!-- 输出关键词、音标、发音小喇叭 -->
							<span id="yodao_anchor_basic" style="display:none;"/>
							<xsl:if test="(/yodaodict/basic/dict) or (/yodaodict/basic/simple-dict)">
								<div id="reportError" class="trans-container">
									<h4 class="tipBack">
										<span class="sp tipDo"/>
										<span class="tipDevotion">我要报错</span>
									</h4>
									<form>
										<ul class="optionsLeft">
											<li>
												<input type="checkbox" name="wordError" id="wordError" class="trans-message"/>
												<label id="wordErrorLabel" for="wordError">本词条拼写有误</label>
											</li>
											<li>
												<input type="checkbox" name="phoneticError" id="phoneticError" class="trans-message"/>
												<label id="phoneticErrorLabel" for="phoneticError">发音/音标有误</label>
											</li>
											<li>
												<input type="checkbox" name="others" id="others" class="trans-message"/>
												<label id="othersLabel" for="others">其他</label>
											</li>
										</ul>
										<ul class="optionsRight">
											<li>
												<input type="checkbox" name="transError" id="transError" class="trans-message"/>
												<label id="transErrorLabel" for="transError">释义有误</label>
											</li>
											<li>
												<input type="checkbox" name="sentencesError" id="sentencesError" class="trans-message"/>
												<label id="sentencesErrorLabel" for="sentencesError">例句有误</label>
											</li>
										</ul>
										<h5 class="clearFloat">错误描述</h5>
										<textarea id="inputRepoertError" class="trans-content"/>
										<span class="error-message"/>
										<p class="alignCenter">
											<a class="sp ensure" href="javascript:void(0);" title="确定"/>
											<a class="sp cancel" href="javascript:void(0)" title="取消"/>
										</p>
									</form>
								</div>
							</xsl:if>
							<div id="phrsListTab" class="trans-wrapper clearfix">
								<!-- 输出图片词典 -->
								<xsl:if test="(/yodaodict/basic/picdict-pics)">
									<div class="selected-container">
										<a class="selected_img sp" href="" hidefocus="true" id="selected_img">
											<xsl:element name="img">
												<!--第一幅为默认加载的-->
												<xsl:attribute name="src"><xsl:value-of select="/yodaodict/basic/picdict-pics/pic/url"/></xsl:attribute>
												<xsl:attribute name="alt"></xsl:attribute>
											</xsl:element>
											<div class="msg-toggle">
												点击更换图片
											</div>
										</a>
									</div>
									<div class="img-list" id="img-list">
										<div class="bg filter">
											<span class="top"></span>
											<div class="content"></div>
											<span class="bottom"></span>
										</div>
										<div class="img-content img-container">
											<span class="select-just">
												<span>点击选择您觉得符合这个词条的图片</span>
												<a class="close-img sp" href="javascript:void(0);">关闭</a>
											</span>
											<ul class="all-img">
												<xsl:for-each select="/yodaodict/basic/picdict-pics/pic">
													<xsl:choose>
														<xsl:when test="position()=1">
															<!--第一行有不同的样式-->
															<li class="selected">
																<a href="javascript:void(0);">
																	<span>
																		<xsl:element name="img">
																			<xsl:attribute name="src"><xsl:value-of select="./url"/></xsl:attribute>
																			<xsl:attribute name="alt"></xsl:attribute>
																			<xsl:attribute name="data-link"><xsl:value-of select="./host"/></xsl:attribute>
																			<xsl:attribute name="data-site"><xsl:value-of select="./image"/></xsl:attribute>
																		</xsl:element>
																	</span>
																</a>
															</li>
														</xsl:when>
														<xsl:otherwise>
															<li>
																<a href="javascript:void(0);">
																	<span>
																		<xsl:element name="img">
																			<xsl:attribute name="src"><xsl:value-of select="./url"/></xsl:attribute>
																			<xsl:attribute name="alt"></xsl:attribute>
																			<xsl:attribute name="data-link"><xsl:value-of select="./host"/></xsl:attribute>
                                                                            <xsl:attribute name="data-site"><xsl:value-of select="./image"/></xsl:attribute>
																		</xsl:element>
																	</span>
																</a>
															</li>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</ul>
											<div class="full-content" id="full-content">
												<xsl:element name="img">
													<xsl:attribute name="src"><xsl:value-of select="/yodaodict/basic/picdict-pics/pic/url"/></xsl:attribute>
													<xsl:attribute name="alt"></xsl:attribute>
												</xsl:element>
												<a class="source-link" href="javascript:void(0);" target="_blank">
													<xsl:value-of select="/yodaodict/basic/picdict-pics/pic/host"/>
												</a>
											</div>
										</div>
									</div>
								</xsl:if>
								<!--图片词典结束-->
								
								<xsl:if test="/yodaodict/basic/simple-dict">
									<xsl:choose>
										<xsl:when test="/yodaodict/basic/type[text()='ee'] or /yodaodict/basic/type[text()='ec']">
											<xsl:call-template name="keyword_top_line_pronounce">
												<xsl:with-param name="keyword" select="/yodaodict/basic/simple-dict/word/return-phrase"/>
												<xsl:with-param name="phone" select="/yodaodict/basic/simple-dict/word/phone"/>
												<xsl:with-param name="ukphone" select="/yodaodict/basic/simple-dict/word/ukphone"/>
												<xsl:with-param name="usphone" select="/yodaodict/basic/simple-dict/word/usphone"/>
												<xsl:with-param name="speech" select="/yodaodict/basic/simple-dict/word/speech"/>
												<xsl:with-param name="ukspeech" select="/yodaodict/basic/simple-dict/word/ukspeech"/>
												<xsl:with-param name="usspeech" select="/yodaodict/basic/simple-dict/word/usspeech"/>
												<xsl:with-param name="phonesup" select="/yodaodict/basic/simple-dict/word/phonesup"/>
												<xsl:with-param name="field" select="/yodaodict/basic/simple-dict/word/field"/>
												<xsl:with-param name="origin" select="/yodaodict/basic/simple-dict/word/origin"/>
												<xsl:with-param name="showadd2wordbook">true</xsl:with-param>
												<xsl:with-param name="showfeedback">true</xsl:with-param>
											</xsl:call-template>											
										</xsl:when>
										<xsl:otherwise>
												<xsl:call-template name="keyword_top_line">
												<xsl:with-param name="keyword" select="/yodaodict/basic/simple-dict/word/return-phrase"/>
												<xsl:with-param name="phone" select="/yodaodict/basic/simple-dict/word/phone"/>
												<xsl:with-param name="speech" select="/yodaodict/basic/simple-dict/word/speech"/>
												<xsl:with-param name="phonesup" select="/yodaodict/basic/simple-dict/word/phonesup"/>
												<xsl:with-param name="field" select="/yodaodict/basic/simple-dict/word/field"/>
												<xsl:with-param name="origin" select="/yodaodict/basic/simple-dict/word/origin"/>
												<xsl:with-param name="showadd2wordbook">true</xsl:with-param>
												<xsl:with-param name="showfeedback">true</xsl:with-param>
											</xsl:call-template>	
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="not(/yodaodict/basic/simple-dict) and not(/yodaodict/thirdpart-result)">
									 
										<xsl:if test="yodaodict/basic/dict">
											<xsl:call-template name="keyword_top_line">
												<xsl:with-param name="keyword" select="yodaodict/input"/>
												<xsl:with-param name="phone" select="/yodaodict/phone"/>
												<xsl:with-param name="phonesup" select="/yodaodict/phonesup"/>
												<xsl:with-param name="speech" select="/yodaodict/speech"/>
												<xsl:with-param name="field" select="/yodaodict/field"/>
												<xsl:with-param name="origin" select="/yodaodict/origin"/>
												<xsl:with-param name="showadd2wordbook">true</xsl:with-param>
												<xsl:with-param name="showfeedback">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="not(yodaodict/basic/dict)">
											<xsl:call-template name="keyword_top_line">
												<xsl:with-param name="keyword" select="yodaodict/input"/>
												<xsl:with-param name="phone" select="/yodaodict/phone"/>
												<xsl:with-param name="phonesup" select="/yodaodict/phonesup"/>
												<xsl:with-param name="speech" select="/yodaodict/speech"/>
												<xsl:with-param name="field" select="/yodaodict/field"/>
												<xsl:with-param name="origin" select="/yodaodict/origin"/>
												<xsl:with-param name="showadd2wordbook">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									 
								</xsl:if>
								<!--typo end-->
								<xsl:if test="/yodaodict/basic and /yodaodict/basic/type[text()!='ee']">
									<!-- 传统结果显示  如果存在则显示 -->
									<div id="transformToggle">
										<xsl:if test="/yodaodict/basic">
											<xsl:for-each select="/yodaodict/basic">
												<xsl:if test="type[text()!='ee']">
													<div id="simple_dict_trans" class="trans-container">
														<!-- 显示tab -->
														<!-- 输出简明词典 -->
														<xsl:apply-templates select="simple-dict"/>
														<xsl:apply-templates select="dict"/>
														<!-- 第一个层结束 -->
														<!-- 如果没有简明词典，则在这里直接输出权威词典 -->
														<xsl:if test="not(simple-dict) and not(dict)">
															<xsl:if test="authoritative-dict">
																<div class="trans-container">
																	<xsl:apply-templates select="authoritative-dict"/>
																</div>
															</xsl:if>
														</xsl:if>
														<xsl:if test="type[text() = 'ce']">
															<xsl:element name="a">
																<xsl:attribute name="style">text-decoration:none</xsl:attribute>
																<xsl:attribute name="href">
                          <xsl:value-of select="/yodaodict/input"/>?ljtype=blng&amp;ljblngcont=0
                        </xsl:attribute>
																<xsl:attribute name="onclick">
                          ctlog('', '' , 0, 'deskdict.main.ljcompare' , 1, 'CLICK',  '在例句中比较'); 
                        </xsl:attribute>
                        在例句中比较
                      </xsl:element>
														</xsl:if>
													</div>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</div>
								</xsl:if>
							</div>
							<xsl:call-template name="ead_block">
								<xsl:with-param name="ead_id">ead_dictr_1</xsl:with-param>
								<xsl:with-param name="style">ead_line</xsl:with-param>
							</xsl:call-template>
							<!-- 网络释义开始 -->
							<xsl:if test="yodaodict/yodao-web-dict/web-translation
                            or yodaodict/basic/special-dict
                            or yodaodict/hh
                            or yodaodict/basic/type[text() = 'ee']">
								<table id="yodao_anchor_phrase" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td height="0px" style="font-size:0"/>
									</tr>
								</table>
								<!-- 显示tab -->
								<div id="webTrans" class="trans-wrapper">
									<h3>
										<span class="tabs">
											<!-- 3个tabs-->
											<xsl:if test="yodaodict/yodao-web-dict/web-translation">
												<xsl:element name="a">
													<xsl:attribute name="rel">#tWebTrans</xsl:attribute>
													<xsl:attribute name="onclick"><xsl:variable name="danyinhao">'</xsl:variable><xsl:variable name="danyinhao2">ba</xsl:variable>
                    javascript:ctlog(this, '', 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'TAB网络释义')
                  </xsl:attribute>
													<span>网络释义</span>
												</xsl:element>
											</xsl:if>
											<xsl:if test="/yodaodict/hh">
												<a rel="#chineseDict">
													<xsl:attribute name="onclick">
                ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换汉语词典');
                </xsl:attribute>
													<span>汉语词典</span>
												</a>
											</xsl:if>
											<xsl:for-each select="/yodaodict/basic">
												<xsl:if test="type[text() = 'special']">
													<xsl:element name="a">
														<xsl:attribute name="rel">#tPETrans</xsl:attribute>
														<xsl:attribute name="onclick">
                      javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'TAB专业释义')
                    </xsl:attribute>
														<span>专业释义</span>
													</xsl:element>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/yodaodict/basic">
												<xsl:if test="type[text() = 'ee']">
													<xsl:element name="a">
														<xsl:attribute name="rel">#tEETrans</xsl:attribute>
														<xsl:attribute name="onclick">
                      javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'TAB英英释义')
                    </xsl:attribute>
														<span>英英释义</span>
													</xsl:element>
												</xsl:if>
											</xsl:for-each>
										</span>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#webtransformToggle"/>
									</h3>
									<div id="webtransformToggle">
										<!-- 网络释义tab开始-->
										<xsl:if test="yodaodict/yodao-web-dict/web-translation">
											<div id="tWebTrans" class="trans-container tab-content">
												<xsl:for-each select="yodaodict/yodao-web-dict/web-translation">
													<!-- 输出第一个网络释义 -->
													<xsl:if test="position() = 1">
														<xsl:if test="./@same">
															<xsl:call-template name="web-translation-first">
																<xsl:with-param name="query-word" select="string(/yodaodict/input)"/>
																<xsl:with-param name="node" select="."/>
															</xsl:call-template>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												<div id="webPhrase" class="pr-container more-collapse">
													<xsl:if test="count(yodaodict/yodao-web-dict/web-translation) &gt; 1 or (count(yodaodict/yodao-web-dict/web-translation) = 1 and not(yodaodict/yodao-web-dict/web-translation/@same))">
														<h4>短语</h4>
													</xsl:if>
													<xsl:for-each select="yodaodict/yodao-web-dict/web-translation">
														<!-- 输出第二个以后的网络释义-->
														<xsl:if test="position() &gt; 1 or (position() =1 and not(./@same))">
															<xsl:choose>
																<xsl:when test="position() &lt; 5">
																	<p class="wordGroup">
																		<span class="contentTitle">
																			<xsl:element name="a">
																				<xsl:attribute name="href">
                                  <xsl:value-of select="./key"/></xsl:attribute>
																				<xsl:attribute name="target">_self</xsl:attribute>
																				<xsl:value-of select="./key"/>
																			</xsl:element>
																		</span>
																		<xsl:for-each select="./trans">
																			<xsl:if test="./cls">
																				<font color="#959595">
																					<xsl:for-each select="./cls/cl">[<xsl:value-of select="."/>]</xsl:for-each>
																				</font>&#160;
							</xsl:if>
																			<xsl:value-of select="./value"/>
																			<xsl:if test="not(position() = count(../trans))">；</xsl:if>
																		</xsl:for-each>
																	</p>
																</xsl:when>
																<xsl:otherwise>
																	<p class="wordGroup collapse">
																		<span class="contentTitle">
																			<xsl:element name="a">
																				<xsl:attribute name="href">
                                  <xsl:value-of select="./key"/></xsl:attribute>
																				<xsl:attribute name="target">_self</xsl:attribute>
																				<xsl:value-of select="./key"/>
																			</xsl:element>
																		</span>
																		<xsl:for-each select="./trans">
																			<xsl:value-of select="./value"/>
																			<xsl:if test="not(position() = count(../trans))">；</xsl:if>
																		</xsl:for-each>
																	</p>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:if>
													</xsl:for-each>
													<xsl:if test="count(yodaodict/yodao-web-dict/web-translation) &gt; 5">
														<div class="more">
															<a href="javascript:void(0);" class="sp more_sp">
                        &#160;
                      </a>
															<span class="show_more">更多</span>
															<span class="show_less">收起</span>网络短语
                    </div>
													</xsl:if>
												</div>
											</div>
										</xsl:if>
										<!-- 网络释义tab结束-->
										<xsl:if test="yodaodict/hh">
											<!-- 显示Tab标签 -->
											<div id="chineseDict" class="trans-container tab-content">
												<xsl:apply-templates select="/yodaodict/hh"/>
											</div>
										</xsl:if>

                    <!-- 专业释义tab开始-->
										<xsl:for-each select="/yodaodict/basic">
											<xsl:if test="type[text() = 'special']">
												<xsl:apply-templates select="special-dict"/>
											</xsl:if>
										</xsl:for-each>
                    <!-- 专业释义tab结束-->
                    
										<!-- 英英释义tab开始 -->
										<xsl:for-each select="/yodaodict/basic">
											<xsl:if test="type[text() = 'ee']">
												<div id="tEETrans" class="trans-container tab-content">
													<xsl:apply-templates select="authoritative-dict"/>
													<xsl:apply-templates select="authoritative-dict/source">
														<xsl:with-param name="dict_type">
															<xsl:value-of select="type"/>
														</xsl:with-param>
													</xsl:apply-templates>
												</div>
											</xsl:if>
										</xsl:for-each>
										<!-- 英英释义tab结束 -->
									</div>
									<!-- webtrans ads -->
								</div>
							</xsl:if>
							<!-- 网络释义的结束 -->

							<xsl:call-template name="ead_block">
								<xsl:with-param name="ead_id">ead_dictr_2</xsl:with-param>
								<xsl:with-param name="style">ead_line</xsl:with-param>
							</xsl:call-template>

							<xsl:if test="/yodaodict/basic/eng-phrs-dict/phrs/phr or /yodaodict/basic/eng-syno-dict/synos/syno">
								<div id="phrsSynoTab" class="trans-wrapper">
									<h3>
										<span class="tabs">
											<xsl:if test="/yodaodict/basic/eng-phrs-dict/phrs/phr">
												<a rel="#phrsList">
													<xsl:attribute name="onclick">
                  ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换词组短语');
                </xsl:attribute>
													<span> 词组短语</span>
												</a>
											</xsl:if>
											<xsl:if test="/yodaodict/basic/eng-syno-dict/synos/syno">
												<a rel="#synoTab">
													<xsl:attribute name="onclick">
                  ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换同近义词');
              </xsl:attribute>
													<span> 同近义词</span>
												</a>
											</xsl:if>
											<xsl:if test="/yodaodict/basic/rel-word-dict/word">
												<a rel="#relWordTab">
													<xsl:attribute name="onclick">
                  ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换同根词');
              </xsl:attribute>
													<span> 同根词</span>
												</a>
											</xsl:if>
										</span>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#transformToggle1"/>
									</h3>
									<div id="transformToggle1">
										<xsl:for-each select="/yodaodict/basic">
											<xsl:if test="name[text()='词组短语']">
												<div id="phrsList" class="trans-container tab-content">
													<xsl:if test="eng-phrs-dict">
														<xsl:call-template name="phrs">
															<xsl:with-param name="phr_data" select="/yodaodict/basic/eng-phrs-dict/phrs"/>
														</xsl:call-template>
													</xsl:if>
												</div>
											</xsl:if>
											<xsl:if test="name[text()='同近义词']">
												<div id="synoTab" class="trans-container tab-content">
													<xsl:if test="eng-syno-dict">
														<xsl:for-each select="/yodaodict/basic/eng-syno-dict/synos/syno">
															<p class="wordGroup">
																<xsl:value-of select="pos"/>
																<xsl:value-of select="tran"/>
																<br/>
																<xsl:for-each select="ws/w">
																	<span class="contentTitle">
																		<xsl:element name="a">
																			<xsl:attribute name="onclick">
                                  ctlog('', '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.jinyici' , 1, 'CLICK',  '点击同近义词');
                                </xsl:attribute>
																			<xsl:attribute name="href">
                                  <xsl:value-of select="."/></xsl:attribute>
																			<xsl:attribute name="target">_self</xsl:attribute>
																			<xsl:value-of select="."/>
																		</xsl:element>
																		<xsl:if test="not(position() = count(../w))">, </xsl:if>
																	</span>
																</xsl:for-each>
															</p>
														</xsl:for-each>
													</xsl:if>
												</div>
											</xsl:if>
											<xsl:if test="type[text()='rel-word']">
												<div id="relWordTab" class="trans-container tab-content">
													<p class="wordGroup">词根：<span class="contentTitle">
															<xsl:element name="a">
																			<xsl:attribute name="onclick">
                                  ctlog('', '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.tonggenci' , 1, 'CLICK',  '点击同根词');
                                </xsl:attribute>
																<xsl:attribute name="href">
                         <xsl:value-of select="rel-word-dict/stem"/></xsl:attribute>
																<xsl:value-of select="rel-word-dict/stem"/>
															</xsl:element>
														</span>
													</p>
													<xsl:for-each select="rel-word-dict/rels/rel">
														<xsl:value-of select="pos"/>
														<xsl:for-each select="words/word">
															<p class="wordGroup">
																<span class="contentTitle">
																	<xsl:element name="a">
																			<xsl:attribute name="onclick">
                                  ctlog('', '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.tonggenci' , 1, 'CLICK',  '点击同根词');
                                </xsl:attribute>
																		<xsl:attribute name="href">
                                                            <xsl:value-of select="."/></xsl:attribute>
																		<xsl:value-of select="."/>
																	</xsl:element>
																</span>
																<xsl:if test="following-sibling::*[1][name()='tran']">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:value-of select="following-sibling::*[1]"/>
																</xsl:if>
															</p>
														</xsl:for-each>
													</xsl:for-each>
												</div>
											</xsl:if>
										</xsl:for-each>
									</div>
								</div>
							</xsl:if>
							
							<!-- 例句开始 -->
							<table id="yodao_anchor_sentence" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td height="1px" style="font-size:0"/>
								</tr>
							</table>
							<xsl:if test="yodaodict/sentences-result/example-sentences/sentence-pair or
					yodaodict/sentences-result/media-sents/sent or
					yodaodict/sentences-result/auth-sents/sent">
								<xsl:apply-templates select="yodaodict/sentences-result">
									<xsl:with-param name="keyfrom">main.sentence</xsl:with-param>
									<xsl:with-param name="input" select="yodaodict/input"/>
									<xsl:with-param name="inputEncode" select="yodaodict/inputEncode"/>
								</xsl:apply-templates>
							</xsl:if>
							<!-- 例句结束 -->
							<xsl:if test="yodaodict/thirdpart-result/websearch-result">
								<div id="wsResult" class="trans-wrapper">
									<h3>
										<span class="tab-current">
											<span>网页搜索</span>
										</span>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#webSearchResults"/>
									</h3>
									<div id="webSearchResults" class="trans-container">
										<xsl:for-each select="yodaodict/thirdpart-result/websearch-result/hit">
											<div class="search_result">
												<h4 class="sresult_title">
													<xsl:element name="a">
														<xsl:attribute name="title"><xsl:value-of select="./url"/></xsl:attribute>
														<xsl:attribute name="href"><xsl:value-of select="./url"/></xsl:attribute>
														<xsl:attribute name="onclick">
                        ctlog(this, '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.noresult.search' , 1, 'CLICK',  '点击搜索结果');
                      </xsl:attribute>
														<xsl:value-of select="./title" disable-output-escaping="yes"/>
													</xsl:element>
												</h4>
												<p class="sresult_content">
													<xsl:value-of select="./summary" disable-output-escaping="yes"/>
												</p>
												<xsl:element name="a">
													<xsl:attribute name="href"><xsl:value-of select="./url"/></xsl:attribute>
													<xsl:attribute name="class">sresult_link</xsl:attribute>
													<xsl:value-of select="./url"/>
												</xsl:element>
											</div>
										</xsl:for-each>
										<xsl:element name="a">
											<xsl:attribute name="href">
                  http://www.youdao.com/search?keyfrom=<xsl:value-of select="yodaodict/keyfrom"/>.noresult&amp;q=<xsl:value-of select="yodaodict/input" disable-output-escaping="yes"/>%20英文&amp;ue=utf8
                </xsl:attribute>
											<xsl:attribute name="onclick">
                  ctlog(this, '<xsl:call-template name="standard_return_phrase"/>' , 0, 'deskdict.main.noresult.moresearch' , 1, 'CLICK',  '点击更多搜索结果');
                </xsl:attribute>
											<xsl:attribute name="target">_blank</xsl:attribute>
										</xsl:element>
									</div>
								</div>
							</xsl:if>
							<!-- 汉语开始 -->
							<!-- 汉语结束 -->
							<!-- 百科开始 -->
							<table id="yodao_anchor_wiki" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td height="1px" style="font-size:0"/>
								</tr>
							</table>
							<xsl:if test="/yodaodict/baike">
								<!--<table id="yodao_anchor_wiki" cellpadding="0" cellspacing="0" border="0"><tr><td height="1px" style="font-size:0"></td></tr></table>-->
								<div id="eBaike" class="trans-wrapper">
									<h3>
										<span class="tab-current">
											<span>百科</span>
										</span>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#baikeTab"/>
									</h3>
									<div id="baikeTab">
										<div class="trans-container">
											<div id="baike">
												<xsl:for-each select="yodaodict/baike/item">
													<xsl:call-template name="baike_item">
														<xsl:with-param name="key" select="key"/>
														<xsl:with-param name="summary" select="summary"/>
														<xsl:with-param name="image" select="image"/>
														<xsl:with-param name="show_external">true</xsl:with-param>
														<xsl:with-param name="show_more">true</xsl:with-param>
														<xsl:with-param name="ctype_title">wiki_summary_title_deskdict</xsl:with-param>
														<xsl:with-param name="ctype_external">wiki_summary_external_deskdict</xsl:with-param>
													</xsl:call-template>
												</xsl:for-each>
											</div>
										</div>
									</div>
								</div>
								<xsl:call-template name="ead_block">
									<xsl:with-param name="ead_id">ead_dictr_4</xsl:with-param>
									<xsl:with-param name="style">ead_line</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<!-- 百科结束 -->
							<!-- collins -->
							<xsl:if test="yodaodict/basic/collins-dict">
								<div id="collins" class="trans-wrapper collins">
									<h3>
										<span class="tab-current">
											<span>柯林斯高级英汉双解词典</span>
										</span>
										<a href="http://cidian.youdao.com/collinshelp.html" _target= "blank" class="need-help sp" title="柯林斯词典使用说明"></a>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#collinsResult"/>
									</h3>
									<div id="collinsResult">
										<div id="" class="pr-container">
											<xsl:for-each select="/yodaodict/basic/collins-dict/super-headwords/super-headword">
												<p class="additional">
												    <xsl:value-of select="position()" />.
                                                    <xsl:element name="a">
                                                        <xsl:attribute name="href">#CNAME<xsl:value-of select="position()" /></xsl:attribute>
                                                        <xsl:attribute name="rel">#NAME<xsl:value-of select="position()" /></xsl:attribute>
                                                        <xsl:attribute name="target">_self</xsl:attribute>
                                                        <xsl:attribute name="onclick">ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'collinsheadword');</xsl:attribute>
                                                         <xsl:value-of select="." />
                                                    </xsl:element>
												</p>
											</xsl:for-each>
										</div>
                                        <div class="collinsToggle trans-container" id="collinsToggle">
                                        <xsl:for-each select="/yodaodict/basic/collins-dict/collins-entries">
										
										 
										<xsl:element name="div">
										<xsl:if test="position() =1"><xsl:attribute name="class">wt-container</xsl:attribute></xsl:if>
										<xsl:if test="position() >1"><xsl:attribute name="class">wt-container  wt-collapse</xsl:attribute></xsl:if>
												 
										<xsl:if test="./super-headword">
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">title trans-tip</xsl:attribute>
                                                <xsl:attribute name="id">CNAME<xsl:value-of select="position()" /></xsl:attribute>
                                                <xsl:element name="a">
                                                    <xsl:attribute name="href">#</xsl:attribute>
                                                    <xsl:attribute name="target">_self</xsl:attribute>
                                                    <xsl:attribute name="style">cursor: pointer;</xsl:attribute>
                                                    <xsl:attribute name="class">sp do-detail</xsl:attribute>
                                                    <xsl:attribute name="rel">#NAME<xsl:value-of select="position()"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="onclick">ctlog('', '' , 0, 'deskdict.main' , 1,
                                                        'CLICK', 'collinsdetail');
                                                    </xsl:attribute>
                                                </xsl:element>
                                                <span>
                                                    <xsl:value-of select="./super-headword"/>
                                                </span>
                                            </xsl:element>
										</xsl:if>
											    <xsl:element name="div">
											    <xsl:attribute name="class">collapse-content trans-content</xsl:attribute>
												<xsl:attribute name="id">NAME<xsl:value-of select="position()" /></xsl:attribute>
												<h4>
															<span class="title">
																<xsl:value-of select="./headword"/>
															</span>
															<xsl:if test="./phonetic"><em class="spell collins-phonetic">/<xsl:value-of select="./phonetic" disable-output-escaping="yes"/>/</em></xsl:if>
															<xsl:if test="./hwas"><em class="spell"><xsl:value-of select="./hwas"/></em></xsl:if>
															<xsl:if test="./basic-entries/basic-entry/wordforms"><em class="spell additional">(
															<xsl:for-each select="./basic-entries/basic-entry/wordforms/wordform">
																<xsl:value-of select="./word"/> <xsl:if test="./phonetic"> /<xsl:value-of select="./phonetic"/>/</xsl:if>
																<xsl:if test="not(position() = count(../wordform))">, </xsl:if>
															</xsl:for-each>
															)</em></xsl:if>
															
															<span class="spell"><xsl:value-of select="./basic-entries/basic-entry/cet" /></span>
															
														</h4>
														 
															<xsl:if test="./basic-entries/basic-entry/box-ls">
															<xsl:for-each select="./basic-entries/basic-entry/box-ls/box-l">
															<div class="spell additional" style="border:1px solid #cdcdcd; padding: 3px 3px 3px 3px"><xsl:value-of select="." disable-output-escaping="yes" /></div>
															
															</xsl:for-each>
															</xsl:if>
															
															<xsl:if test="./basic-entries/basic-entry/ref-ref">
															<div class="spell additional"><xsl:value-of select="./basic-entries/basic-entry/ref-ref" disable-output-escaping="yes" /></div>
															</xsl:if>
														<!-- <p class="additional">形容词读作/zhōng guó/</p> -->
													<xsl:for-each select="./basic-entries/basic-entry">
														<xsl:if test="./tran" >
														<p><xsl:value-of select="./headword"/> 
															
															 
															<xsl:element name="span">
															<xsl:attribute name="class">spell additional</xsl:attribute>
															<xsl:attribute name="title"><xsl:value-of select="./pos-entry/pos-tips"/></xsl:attribute>
															<xsl:value-of select="./pos-entry/pos"/>
															</xsl:element>
															 
															
															<span class="trans"> <xsl:value-of select="./tran" disable-output-escaping="yes"/>
															<xsl:if test="./registr">
															<span class="spell additional">[<xsl:value-of select="./registr" disable-output-escaping="yes"/>]</span>
															</xsl:if>
															
															<xsl:if test="./prof">
															<span class="spell additional">[<xsl:value-of select="./prof" disable-output-escaping="yes"/>]</span>
															</xsl:if>
															
															</span>
																<xsl:if test="./loc"><span class="via">[<xsl:value-of select="./loc"/>]</span></xsl:if>
																<xsl:if test="./trademark"><span class="via">[<xsl:value-of select="./trademark"/>]</span></xsl:if>
															</p>
															<xsl:if test="./seeAlsos" >
																 
																See Also: 
																<xsl:for-each select="./seeword">
																
																<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
																			<xsl:attribute name="target">_self</xsl:attribute>
																			<xsl:attribute name="style">cursor: pointer;</xsl:attribute>
																			<xsl:attribute name="class">sp do-detail</xsl:attribute>
																			<xsl:value-of select="."/>
																</xsl:element>
																
																</xsl:for-each>
																
																 
															</xsl:if>
															
															</xsl:if>	
															<xsl:if test="./sees" >
																 
																See:
																<xsl:for-each select="./sees/seeword">
																
																<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
																			<xsl:attribute name="target">_self</xsl:attribute>
																			<xsl:attribute name="style">cursor: pointer;</xsl:attribute>
																			<xsl:value-of select="."/>
																</xsl:element>
																
																</xsl:for-each>
																
																 
															</xsl:if>	
														<div class="additional">
																<xsl:for-each select="./exam-sents/sent">
																	<p><span>例：</span><xsl:value-of select="./eng-sent" disable-output-escaping="yes"/></p>
																	<p class="example-trans"><xsl:value-of select="./chn-sent" disable-output-escaping="yes"/></p>
																</xsl:for-each>
														</div>	
														<xsl:if test="./box-comms">
														<div class="additional" style="border:1px solid #cdcdcd; padding: 3px 3px 3px 3px" >
																 <p ><span><xsl:value-of select="./box-comms/box-com" disable-output-escaping="yes"/></span></p>
														</div>
														</xsl:if> 
													</xsl:for-each>
													<ul>
														<xsl:for-each select="./entries/entry">
														
														<xsl:if test="./tran-entry ">
														<li> 
															<xsl:variable name="pos"><xsl:value-of select="position()" /></xsl:variable>
															<xsl:for-each select="./tran-entry">
															<xsl:if test="./tran or ./headword">
															<p><xsl:if test="position() = 1"><xsl:value-of select="$pos" />. </xsl:if><xsl:value-of select="./headword" disable-output-escaping="yes"/> 
															<xsl:element name="span">
															<xsl:attribute name="class">spell additional</xsl:attribute>
															<xsl:attribute name="title"><xsl:value-of select="./pos-entry/pos-tips"/></xsl:attribute>
															<xsl:value-of select="./pos-entry/pos"/>
															</xsl:element>
															
															<span class="trans"> <xsl:value-of select="./tran" disable-output-escaping="yes"/>
															<xsl:if test="./registr">
															<span class="spell additional">[<xsl:value-of select="./registr" disable-output-escaping="yes"/>]</span>
															</xsl:if>
															<xsl:if test="./prof">
															<span class="spell additional">[<xsl:value-of select="./prof" disable-output-escaping="yes"/>]</span>
															</xsl:if>
															</span>  
																<xsl:if test="./gram"><span class="trans"> [<xsl:value-of select="./gram"/>]</span></xsl:if>
															</p>
															</xsl:if>
															<xsl:if test="./sees" >
																 
																See:
																<xsl:for-each select="./sees/seeword">
																
																<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
																			<xsl:attribute name="target">_self</xsl:attribute>
																			<xsl:attribute name="style">cursor: pointer;</xsl:attribute>
																			<xsl:value-of select="."/>
																</xsl:element>
																
																</xsl:for-each>
																
																 
															</xsl:if>	
															<xsl:if test="./seeAlsos" >
																<p><span><xsl:if test="not(./headword)" ><xsl:value-of select="$pos" />.</xsl:if>  See Also:  
																<xsl:for-each select="./seeAlsos/seeword">
																
																<xsl:element name="a">
																			<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
																			<xsl:attribute name="target">_self</xsl:attribute>
																			<xsl:value-of select="."/><xsl:if test="not(position() = count(../seeword))">, </xsl:if>
																</xsl:element>
																
																</xsl:for-each>
																 </span>
																</p> 
															</xsl:if>
															
															
															<div class="additional" >
																<xsl:for-each select="./exam-sents/sent">
																	<p><span>例：</span><xsl:value-of select="./eng-sent" disable-output-escaping="yes"/></p>
																	<p class="example-trans"><xsl:value-of select="./chn-sent" disable-output-escaping="yes"/></p>
																</xsl:for-each>
															</div>
															<xsl:if test="./box-comms">
															<div class="additional" style="border:1px solid #cdcdcd; padding: 3px 3px 3px 3px" >
																	 <p ><span><xsl:value-of select="./box-comms/box-com" disable-output-escaping="yes"/></span></p>
															</div>
															</xsl:if>
															<xsl:if test="./box-ls">
															<xsl:for-each select="./box-ls/box-l">
															<div class="spell additional" style="border:1px solid #cdcdcd; padding: 3px 3px 3px 3px"><xsl:value-of select="." disable-output-escaping="yes" /></div>
															
															</xsl:for-each>
															</xsl:if>
															</xsl:for-each>
															
														</li>
														</xsl:if>
														
														</xsl:for-each>
														
													</ul>
												</xsl:element>
										</xsl:element>
										<xsl:if test="./phrases">
										<p class="additional">相关词组：
											<xsl:for-each select="./phrases/phrase">
												 
												
												<xsl:element name="a">
																				<xsl:attribute name="href">
														  <xsl:value-of select="."/></xsl:attribute>
																				<xsl:attribute name="target">_self</xsl:attribute>
																				<xsl:value-of select="."/><xsl:if test="not(position() = count(../phrase))">, </xsl:if>
																			</xsl:element>
										</xsl:for-each>
										</p>
										</xsl:if>
										</xsl:for-each>
										
                                        </div>
                                    </div>
								</div>
							</xsl:if>
							
							<!-- collins结束 -->
							
							<xsl:if test="/yodaodict/basic/authoritative-dict">
							<xsl:if test="/yodaodict/basic/authoritative-dict/source/name[text()='21世纪大英汉词典'] or  /yodaodict/basic/authoritative-dict/source/name[text()='新汉英大辞典']" >
								<div class="trans-wrapper">
									<h3>
										<span class="tabs" id="powertranstab">
											<!-- 3个tabs-->
											<xsl:for-each select="/yodaodict/basic">
												<xsl:if test="type[text()!='ee']">
													 
														<xsl:if test="authoritative-dict">
															<xsl:element name="a">
																<xsl:attribute name="class">tab-current</xsl:attribute>
																<xsl:attribute name="rel">#authDictTrans</xsl:attribute>
																<xsl:attribute name="onclick">
                          javascript:ctlog(this, "", 0, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', "TAB<xsl:value-of select="authoritative-dict/source/name"/>")
                        </xsl:attribute>
																<span>
																	<xsl:value-of select="authoritative-dict/source/name"/>
																</span>
															</xsl:element>
														</xsl:if>
													 
													</xsl:if>
											</xsl:for-each>
										</span>
										<div class="tail"/>
										<a class="toggle toggleOpen" rel="#authDictToggle"/>
									</h3>
									<div id="authDictToggle">
										<div id="authDictTrans" class="trans-container">
											<xsl:for-each select="/yodaodict/basic">
												<xsl:if test="type[text()!='ee']">
                                                    <xsl:if test="authoritative-dict">
                                                        <xsl:apply-templates select="authoritative-dict"/>
                                                    </xsl:if>
												</xsl:if>
											</xsl:for-each>
										</div>
									</div>
								</div>
								</xsl:if>
							</xsl:if>
							<!-- 本地词典结果开始,有结果才显示这个模块 -->
							<xsl:if test="(yodaodict/local-dicts/dict/word[text() != '']) 
        or (yodaodict/local-dicts/dict/sentences-result/example-sentences/sentence-pair) 
        or (yodaodict/local-dicts/dict/authoritative-dict/word/trs)">
								<!--xsl:if test="name = '基本释义'">
            <h2>
              <xsl:call-template name="keyword_top_line">
                <xsl:with-param name="keyword" select="/yodaodict/input"/>
                <xsl:with-param name="phone" select="/yodaodict/phone"/>
                <xsl:with-param name="phonesup" select="/yodaodict/phonesup"/>
                <xsl:with-param name="speech" select="/yodaodict/speech"/>
                <xsl:with-param name="field" select="/yodaodict/field"/>
                <xsl:with-param name="origin" select="/yodaodict/origin"/>
                <xsl:with-param name="showadd2wordbook">true</xsl:with-param>
              </xsl:call-template>
            </h2>
          </xsl:if-->
								<!--xsl:if test="yodaodict/dictfrom='local'"-->
								<!-- show tab -->
								<xsl:for-each select="yodaodict/local-dicts/dict">
									<!-- disable none result display-->
									<xsl:if test="(word[text()!=''])">
										<table cellpadding="0" cellspacing="0" border="0">
											<xsl:attribute name="id">yodao_anchor_custom<xsl:number value="position()"/></xsl:attribute>
											<tr>
												<td height="1px" style="font-size:0"/>
											</tr>
										</table>
										<xsl:element name="div">
											<xsl:attribute name="id">ecTrans_local<xsl:number value="position()"/></xsl:attribute>
											<xsl:attribute name="class">trans-wrapper dontRemember</xsl:attribute>
											<!--循环显示每部字典的内容-->
											<h3>
												<xsl:choose>
													<xsl:when test="name = '基本释义'">
														<span class="tabs">
															<a>
																<xsl:attribute name="rel">#simple_dict_trans_local<xsl:number value="position()"/></xsl:attribute>
																<xsl:attribute name="onclick">
                            ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换基本释义');
                          </xsl:attribute>
																<span>
																	<xsl:value-of select="name"/>
																</span>
															</a>
															<xsl:if test="name = '基本释义' and phrs/phr">
																<a rel="#phrsList_local">
																	<xsl:attribute name="onclick">
                              ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换词组短语');
                            </xsl:attribute>
																	<span>词组短语</span>
																</a>
															</xsl:if>
														</span>
													</xsl:when>
													<xsl:otherwise>
														<span class="tabs">
															<a>
																<xsl:attribute name="rel">#simple_dict_trans_local<xsl:number value="position()"/></xsl:attribute>
																<xsl:attribute name="onclick">
                            ctlog('', '' , 0, 'deskdict.main' , 1, 'CLICK',  'tab切换基本释义');
                          </xsl:attribute>
																<span>
																	<xsl:value-of select="name"/>
																</span>
															</a>
														</span>
													</xsl:otherwise>
												</xsl:choose>
												<div class="tail"/>
												<a class="toggle toggleOpen">
													<xsl:attribute name="rel">#transformToggle_local<xsl:number value="position()"/></xsl:attribute>
												</a>
											</h3>
											<div>
												<xsl:attribute name="id">transformToggle_local<xsl:number value="position()"/></xsl:attribute>
												<!-- display the awful explain :( -->
												<div class="trans-container tab-content">
													<xsl:attribute name="id">simple_dict_trans_local<xsl:number value="position()"/></xsl:attribute>
													<xsl:for-each select="explains/explain">
														<xsl:if test="attr">
															<div class="attr">
																<xsl:value-of select="attr"/>
															</div>
														</xsl:if>
														<xsl:for-each select="sub_explain">
															<xsl:if test="meaning[text()!='']">
																<!--xsl:value-of select="position()"/-->
																<div class="meaning">
																	<p>
																		<xsl:value-of select="meaning"/>
																	</p>
																</div>
															</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
													<!-- 输出单词变形-->
													<xsl:if test="transforms/transform">
														<p class="additional">
                        [
                        <xsl:for-each select="transforms/transform">
																<xsl:value-of select="type"/>
																<xsl:value-of select="word"/> &#000032;
                        </xsl:for-each> ]

                      </p>
													</xsl:if>
													<!--display raw date,maybe should be hid -->
													<div class="raw">
														<xsl:value-of select="raw" disable-output-escaping="yes"/>
													</div>
												</div>
												<!--<div id = "simple_dict_trans">-->
												<xsl:if test="phrs/phr">
													<div id="phrsList_local" class="trans-container tab-content">
														<xsl:call-template name="local-phrs">
															<xsl:with-param name="phr_data" select="/yodaodict/local-dicts/dict/phrs"/>
														</xsl:call-template>
													</div>
												</xsl:if>
											</div>
										</xsl:element>
									</xsl:if>
									<!-- 显示本地权威词典 2009年新增-->
									<xsl:if test="authoritative-dict">
										<div id="ecTrans_local_auth" class="trans-wrapper">
											<h3>
												<span style="display:none;">
													<xsl:attribute name="id">yodao_anchor_localauth</xsl:attribute>
												</span>
												<span class="tab-current">
													<span>
														<xsl:value-of select="authoritative-dict/source/name"/>
													</span>
												</span>
												<div class="tail"/>
												<a class="toggle toggleOpen" rel="#authTrans"/>
											</h3>
											<div id="authTrans" class="trans-container">
												<!-- 输出权威词典 -->
												<xsl:apply-templates select="authoritative-dict"/>
											</div>
										</div>
									</xsl:if>
									<!-- 本地例句展示-->
									<table id="yodao_anchor_localsen" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td height="1px" style="font-size:0"/>
										</tr>
									</table>
									<!--xsl:if test="yodaodict/dictfrom = 'local'"-->
									<xsl:if test="sentences-result/example-sentences/sentence-pair">
										<xsl:apply-templates select="/yodaodict/local-dicts/dict/sentences-result">
											<xsl:with-param name="keyfrom">main.sentence</xsl:with-param>
											<xsl:with-param name="input" select="/yodaodict/input"/>
											<xsl:with-param name="inputEncode" select="/yodaodict/inputEncode"/>
										</xsl:apply-templates>
									</xsl:if>
									<!--/xsl:if-->
									<!-- 例句结束 -->
								</xsl:for-each>
							</xsl:if>
							<!-- 本地词典结果结束 -->
							<!-- 结果底部版权声明开始 -->
								<xsl:call-template name="ead_block">
									<xsl:with-param name="ead_id">ead_dictr_5</xsl:with-param>
									<xsl:with-param name="style">ead_line</xsl:with-param>
								</xsl:call-template>
							<xsl:if test="yodaodict/basic/simple-dict or yodaodict/basic/dict or yodaodict/baike">
								<!-- 显示一条黑色的横线 -->
								<ul class="copyright">
									<xsl:if test="yodaodict/basic/simple-dict/source">
										<li id="btsource">
              <span class="middot">&#183;</span>简明翻译结果来源于:
              <xsl:choose>
												<xsl:when test="yodaodict/basic/simple-dict/source/url">
													<xsl:element name="a">
														<xsl:attribute name="href"><xsl:value-of select="yodaodict/basic/simple-dict/source/url"/></xsl:attribute>
														<xsl:attribute name="class">bottomsource</xsl:attribute>
														<xsl:attribute name="target">_blank</xsl:attribute>
														<xsl:attribute name="onclick">
                      javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase"/>', 1, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'simple_result')
                    </xsl:attribute>
														<xsl:value-of select="yodaodict/basic/simple-dict/source/name"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="yodaodict/basic/simple-dict/source/name"/>
												</xsl:otherwise>
											</xsl:choose>
										</li>
									</xsl:if>
									<!-- 其他词典的来源声明-->
									<!-- 结果底部版权声明结束 -->
									<xsl:if test="yodaodict/basic/dict/source">
										<li id="btsource">
											<span class="middot">&#183;</span><xsl:value-of select="yodaodict/basic/name"/>来源于:
              <xsl:value-of select="yodaodict/basic/dict/source/name"/>
										</li>
									</xsl:if>
									<!-- 如果简明词典的位置直接输出权威词典，需要补上声明 -->
									<xsl:if test="not(yodaodict/basic/simple-dict) and not(yodaodict/basic/dict)">
										<xsl:if test="yodaodict/basic/authoritative-dict">
											<li id="btsource">
												<span class="middot">&#183;</span><xsl:value-of select="yodaodict/basic/name"/>基本释义来源于:
                <xsl:value-of select="yodaodict/basic/authoritative-dict/source/name"/>
											</li>
										</xsl:if>
									</xsl:if>
									<!-- 汉语词典来源的声明 -->
									<xsl:if test="yodaodict/hh">
										<li id="btsource">
              <span class="middot">&#183;</span>汉语词典来源于:
              <xsl:value-of select="yodaodict/hh/source/name"/>
										</li>
									</xsl:if>
									<!-- 百科结果来源的声明 -->
									<xsl:if test="yodaodict/baike">
										<li id="btsource">
              <span class="middot">&#183;</span>百科内容来源于:
              <xsl:element name="a">
												<xsl:attribute name="href"><xsl:value-of select="yodaodict/baike/source/url"/></xsl:attribute>
												<xsl:attribute name="class">bottomsource</xsl:attribute>
												<xsl:attribute name="target">_blank</xsl:attribute>
												<xsl:attribute name="onclick">
                  javascript:ctlog(this, '<xsl:call-template name="standard_return_phrase"/>', 1, '<xsl:value-of select="/yodaodict/keyfrom"/>', 1, 'CLICK', 'hoodong_deskdict')
                </xsl:attribute>
												<xsl:value-of select="yodaodict/baike/source/name"/>
											</xsl:element>
										</li>
									</xsl:if>
									<xsl:if test="yodaodict/sentences-result/media-sents/sent">
										<li id="btsource"><span class="middot">&#183;</span>部分原声例句来源于<a href="http://yyets.com">人人影视</a>、<a href="http://bbs.uuniao.com">悠悠鸟</a>、<a href="http://bbs.sfileydy.com">伊甸园</a>等 对外免费发布的字幕素材</li>
									</xsl:if>
								</ul>
							</xsl:if>
							<!-- 简明翻译来源的声明 -->
							<!-- 没有结果的情况  -->
							<xsl:if test="not(yodaodict/basic)">
								<xsl:if test="not(yodaodict/yodao-web-dict/web-translation)">
									<xsl:if test="not(yodaodict/sentences-result/example-sentences/sentence-pair)">
										<xsl:if test="not(yodaodict/baike)">
											<xsl:if test="not(yodaodict/BAIKE-SEARCH)">
												<xsl:if test="not(yodaodict/BAIKE-DETAILS)">
													<xsl:if test="not(yodaodict/hh)">
														<xsl:if test="not(yodaodict/local-dicts/dict/word[text() != ''])">
															<xsl:if test="not(yodaodict/thirdpart-result)">
																<xsl:if test="not(yodaodict/local-dicts/dict/sentences-result/example-sentences/sentence-pair)">
																	<xsl:if test="not(yodaodict/local-dicts/dict/authoritative-dict/word)">
																		<div class="trans-wrapper">
																			<!-- it's a work-around  -->
			没有找到与您查询的"<b>
																				<xsl:call-template name="SubStringFun">
																					<xsl:with-param name="input" select="/yodaodict/input"/>
																					<xsl:with-param name="from" select="'bk:'"/>
																					<xsl:with-param name="to" select="''"/>
																				</xsl:call-template>
																			</b>"相关的<xsl:call-template name="get_language_name">
																				<xsl:with-param name="lang_type" select="/yodaodict/language"/>
																			</xsl:call-template>结果。

		</div>
																	</xsl:if>
																</xsl:if>
															</xsl:if>
														</xsl:if>
													</xsl:if>
												</xsl:if>
											</xsl:if>
										</xsl:if>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							<!-- 处理本地结果的情况 -->
							<xsl:if test="yodaodict/dictfrom = 'local'">
								<div class="trans-wrapper">
		 目前无法连接服务器，请检查您的网络连接或者查看<a>
										<xsl:attribute name="href">
					/res/faq.html
				</xsl:attribute>
										<xsl:attribute name="target">_self</xsl:attribute>
				FAQ页面</a>。
		</div>
							</xsl:if>
							<xsl:if test="/yodaodict/ins_result-advt-show[text() = '1']">
								<div id="show_ins_adv" style="display:none"/>
							</xsl:if>
							<OBJECT ID="flspins" WIDTH="0" HEIGHT="0" CLASSID="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"/>
						</div>
						<xsl:call-template name="ead_block">
							<xsl:with-param name="ead_id">ead_dictr_result_bottom</xsl:with-param>
							<xsl:with-param name="style">ead_line_bottom</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
                <div id="tab-flag" style="display:none">dict</div>
				<script type="text/javascript">
					dict.result.init();main();
				</script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
