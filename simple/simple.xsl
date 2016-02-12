<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<style type="text/css">
					h2 {
						margin-left: 25px;
					}
					#keyword {
						font-size: 0.75em;
					}
					#phonetic {
						font-size: 0.65em;
						font-weight: normal;
						margin-left: 0.45em;
					}
					ul {
						list-style: none outside none;
					}
					li {
						margin-bottom: 0.67em;
					}

					#voice {
						background: url("file:///opt/eyoudao/simple/new-sprite.png") no-repeat scroll 0 0 transparent;
						background-position: -188px -132px;
						display: inline-block;
						height: 18px;
						outline: medium none;
						width: 23px;
						overflow: hidden;
						vertical-align: middle;
					}
					#voice:hover {
						background-position: -188px -149px;
					}
				</style>
				<script type="text/javascript">
					function playVoice(path)
					{
						stopVoice();
						var ado = document.getElementById("my_sound");
						ado.setAttribute("src", path);
						ado.play();
					}
					function stopVoice()
					{
						document.getElementById("my_sound").ended = true;
					}
				</script>
			</head>
			<body>
				<audio id="my_sound"></audio>
				<div id="headline">
					<h2>
						<span id="keyword"><xsl:value-of select="/yodaodict/return-phrase"/></span>
						<xsl:if test="/yodaodict/phonetic-symbol">
							<span id="phonetic"> [<xsl:value-of select="/yodaodict/phonetic-symbol"/>] </span>
						</xsl:if>
						<xsl:if test="/yodaodict/dictcn-speach">
							<xsl:element name="a">
								<xsl:attribute name="id">voice</xsl:attribute>
								<xsl:attribute name="href">#</xsl:attribute>
								<xsl:attribute name="ref">http://dict.youdao.com/dictvoice?audio=<xsl:value-of select="/yodaodict/return-phrase"/></xsl:attribute>
								<xsl:attribute name="onclick">playVoice(this.getAttribute('ref'));return false</xsl:attribute>
								<xsl:attribute name="onmouseover">this.style.cursor='hand';playVoice(this.getAttribute('ref'));return false</xsl:attribute>
								<xsl:attribute name="hidefocus">true</xsl:attribute>
								<xsl:attribute name="style"></xsl:attribute>
							</xsl:element>
						</xsl:if>
					</h2>
				</div>
				<div id="result">
					<xsl:choose>
						<xsl:when test="/yodaodict/custom-translation">
						<ul>
							<xsl:for-each select="/yodaodict/custom-translation/translation">
								<li><xsl:value-of select="content"/></li>
							</xsl:for-each>
						</ul>
						</xsl:when>
						<xsl:otherwise>
							<ul><li>没有找到释义</li></ul>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
