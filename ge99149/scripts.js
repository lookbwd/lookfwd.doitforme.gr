var ie = (document.all) ? 1:0;
var ns = (document.layers) ? 1:0;
var pop;
var oldtext;
var visitime;
var lastimages;
var lasttitle;

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

function MM_checkPlugin(plgIn, theURL, altURL, autoGo) { //v4.0
  var ok=false; document.MM_returnValue = false;
  with (navigator) if (appName.indexOf('Microsoft')==-1 || (plugins && plugins.length)) {
    ok=(plugins && plugins[plgIn]);
  } else if (appVersion.indexOf('3.1')==-1) { //not Netscape or Win3.1
    if (plgIn.indexOf("Flash")!=-1 && window.MM_flash!=null) ok=window.MM_flash;
    else if (plgIn.indexOf("Director")!=-1 && window.MM_dir!=null) ok=window.MM_dir;
    else ok=autoGo; }
  if (!ok) theURL=altURL; if (theURL) parent.window.location=theURL;
}

function popwizard(theURL,winName,width,height,features) { 
	if(window.screen){
		x=(screen.width-width)/2;
		y=(screen.height-height)/2;
	}else{
		x=0;
		y=0;
	}
	if(navigator.appName == "Microsoft Internet Explorer"){
		var str = "fullscreen=1,menubar=0,toolbar=0,directories=0,location=0,status=0,scrollbars=0,width=" + width + ",height=" + height + ",resizable=0";
		pop = window.open("http://www.germanosnet.gr/wizard/index1.php","", str, true);
		pop.resizeTo(width, height);
		pop.moveTo(Math.round((screen.width-width)/2) , Math.round((screen.height-height)/2));
		pop.focus();
	}
	else if(navigator.appName == "Netscape") {
		winfeatures=("top="+y+",left="+x+",width="+(width-2)+",height="+height+","+features);
		pop = window.open(theURL,winName,winfeatures);	
		pop.focus();
	}
	
}

function UpdateClock() {   if(clockID) {      clearTimeout(clockID); clockID  = 0;   }
var tDate = new Date();
clock.innerText = "" + tDate.getHours() + ":" + (tDate.getMinutes()>9 ? "": "0")+tDate.getMinutes() + ":" +(tDate.getSeconds()>9 ? "": "0")+ tDate.getSeconds()+"";
   clockID = setTimeout("UpdateClock()", 1000);}

function StartClock() {
   StartFavorite()
   clockID = setTimeout("UpdateClock()", 500);}

function KillClock() {
   KillFavorite()
   if(clockID) {      clearTimeout(clockID);      clockID  = 0;   }}

function StartFavorite() {
   FavID = setTimeout("FavoriteScan()", 5000);visitime=0;}
   
function KillFavorite() {
   if(FavID) {      clearTimeout(FavID);      FavID  = 0;   }}
   
function FavoriteScan() { 
if  (MenuImage.innerHTML!=oldtext) visitime=0;
oldtext=MenuImage.innerHTML;
visitime++
if (visitime==8) Add2Favorites()
FavID = setTimeout("FavoriteScan()", 5000);
}

function Add2Favorites() {
var Taste
var CurrentTag
var indexes= new Array()
Taste=getCookie("DKLSite")


CurrentTag=MenuImage.innerHTML.substr(MenuImage.innerHTML.lastIndexOf("<A href"))
if (Taste!=null && Taste.indexOf(CurrentTag)!=-1) return

if (Taste!=null) {x=0;
do {
indexes[x]=Taste.indexOf("<A href",(indexes[x-1]+1))
x++}
while (indexes[x-1]!=-1 && indexes[x-1]!=null)
if (x>3) Taste=Taste.substr(indexes[x-4])}

if (Taste==null) Taste=""
register(Taste.concat("<br>"+CurrentTag))
parent.frames[0].short.innerHTML=("<font color='#000066' size='2' face='Verdana, Arial, Helvetica, sans-serif'>Προτιμόμενα:</font><br>"+Taste.concat("<br>"+CurrentTag))
}

function back(){parent.history.go(-1)}
function next(){parent.history.go(+1)}


function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function UpdateTitlebar(images,title)
{
lastimages=images;
lasttitle=title;
if ((!parent.frames[1]) || (!parent.frames[1].MenuImage) || (!parent.frames[1].MenuInfo)) {setTimeout("UpdateTitlebar(lastimages,lasttitle)", 5000);} 
else {
parent.frames[1].MenuImage.innerHTML=images;
parent.frames[1].MenuInfo.innerHTML=title;
}

}

function setCookie(name, value, expire) {
document.cookie = name + "=" + escape(value)
+ ((expire == null) ? "" : ("; expires=" + expire.toGMTString()))
}

function getCookie(Name) {
var search = Name + "="
if (document.cookie.length > 0) { // if there are any cookies
offset = document.cookie.indexOf(search)
if (offset != -1) { // if cookie exists
offset += search.length
// set index of beginning of value
end = document.cookie.indexOf(";", offset)
// set index of end of cookie value
if (end == -1)
end = document.cookie.length
return unescape(document.cookie.substring(offset, end))
}}}

function register(name) {
var today = new Date()
var expires = new Date()
expires.setTime(today.getTime() + 1000*60*60*24*365)
setCookie("DKLSite", name, expires)
}

function startswap() {swap = setTimeout("swapleafs()", 8000);}

function swapleafs() {
swap = setTimeout("swapleafs()", 8000);
for (i=0;i<5;i++) {
if (roll[i].background=='rootfiles/leaf.gif')
{	roll[i].background='rootfiles/leaf2.gif'
	} else {
	roll[i].background='rootfiles/leaf.gif'}
	}
}