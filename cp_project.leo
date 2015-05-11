<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<?xml-stylesheet ekr_test ?>
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="2014fall.20141212095015.1784" a="E"><vh>@settings</vh>
<v t="2014fall.20141212095015.1785"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="2014fall.20141212095015.1786"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="2014fall.20141212095015.1774" a="E"><vh>@path ./</vh>
<v t="2014fall.20141212095015.1780"><vh>@edit setup.py</vh></v>
<v t="amd.20150511085257.1"><vh>@edit SUMMARY.md</vh></v>
<v t="2014fall.20141212095015.1775"><vh>@clean wsgi.py</vh>
<v t="2014fall.20141212095015.1776"><vh>&lt;&lt;declarations&gt;&gt; (wsgi)</vh></v>
<v t="2014fall.20141212095015.1777" a="E"><vh>class Hello</vh>
<v t="2014fall.20141212095015.2004"><vh>__init__</vh></v>
<v t="2014fall.20141212095015.1778"><vh>index_orig</vh></v>
<v t="2014fall.20141212095015.1779"><vh>hello</vh></v>
<v t="2014fall.20141215194146.1791"><vh>index</vh></v>
<v t="2014fall.20141215194146.1793"><vh>doCheck</vh></v>
<v t="2014fall.20141215194146.1789"><vh>guessform</vh></v>
</v>
</v>
<v t="amd.20150510200800.1" a="E"><vh>@path report</vh>
<v t="amd.20150510200958.1"><vh>@edit introduction.md</vh></v>
<v t="amd.20150510202649.1"><vh>@edit _協同的背景.md</vh></v>
<v t="amd.20150510203011.1"><vh>@edit _知識的創建.md</vh></v>
<v t="amd.20150510203026.1"><vh>@edit _協同產品設計.md</vh></v>
<v t="amd.20150510203039.1"><vh>@edit _協同任務執行.md</vh></v>
<v t="amd.20150510203054.1"><vh>@edit _協同工具特性.md</vh></v>
<v t="amd.20150510201310.1"><vh>@edit _建立分組協同報告.md</vh></v>
<v t="amd.20150510201431.1"><vh>@edit _新產品開發流程.md</vh></v>
<v t="amd.20150414211718.1"><vh>@edit _上機考試.md</vh></v>
<v t="amd.20150510205706.1"><vh>@edit _指令操作.md</vh></v>
<v t="amd.20150510210857.1"><vh>@edit _測試.md</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="2014fall.20141212095015.1774"></t>
<t tx="2014fall.20141212095015.1775"># coding=utf-8
# 上面的程式內容編碼必須在程式的第一或者第二行才會有作用

################# (1) 模組導入區
# 導入 cherrypy 模組, 為了在 OpenShift 平台上使用 cherrypy 模組, 必須透過 setup.py 安裝


@language python
@tabwidth -4

&lt;&lt;declarations&gt;&gt;
@others
################# (4) 程式啟動區
# 配合程式檔案所在目錄設定靜態目錄或靜態檔案
application_conf = {'/static':{
        'tools.staticdir.on': True,
        # 程式執行目錄下, 必須自行建立 static 目錄
        'tools.staticdir.dir': _curdir+"/static"},
        '/downloads':{
        'tools.staticdir.on': True,
        'tools.staticdir.dir': data_dir+"/downloads"},
        '/images':{
        'tools.staticdir.on': True,
        'tools.staticdir.dir': data_dir+"/images"}
    }

if 'OPENSHIFT_REPO_DIR' in os.environ.keys():
    # 表示在 OpenSfhit 執行
    application = cherrypy.Application(Hello(), config=application_conf)
else:
    # 表示在近端執行
    cherrypy.quickstart(Hello(), config=application_conf)
</t>
<t tx="2014fall.20141212095015.1776">import cherrypy
# 導入 Python 內建的 os 模組, 因為 os 模組為 Python 內建, 所以無需透過 setup.py 安裝
import os
# 導入 random 模組
import random

################# (2) 廣域變數設定區
# 確定程式檔案所在目錄, 在 Windows 下有最後的反斜線
_curdir = os.path.join(os.getcwd(), os.path.dirname(__file__))
# 設定在雲端與近端的資料儲存目錄
if 'OPENSHIFT_REPO_DIR' in os.environ.keys():
    # 表示程式在雲端執行
    download_root_dir = os.environ['OPENSHIFT_DATA_DIR']
    data_dir = os.environ['OPENSHIFT_DATA_DIR']
else:
    # 表示程式在近端執行
    download_root_dir = _curdir + "/local_data/"
    data_dir = _curdir + "/local_data/"

'''以下為近端 input() 與 for 迴圈應用的程式碼, 若要將程式送到 OpenShift 執行, 除了採用 CherryPy 網際框架外, 還要轉為 html 列印
# 利用 input() 取得的資料型別為字串
toprint = input("要印甚麼內容?")
# 若要將 input() 取得的字串轉為整數使用, 必須利用 int() 轉換
repeat_no = int(input("重複列印幾次?"))
for i in range(repeat_no):
    print(toprint)
'''
</t>
<t tx="2014fall.20141212095015.1777">################# (3) 程式類別定義區
# 以下改用 CherryPy 網際框架程式架構
# 以下為 Hello 類別的設計內容, 其中的 object 使用, 表示 Hello 類別繼承 object 的所有特性, 包括方法與屬性設計
class Hello(object):

    # Hello 類別的啟動設定
    _cp_config = {
    'tools.encode.encoding': 'utf-8',
    'tools.sessions.on' : True,
    'tools.sessions.storage_type' : 'file',
    #'tools.sessions.locking' : 'explicit',
    # session 以檔案儲存, 而且位於 data_dir 下的 tmp 目錄
    'tools.sessions.storage_path' : data_dir+'/tmp',
    # session 有效時間設為 60 分鐘
    'tools.sessions.timeout' : 60
    }

    @others
</t>
<t tx="2014fall.20141212095015.1778"># 以 @ 開頭的 cherrypy.expose 為 decorator, 用來表示隨後的成員方法, 可以直接讓使用者以 URL 連結執行
@cherrypy.expose
# index 方法為 CherryPy 各類別成員方法中的內建(default)方法, 當使用者執行時未指定方法, 系統將會優先執行 index 方法
# 有 self 的方法為類別中的成員方法, Python 程式透過此一 self 在各成員方法間傳遞物件內容
def index_orig(self, toprint="Hello World!"):
    return toprint
</t>
<t tx="2014fall.20141212095015.1779">@cherrypy.expose
def hello(self, toprint="Hello World!"):
    return toprint
</t>
<t tx="2014fall.20141212095015.1784"></t>
<t tx="2014fall.20141212095015.1785">QSplitter::handle {
    background-color: #CAE1FF; /* lightSteelBlue1 */
}

QStackedWidget {
    /* background-color:lightpink; */
    border-color: red;
    padding: 0px;
    /* border-width: 0px; */
    /* background-color: yellow; */
}

QSplitter {
    border-color: white;
    background-color: white;
    border-style: solid;
}

QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="2014fall.20141212095015.1786">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="2014fall.20141212095015.2004">def __init__(self):
    # 配合透過案例啟始建立所需的目錄
    if not os.path.isdir(data_dir+'/tmp'):
        os.mkdir(data_dir+'/tmp')
    if not os.path.isdir(data_dir+"/downloads"):
        os.mkdir(data_dir+"/downloads")
    if not os.path.isdir(data_dir+"/images"):
        os.mkdir(data_dir+"/images")
</t>
<t tx="2014fall.20141215194146.1789">def guessform(self):
    # 印出讓使用者輸入的超文件表單
    outstring = str(cherrypy.session.get('answer')) + "/" + str(cherrypy.session.get('count')) + '''&lt;form method=POST action=doCheck&gt;
請輸入您所猜的整數:&lt;input type=text name=guess&gt;&lt;br /&gt;
&lt;input type=submit value=send&gt;
&lt;/form&gt;'''
    return outstring
</t>
<t tx="2014fall.20141215194146.1791">@cherrypy.expose
def index(self, guess=None):
    # 將標準答案存入 answer session 對應區
    theanswer = random.randint(1, 100)
    thecount = 0
    # 將答案與計算次數變數存進 session 對應變數
    cherrypy.session['answer'] = theanswer
    cherrypy.session['count'] = thecount
    # 印出讓使用者輸入的超文件表單
    outstring = '''
&lt;!DOCTYPE html&gt; 
&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv="content-type" content="text/html;charset=utf-8"&gt;
&lt;!-- 載入 brython.js --&gt;
&lt;script type="text/javascript" src="/static/Brython3.1.0-20150301-090019/brython.js"&gt;&lt;/script&gt;
&lt;script src="/static/Cango2D.js" type="text/javascript"&gt;&lt;/script&gt;
&lt;script src="/static/gearUtils-04.js" type="text/javascript"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;!-- 啟動 brython() --&gt;
&lt;body onload="brython()"&gt;
    
&lt;form method=POST action=doCheck&gt;
請輸入您所猜的整數:&lt;input type=text name=guess&gt;&lt;br /&gt;
&lt;input type=submit value=send&gt;
&lt;/form&gt;
&lt;hr&gt;
&lt;!-- 以下在網頁內嵌 Brython 程式 --&gt;
&lt;script type="text/python"&gt;
from browser import document, alert

def echo(ev):
    alert(document["zone"].value)

# 將文件中名稱為 mybutton 的物件, 透過 click 事件與 echo 函式 bind 在一起
document['mybutton'].bind('click',echo)
&lt;/script&gt;
&lt;input id="zone"&gt;&lt;button id="mybutton"&gt;click !&lt;/button&gt;
&lt;hr&gt;
&lt;!-- 以下為 canvas 畫圖程式 --&gt;
&lt;script type="text/python"&gt;
# 從 browser 導入 document
from browser import document
import math

# 畫布指定在名稱為 plotarea 的 canvas 上
canvas = document["plotarea"]
ctx = canvas.getContext("2d")

# 用紅色畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(0, 500)
ctx.strokeStyle = "red"
ctx.stroke()

# 用藍色再畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(500, 0)
ctx.strokeStyle = "blue"
ctx.stroke()

# 用綠色再畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(500, 500)
ctx.strokeStyle = "green"
ctx.stroke()

# 用黑色畫一個圓
ctx.beginPath()
ctx.lineWidth = 3
ctx.strokeStyle = "black"
ctx.arc(250,250,50,0,2*math.pi)
ctx.stroke()
&lt;/script&gt;
&lt;canvas id="plotarea" width="800" height="600"&gt;&lt;/canvas&gt;
&lt;/body&gt;
&lt;/html&gt;
'''

    return outstring
</t>
<t tx="2014fall.20141215194146.1793">@cherrypy.expose
def doCheck(self, guess=None):
    # 假如使用者直接執行 doCheck, 則設法轉回根方法
    if guess is None:
        raise cherrypy.HTTPRedirect("/")
    # 從 session 取出 answer 對應資料, 且處理直接執行 doCheck 時無法取 session 值情況
    try:
        theanswer = int(cherrypy.session.get('answer'))
    except:
        raise cherrypy.HTTPRedirect("/")
    # 經由表單所取得的 guess 資料型別為 string
    try:
        theguess = int(guess)
    except:
        return "error " + self.guessform()
    # 每執行 doCheck 一次,次數增量一次
    cherrypy.session['count']  += 1
    # 答案與所猜數字進行比對
    if theanswer &lt; theguess:
        return "big " + self.guessform()
    elif theanswer &gt; theguess:
        return "small " + self.guessform()
    else:
        # 已經猜對, 從 session 取出累計猜測次數
        thecount = cherrypy.session.get('count')
        return "exact: &lt;a href=''&gt;再猜&lt;/a&gt;"
</t>
<t tx="amd.20150510200800.1">先根據目前既有章節, 定好各節點架構

先測試平鋪的檔案節點架構

請注意:

當使用中文檔案作為 md 檔案檔名時, 可能會在解決衝突時造成 git 指令區檔案辨識上的困難, 該如何處理此一問題?

全部改成英文檔名
或者在中文檔名前加上唯一的數字或辨識符號?

相關問題討論:

http://stackoverflow.com/questions/4144417/how-to-handle-asian-characters-in-file-names-in-git-on-os-x

在 Linux 上, 設定 git config --global core.quotepath false

就可以正確顯示中文檔案名稱, 必須在 Windows 測試是否一樣可行

</t>
</tnodes>
</leo_file>
