#!/usr/bin/env python
#coding:utf-8

import json
from urllib.request import urlopen
from urllib.parse import quote
import sys

html = """
<html>
<head>
<script type="text/javascript">function playSound(){var ky = document.getElementById("key");var word = ky.childNodes[0].nodeValue;var api = "http://dict.youdao.com/dictvoice?audio=" + encodeURIComponent(word);var ado = document.getElementById("media");try{ado.ended = true;ado.setAttribute("src",api);ado.load();ado.play();return false;}catch(err){alert(err.description);return false;}}</script>
</head>
<body>
<style type="text/css">
      #main {
      background-color:#181818;
      padding: 10px;
      }
      div.block {
      border:1px solid #181818;
      background:#2A2A2A;
      margin-left:20px;
      border-radius: 5px;
      }
      div.name {
      margin-top:10px;
      margin-bottom:5px;
      margin-left:20px;
      font-size:13px;
      font-weight:bold;
      color: #C1C1C1
      }
      div.item {
      padding:5px;
      font-size:12px;
      margin: 0px 10px 0px 10px;
      color: #FFFFFF
      }
      #web {
      border-style: none none dotted none;
      border-color: #181818;
      border-bottom-width: 1px;
      }
      .pyfanyi_a {
      color: #738292
      }
      .pyfanyi_b {
      
      }
    </style>
    <div id="main">
      <div class="name">查询:</div>
      <div class="block">
       %s
      </div>
      <div class="name">有道翻译:</i></div>
      <div class="block">
  %s
      </div>
      <div class="name">有道词典-基本词典:</i></div>
      <div class="block">
  %s
      </div>
      <div class="name">有道词典-网络释义:</i></div>
      <div class="block">
       %s
      </div>
      <div class="name">更多结果:</div>
      <div class="block">
       %s
      </div>
    </div>
</body>
</html>
"""

errorHtml = """
<html><body>
<div class="block">
<div class="item">%</div>
</div>
</body></html>
"""

errorResult = {'0':'', '20':'要翻译的文本过长', '30':'无法进行有效的翻译',
              '40':'不支持的语言类型', '50':'无效的key'}

def printHtml(errorCode, query, translation, basic, web):
    """打印html"""
    if errorCode != 0:
        print(errorHtml % errorResult[errorCode])
        return
    item = '<div class="item">%s</div>'
    #有道翻译
    q = item % ('<b class="pyfanyi_b" >"%s"</b>' % query)
    trans = ''
    for i in translation:
        trans += item % ('<b class="pyfanyi_b" >"%s"</b>' % i)

    #有道词典
    key = ''
    if basic:
        key += '<span id="key" style="font-weight:bold">%s</span>' % (query + ' ')
        if 'phonetic' in basic.keys():
            key += '[%s]' % basic['phonetic']
            key += '<button id="sound" onclick="playSound()">sound</button><audio id="media"></audio>'
        key = item % key
        if 'explains' in basic.keys():
            #判断查询的词是不是中文
            isChinese = False
            for c in query:
                if ord(c) >= 0x4e00 and ord(c) <= 0x9fa5:
                    isChinese = True
                    break
            if not isChinese:
                for i in basic['explains']:
                    key += item % i
            else:
                for i in basic['explains']:
                    key += item % ('<a class="pyfanyi_a" href="%s">%s</a>' % (i, i))
        key += item % ('<a class="pyfanyi_a" href="http://dict.youdao.com/w/%s">%s</a>' % (query, '更多解释'))

    #web词典
    webdict = ''
    webitem = '<div %s class="item">%s<br/>%s</div>'
    if web:
        if len(web) > 1:
            for i in range(len(web)-1):
                webdict += webitem % ('id="web"', web[i]['key'], ', '.join(web[i]['value']))
        webdict += webitem % ('', web[-1]['key'], ', '.join(web[-1]['value']))

    if not key:
        key = item % '对不起,没有结果'
    if not webdict:
        webdict = item % '对不起,没有结果'
    #更多搜索
    moreSearch = '<div class="item"><a class="pyfanyi_a" href="http://dict.bing.com.cn/?FORM=BNGCN#' + \
      query + '">通过Bing词典搜索</a></div>'
    moreSearch += '<div class="item"><a class="pyfanyi_a" href="http://test.iciba.com/' + \
      query + '">通过iciba词典搜索</a></div>'
    moreSearch += '<div class="item"><a class="pyfanyi_a" href="http://www.baidu.com/s?wd=' + \
      query + '">通过百度搜索</a></div>'
    moreSearch += '<div class="item"><a class="pyfanyi_a" href="http://www.google.com.hk/#q=' + \
      query + '">通过Google搜索</a></div>'

    print (html % (q, trans, key, webdict, moreSearch))

def getData(string):
    data = json.loads(string)
    errorCode = data['errorCode']
    query = data['query']
    translation = data['translation']
    basic = {}
    if 'basic' in data.keys():
        basic = data['basic']
    web = []
    if 'web' in data.keys():
        web = data['web']
    
    printHtml(errorCode, query, translation, basic, web)

def searchWord(word):
    url = r'http://fanyi.youdao.com/openapi.do?keyfrom=SkyHacker&key=25021457&type=data&doctype=json&version=1.1&q=' + quote(word)
    f = urlopen(url)
    jsonStr = f.read().decode()
    getData(jsonStr)

if __name__ == '__main__':
    searchWord(sys.argv[1])
