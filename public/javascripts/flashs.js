//选择器
function $a(id,tag){var re=(id&&typeof id!="string")?id:document.getElementById(id);if(!tag){return re;}else{return re.getElementsByTagName(tag);}}
//标签切换效果[标题框子元素("id/li"),内容框子元素("id/li"),事件(mouseover/click),默认显示第几条(-1表示在鼠标移出全部隐藏,仅在事件mouseover有效),轮播时间(1秒=1000)]
function SwitchTag(tit,box,s,show,time)
{
	var t=tit.split('/'),b=box.split("/"),ts=$a(t[0],t[1]),bs=$a(b[0],b[1]),s=s||"onmouseover",now=show=show||0,c;
	for(var i=0;i<ts.length;i++){ts[i].old=ts[i].className.replace("show","");bs[i].old=bs[i].className.replace("show","");reg(i);}
	function init(){for(var i=0;i<ts.length;i++){ts[i].className=ts[i].old;bs[i].className=bs[i].old;};if(now!=-1){ts[now].className+=(t[2]||"")+" show";bs[now].className+=(b[2]||"")+" show";}}
	function reg(i){ts[i][s]=function(){clearInterval(c);now=i;init();}
	if(show!=-1&&time){bs[i].onmouseover=function(){clearInterval(c);};bs[i].onmouseout=function(){go();};ts[i].onmouseout=function(){go();}}
	if(show==-1&&s=="onmouseover"){ts[i].onmouseout=function(){now=-1;init();}}}
	function go(){c=setInterval(function(){(now<ts.length-1)?now++:now=0;init();},time);}
	if(show!=-1&&time){go();};init();
}

//焦点滚动图
function FocusImg(time,foc,fbimg)
{
	// var beg=$a($a(fbimg,"dd")[0],"div")[0];beg.check=true;
	var au=$a(foc,"a"),now=1,tm;var bimgs=$a(foc,"img");var vimg=new Image();vimg.src=bimgs[0].src;
	var ba=$a($a(fbimg,"dt")[0],"a")[0];ba.href=au[0].href;ba.target='_blank';ba.onfocus=function(){this.blur()};
	var bt=$a(fbimg,"dt")[0];bt.appendChild(vimg);
	var bi=$a(bt,"img")[1];bi.alt=bimgs[0].alt;
	var bp=$a($a(fbimg,"dd")[0],"ul")[0];
	var len=au.length;for(var i=0;i<len;i++){bp.innerHTML+="<li>"+(i+1)+"</li>";}
	var bps=$a(bp,"li");bps[0].className="show";function pfn(i){bps[i].onclick=function(){go(i);if(beg.check){clearInterval(tm);init();}else{clearInterval(tm)}}}for(var i=0;i<len;i++){pfn(i);}
	function xunhuan(){if(/*@cc_on!@*/false){bi.style.filter="progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0,motion=forward)";bi.filters[0].Apply();bi.filters[0].Play(duration=1);}
	ba.href=au[now].href;ba.target='_blank';bi.src=bimgs[now].src;bi.alt=bimgs[now].alt;for(var i=0;i<len;i++){bps[i].className="";}bps[now].className="show";(now<len-1)?now++:now=0;}
	function init(){tm=setInterval(xunhuan,time);};function go(n){clearInterval(tm);now=n;xunhuan();init();}init();
	// beg.onclick=function(){if(beg.check){beg.check=false;clearInterval(tm);beg.innerHTML="PLAY";}else{beg.check=true;clearInterval(tm);xunhuan();init();beg.innerHTML="STOP";}};
}