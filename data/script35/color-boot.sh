#!/bin/bash
#version 2.0
#********************************************************************
#Author:		nieshaokai
#QQ: 			1195831127
#Date: 			2023-01-01
#FileName：		color-boot.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2023 All rights reserved
#********************************************************************
#变量声明
#v 闪烁的间隔，秒为单位
#Random 用来比较显示卡通图的变量
#RNDOM 随机数变量
#p选项中，用户输入选择动画图的变量
#********************************************************************

LIST="\n0--mom-beat-me\n1--nsk\n2--sexy\n3--girl\n4--aoteman\n5--supergirl\n6--Iloveyou\ndefault--allpictue-rotate-play"
cat >>TEMP <<EOF
用法  color-boot.sh [l|p|h|NUMER|default]
1: l|list 选项可以列出所有脚本目前拥有的卡通图，可通过卡通图前数字，可
          以通过脚本加数字形式观看对应卡通图。如 color-boot.sh 2 
2：p|play 选项只适用于Centos7.可以交互式动态观看卡通图 ，如何全部选择默认，则是滚动随机播放所有卡通图
           灯光闪烁频率可手动设定，默认为1秒刷新一次。
3：NUMBER 脚本后面加数字，可以固定显示对应卡通图。
4:将此脚本放至 /etc/profile.d/ 下，可实现登陆随机显示卡通图。
5：所有选项大小写不敏感。
EOF

if [ -z $1 ]; then
Random=$[ RANDOM % 7 ] 
elif [[ $1 =~ ^([Ll]([iI][Ss][Tt])?)$ ]];then
 echo -e $LIST
elif [[ $1 =~ ^([H|h]([L|l][E|e][P|p])?)$ ]];then
 cat TEMP
elif [[ $1 =~ [0-9] ]];then
 Random=$1
elif [[ $1 =~ ^([Pp]([Ll][Aa][Yy])?)$ ]];then
echo -e $LIST
echo -e "\e[31;1m this option only suit to Centos7\e[0m"
read -p "enter you want to kan: " -t 9 w
     if [ -z $w ];then
      v=1
     else
      read -p  "the Enter the flicker rate you want s/次(default 1): " -t 9  v 
      [ -z $v ] && v=1 
     fi
watch -ct -n $v color-boot.sh $w
else
cat TEMP
fi

if [ $Random -eq 0 ] &> /dev/null;
then

echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                  .. .vr       \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                qBMBBBMBMY     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                               8BBBBBOBMBMv    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                             iMBMM5vOYlBMBBv        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             .r,             OBMl   .l rBBBBBY     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             vUL             7BB   .l7. LBMMBBM.   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m            .@Wwz.           luvir .il.iLMOMOBM..  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             vvllrl             iY. ...rv,@arqiao. \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              Li. il             vl.llll7vOBBMBL.. \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              ,i7l vSUi,         lM7.l.,lu08OP. .  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                .N2k5u1ju7,..     BMGiiL7   ,i,i.  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 lrLjFYjvjLY7rll.  lv  vr... rE8ql.l,, \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                751jSLXPFu5uU@guohezou.,1vjY2E8@Yizero.    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                BBlFMu rkM8Eq0PFjF15FZ0Xu15F25uuLuu25Gi.   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              ivSvvXL    lv58ZOGZXF2UUkFSFkU1u125uUJUUZ,   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m            l@kevensun.      ,iY20GOXSUXkSuS2F5XXkUX5SEv.  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m        .li0BMBMBBOOBMUil,        ,l8PkFP5NkPXkFqPEqqkZu.  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m      .rqMqBBMOMMBMBBBM .           @kexianli.S11kFSU5q5   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m    .7BBOi1L1MM8BBBOMBB..,          8kqS52XkkU1Uqkk1kUEJ   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m    .lMBZliiMBMBMMOBBBu ,           1OkS1F1X5kPP112F51kU   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m      .rPY  OMBMBBBMBB2 ,.          rME5SSSFk1XPqFNkSUPZ,.\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             llJuBMLllrl.l.,,        SZPX0SXSP5kXGNP15UBr.\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 L,    l@huhao.      lMNZqNXqSqXk2E0PSXPE .\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             viLBX.,,v8Bj. ilr7l,     2Zkqq0XXSNN0NOXXSXOU \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m           lr2. rMBGBMGi .7Y, 1illi   vO0PMNNSXXEqP@Secbone.\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m           .i1r. .jkY,    vE. iY....  20Fq0q5X5F1S2F22uuv1Ml\e[0m"



elif [ $Random -eq 1 ]&> /dev/null ;
then

#-------------------------------------------------------------------------------------------------------
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ****       ***               ****             ***       ***                                                                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  *****      ***            **********          ***      ***                                                                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  *** ***    ***          *****     ****        ***     ***                                                                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***  ***   ***           *****     ****       ***    ***                                                                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***   ***  ***             ****               ***  ***                                                                      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***    *** ***               *******          ******                                                                        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***     *** **                  ******        ***  ***                                                                      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***      *****         ****       ****        ***    ***                                                                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***       ****          ****    *****         ***     ***                                                                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***        ***            *********           ***      ***                                                                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  ***         **              *****             ***       ***           \n                                                    \e[0m"
#-------------------------------------------------------------------------------------------------------


elif [ $Random -eq 2 ] &>/dev/null;
then

#-------------------------------------------------------------------------------------------------------

echo -e "\e[`expr $RANDOM % 7 + 31`;1m                             _.._        ,------------\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                          ,'      '.    ( We want you! \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         /  __) __' &    '-,----------\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        (  ('-'(-')  ) _.-\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        /)  &  = /   %    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       /'    |--' .   &      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      (  ,---|  '-.)__ &_         \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       )(  '-.,--'   _'--)      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      '/,'          (  Uu'-        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       (_       ,    '/,-'            \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        .__,  : '-'/  /--        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         |     -- ~ /            \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         ’   ‘-._  &                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                          )        /             \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                          /? .     (              \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         / |  &     ,-              \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        /  &| .)   /   }            \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       ( ,|&    ,'      )        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       | &, . --’/      |       \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       ’,‘    &  |,'    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      / ’-._   ‘-/      | \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      ‘-.   ’-.,'|     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                     /        _/[’---'‘’\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                    :        /  |‘-    | \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                    ‘           |      /\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                ’     & \e[0m"



elif [ $Random -eq 3 ] &> /dev/null;
then

#-------------------------------------------------------------------------------------------------------
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                                    /*[*/#include<stdio.h>//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        #include<stdlib.h>//]++++[->++[->+>++++<<]<][(c)2013]\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      #include<string.h>//]![misaka.c,size=3808,crc=d0ec3b36][\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                    typedef struct{int d,b,o,Plchar*q,*pl}flint p,q,d,b,_=0///\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 #include __FILE__//]>>>[->+>++<<]<[-<<+>>>++<]>>+MISAKA*IMOUTO\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m               #undef e//[->[-<<+<+<+>>>>]<<<<<++[->>+>>>+<<<<<]>+>+++>+++[>]]b\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m            #define e(c)/**/if((_!=__LINE__?(_=__LINE__):0)){cl}//[20002,+[-.+]\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m        ,Q= ,O,i=0,Q=sizeof(f)lstatic f*Plstatic FILE*tlstatic const char*o[]={//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m    ,O,i=0,Q=s ,O,i=0,Q=sizeof(f)lstatic f*Plstatic FILE*tlstatic const char*o[]={//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   ,O,i=0,Q=s ,O,i=0,Q=sizeof(f)lstatic f*Plstatic FILE*tlstatic const char*o[]={//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   ,O,i=0,Q=s  ,O,i=0,Q=sizeof(f)lstatic f*Plstatic FILE*tlstatic const char*o[]={//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   l){if(/**/Z-l){Z=llq++lif(p<b*5&&!S()){p+=blq=0l}}}int main(int I,    /**/char**l){//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  d=sizeof(f*)lif(1<(O=_)){b=((sizeof(o)/sizeof(char*))-1)/4lq=22l p=     0lwhile(p<b*5){\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m /*<*/if(Z-1){d=S()>96li=S()-(d?96:32) lq++lif(p<b*5&&!S()){p+=bl  q=      0l}Z=1l}/*[[*/\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m while(i){_=o[0][S()-97]lI=_-10?b:1l   for( lI--l)putchar(_ )lif   (!      --i//d)z(~i )l}\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mif(p==b*5&&O){p-=blO--l}}return 0Ul   }if(! (P=( f*)calloc /*]*/  (Q        ,I)))return 1l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m{l}for(_=p=1lp<Ilp++){e(q=1)lwhile    (q<   p&&  strcmp(  l[p     ]         ,l[(q)]))++  ql\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mt=stdinlif(q<p){(void)memcpy/*       */    (&P  [p],&P   [q     ]          ,Q)lcontinue l}\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mf(strcmp(l[p],"-")){t=fopen(l         [     p]   ,"rb"   )                  lif(!t ){{l}  l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mrintf(05+*o,l[p ])lreturn+1l                      {l}                       }}_=b= 1<<16   l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m&O=5ldo{if(!(P[p].q=realloc   (P[p].q,(P[p].P     +=       b)+1))){return   01l}O   &=72   /\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m/*][*/lP[p].o+=d=fread(P[p]      .q       +P[     p           ].       o,  1,b,t)   l}//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mwhile(d==b)      lP [p].q[       P[       p]                  .o       ]=  012ld    =0l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1me(fclose(t        )  )lP         [p]      .p                  =P[      p]  .qlif    (O)\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m{for(ld<P[            p]          .o     ld=                   q+     1)    {q=     dl\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m while(q<P[                        p].o&&P[                    p].q[q]-     10     ){\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m q++l}b=q-dl                         _=P                         [p].        d     l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m if(b>_){/*]b                                                                */\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  P[p].d=bl}{l                                                                }\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #undef/*pqdz'.*/  e//                                                      l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #define/*s8qdb]*/e/**/0                                                   //\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  //<<.<<.----.>.<<.>++.++<                                              .[>]\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  /*P[*/P[p].b++lcontinuel}}}t=                                       stdoutl\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m for (p=1lp<Ilp++){/**/if(P[p].b>i                               ){i=P[p].bl}}\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1mif  (O){for(p=0lp<ilp++){q=0l/*[*/while(I               >++q){_=P[q].p-P[q ].ql\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m=   0lif(_<P[q ].o){while(012-*P[q].p)     {putchar(*(P[q].p++))lb++l}P[q]. p++l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   lwhile (P[  q].d>b++)putchar(040)l}             putchar(10)l}return 0l}p   =1l\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  for(l   p<I   lp++)fwrite(P[p] .q,P[              p].o,1,t)lreturn 0 l}//\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m #/*]     ]<.    [-]<[-]<[- ]<[    -]<               [-  ]<l*/elif  e    //b\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m/(1        <<     ( __LINE__        /*               >>   '*//45))  /     01U\e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m            #                       /*               */     endif            //\e[0m"


#-------------------------------------------------------------------------------------------------------



elif [ $Random -eq 4 ] &> /dev/null;
then

#-------------------------------------------------------------------------------------------------------
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                                                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                                                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         .'.                                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        .0llo.                                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        .O..,d:                                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                         dc  .:x'                               \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        .k:l. ..xc.                             \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                      .cx:''l. ',lol:'                          \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                    .lx:''''',  .l''::o'                        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                   lo:''''''',. .ll'', co.                      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                  cc  .,'''''',  .,''l. lk.                     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 ,O.   .,'''''l. .,''''  lx.                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                'kl,    .''''''l .l,'',  .cO.                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m               .x:''l    '''''':. ':'''  .:cxc                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m               ol ',',.   .,'''l. .:,l.   . .l:                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              cc.  ...'.    .'''  .l        .:l                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             ld ..                 l   ..'',cxl                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              dc...   .......      '  ,'....cO                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m               ol:l. :......',''   . ,,.....0:                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                lol:.,l........':  ..,'...l:O.                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 lol.. .',....,,,   . .... lc                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                   ,ll    .....     .     'x                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                     lk:            .     O,                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                   .cc::l.    .. .. .'l. lOdlcc.                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                  co.  .dd:c  .''.' .c,,dk:   .dl               \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                'xx':oc:,''kd:''.....,lOko.     d'              \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              .d0koxx. ...oOOkkkxxlolxkd:l:lll:cxko,            \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             '0kx..l.  . .lo0kdxolldxkdc.     ..,okOxl          \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             lOl   ::''cckOO0kdoldxkxxo,.  .:.  ,dll'cx         \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             'Kl   .:xd:c0:dxxxddxxxll.   'kOKx''    'k         \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              .:::::,.  .0c ,dxxxl,     'o0d,,::,,:. o,         \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                        .Ox:  co.    ':dxd0k,...  .oc:          \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                       .k,.:o'  .,:oxxxxc.lo::l::',,            \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                     'oO,   ,xdlxxxxxx:.  .O                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                    l0kk'    lxxxxxxx'    .0l                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                  .kOxxxd,   ,OOOkkkl    .dx0.                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 .Okxxxoclo':l,..':O.  loxxxOx                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                 dcxl'    lk.      'x:dooxxl.l:                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                ld .      lc        .0.  .::  d.                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              .col..     .k.         lc       'd                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             .O.   .. ...lx           x'  .,,. ,o.              \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             .dd:,lclol::,.           ,k. .     .O.             \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                ',..                   ,l:      lk.             \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                         .l:c:ll,               \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                                                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m                                                     .   .  ....\e[0m"

#-------------------------------------------------------------------------------------------------------


elif [ $Random -eq 5 ] &> /dev/null ;
then



#-------------------------------------------------------------------------------------------------------
echo -e "\e[`expr $RANDOM % 7 + 31`;1m              #########                       \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             ############                     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m             #############                    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m            ##  ###########                   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m           ###  ###### #####                  \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m           ### #######   ####                 \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m          ###  ########## ####                \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m         ####  ########### ####               \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m       #####   ###########  #####             \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m      ######   ### ########   #####           \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m      #####   ###   ########   ######         \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m     ######   ###  ###########   ######       \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m    ######   #### ##############  ######      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   #######  ##################### #######     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   #######  ##############################    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #######  ###### ################# #######   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #######  ###### ###### #########   ######   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #######    ##  ######   ######     ######   \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m  #######        ######    #####     #####    \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m   ######        #####     #####     ####     \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m    #####        ####      #####     ###      \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m     #####      l###        ###      #        \e[0m"
echo -e "\e[`expr $RANDOM % 7 + 31`;1m       ##       ####        ####              \e[0m"

#-------------------------------------------------------------------------------------------------------
elif [ $Random -eq 6 ] &>/dev/null;
then

#-------------------------------------------------------------------------------------------------------
echo -e "\e[1;31m                                      9999        9999\e[0m"
echo -e "\e[1;31m                                     9999999    9999999\e[0m"
echo -e "\e[1;31m                                    999999999  999999999\e[0m"
echo -e "\e[1;31m                                    99999999999999999999\e[0m"
echo -e "\e[1;31m                                     999999999999999999\e[0m"
echo -e "\e[1;31m                                      9999999999999999\e[0m"
echo -e "                                       \e[1;31m99999999999999\e[0m            \e[1;$[RANDOM%7+31]m**\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m         ****        **\e[0m                 \e[1;31m999999999999\e[0m           \e[1;$[RANDOM%7+31]m**\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m          **          **\e[0m                 \e[1;31m9999999999\e[0m          \e[1;$[RANDOM%7+31]m**      **\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m          **           **\e[0m                 \e[1;31m99999999\e[0m             \e[1;$[RANDOM%7+31]m**  **\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m          **            **     ***\e[0m         \e[1;31m999999\e[0m                \e[1;$[RANDOM%7+31]m**      **\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m          **             **  ***\e[0m            \e[1;31m9999\e[0m                   \e[1;$[RANDOM%7+31]m**  **\e[0m"
echo -e "\e[1;$[RANDOM%7+31]m         ****             ***\e[0m                \e[1;31m99\e[0m                     \e[1;$[RANDOM%7+31]m** \e[0m" 



else
rm TEMP
exit
fi

