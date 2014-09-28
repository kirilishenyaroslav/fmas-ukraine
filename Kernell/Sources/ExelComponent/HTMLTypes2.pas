unit HTMLTypes2;

{-
********************************************************************************
******* XLSReadWriteII V3.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2006 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
********************************************************************************
** Users of the XLSReadWriteII component must accept the following            **
** disclaimer of warranty:                                                    **
**                                                                            **
** XLSReadWriteII is supplied as is. The author disclaims all warranties,     **
** expressedor implied, including, without limitation, the warranties of      **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

interface

uses Graphics;

type THTMLElementID = (heTEXT,
heDOCUMENT,heA,heABBR,heACRONYM,heADDRESS,heAPPLET,heAREA,heB,heBASE,heBASEFONT,
heBDO,heBIG,heBLOCKQUOTE,heBODY,heBR,heBUTTON,heCAPTION,heCENTER,heCITE,heCODE,
heCOL,heCOLGROUP,heDD,heDEL,heDFN,heDIR,heDIV,heDL,heDT,heEM,heFIELDSET,heFONT,
heFORM,heFRAME,heFRAMESET,heH1,heH2,heH3,heH4,heH5,heH6,heHEAD,heHR,heHTML,heI,
heIFRAME,heILAYER,heIMG,heINPUT,heINS,heISINDEX,heKBD,heLABEL,heLAYER,heLEGEND,
heLI,heLINK,heMAP,heMENU,heMETA,heNOFRAMES,heNOLAYER,heNOSCRIPT,heOBJECT,heOL,
heOPTGROUP,heOPTION,heP,hePARAM,hePRE,heQ,heS,heSAMP,heSCRIPT,heSELECT,heSMALL,
heSPAN,heSTRIKE,heSTRONG,heSTYLE,heSUB,heSUP,heTABLE,heTBODY,heTD,heTEXTAREA,
heTFOOT,heTH,heTHEAD,heTITLE,heTR,heTT,heU,heUL,heVAR,heDOCTYPE,

heUNKNOWN,heEOF,

heBeginEndtags,

heEndTEXT,
heEndDOCUMENT,heEndA,heEndABBR,heEndACRONYM,heEndADDRESS,heEndAPPLET,heEndAREA,
heEndB,heEndBASE,heEndBASEFONT,heEndBDO,heEndBIG,heEndBLOCKQUOTE,heEndBODY,
heEndBR,heEndBUTTON,heEndCAPTION,heEndCENTER,heEndCITE,heEndCODE,heEndCOL,heEndCOLGROUP,
heEndDD,heEndDEL,heEndDFN,heEndDIR,heEndDIV,heEndDL,heEndDT,heEndEM,heEndFIELDSET,
heEndFONT,heEndFORM,heEndFRAME,heEndFRAMESET,heEndH1,heEndH2,heEndH3,heEndH4,
heEndH5,heEndH6,heEndHEAD,heEndHR,heEndHTML,heEndI,heEndIFRAME,heEndILAYER,heEndIMG,
heEndINPUT,heEndINS,heEndISINDEX,heEndKBD,heEndLABEL,heEndLAYER,heEndLEGEND,
heEndLI,heEndLINK,heEndMAP,heEndMENU,heEndMETA,heEndNOFRAMES,heEndNOLAYER,
heEndNOSCRIPT,heEndOBJECT,heEndOL,heEndOPTGROUP,heEndOPTION,heEndP,heEndPARAM,
heEndPRE,heEndQ,heEndS,heEndSAMP,heEndSCRIPT,heEndSELECT,heEndSMALL,heEndSPAN,
heEndSTRIKE,heEndSTRONG,heEndSTYLE,heEndSUB,heEndSUP,heEndTABLE,heEndTBODY,heEndTD,
heEndTEXTAREA,heEndTFOOT,heEndTH,heEndTHEAD,heEndTITLE,heEndTR,heEndTT,heEndU,
heEndUL,heEndVAR,heEndDOCTYPE,

heEndUNKNOWN,heEndEOF);

type TElementAttributeID = (
eaAbbr,eaAcceptCharset,eaAccept,eaAccesskey,eaAction,eaAlign,eaAlt,eaArchive,
eaAxis,eaBackground,eaBgcolor,eaBorder,eaCellpadding,eaChar,eaCharoff,eaCharset,
eaChecked,eaCite,eaClass,eaClassid,eaClear,eaCode,eaCodebase,eaCodetype,eaColor,
eaCols,eaColspan,eaCompact,eaContent,eaCoords,eaData,eaDatetime,eaDeclare,eaDefer,
eaDir,eaDisabled,eaEnctype,eaFace,eaFor,eaFrame,eaFrameborder,eaHeaders,eaHeight,
eaHref,eaHreflang,eaHspace,eaHttpEquiv,eaId,eaIsmap,eaLabel,eaLang,eaLanguage,
eaLink,eaLeftmargin,eaLongdesc,eaMarginheight,eaMarginwidth,eaMaxlength,eaMedia,
eaMethod,eaMultiple,eaName,eaNoHref,eaNoResize,eaNoShade,eaNoWrap,eaObject,eaOnBlur,
eaOnChange,eaOnClick,eaOnDblclick,eaOnFocus,eaOnKeydown,eaOnKeypress,eaOnKeyup,
eaOnLoad,eaOnMousedown,eaOnMousemove,eaOnMouseout,eaOnMouseover,eaOnMouseup,
eaOnReset,eaOnSelect,eaOnSubmit,eaOnUnload,eaProfile,eaPrompt,eaAdonl,eaRel,
eaRev,eaRows,eaRowspan,eaRules,eaScheme,eaScope,eaScrolling,eaSelected,eaShape,
eaSize,eaSpan,eaSrc,eaStandby,eaStart,eaStyle,eaSummary,eaTabindex,eaTarget,eaText,
eaTitle,eaTopmargin,
eaType,eaUsemap,eaValign,eaValue,eaValuetype,eaVersion,eaVlink,eaVspace,
eaWidth,

eaUnknown);

type TAttrAlign = (aaLeft,aaCenter,aaRight,aaJustify,aaChar,aaTop,aaMiddle,aaBottom);

type TElementFlag = (efEndtag);
     TElementFlags = set of TElementFlag;

type TAttributeType = (atString,atNumber,atPercent,atColor,atAlign);

type PElementAttribute = ^TElementAttribute;
     TElementAttribute = record
     ID: TElementAttributeID;
     case AttType: TAttributeType of
       atString: (StrVal: PChar);
       atNumber: (NumVal: integer);
       atPercent:(PercentVal: integer);
       atColor:  (ColorVal: TColor);
       atAlign:  (AlignVal: TAttrAlign);
     end;

type THTMLElement = record
     ID: THTMLElementID;
//     Flags: TElementFlags;
     Attributes: array of TElementAttribute;
     end;

type THTMLElementArray = array of THTMLElement;

type PHTMLElementArray = ^THTMLElementArray;

const ElementNames: array[0..98] of string = ('TEXT',
'DOCUMENT','A','ABBR','ACRONYM','ADDRESS','APPLET','AREA',
'B','BASE','BASEFONT','BDO','BIG','BLOCKQUOTE','BODY','BR','BUTTON','CAPTION',
'CENTER','CITE','CODE','COL','COLGROUP','DD','DEL','DFN','DIR','DIV','DL',
'DT','EM','FIELDSET','FONT','FORM','FRAME','FRAMESET','H1','H2','H3','H4',
'H5','H6','HEAD','HR','HTML','I','IFRAME','ILAYER','IMG','INPUT','INS','ISINDEX','KBD',
'LABEL','LAYER','LEGEND','LI','LINK','MAP','MENU','META','NOFRAMES','NOLAYER','NOSCRIPT',
'OBJECT','OL','OPTGROUP','OPTION','P','PARAM','PRE','Q','S','SAMP','SCRIPT',
'SELECT','SMALL','SPAN','STRIKE','STRONG','STYLE','SUB','SUP','TABLE',
'TBODY','TD','TEXTAREA','TFOOT','TH','THEAD','TITLE','TR','TT','U','UL','VAR',
'DOCTYPE',

'UNKNOWN','EOF');


const AttributeNames: array[0..119] of string = (
'ABBR','ACCEPTCHARSET','ACCEPT','ACCESSKEY','ACTION','ALIGN','ALT','ARCHIVE',
'AXIS','BACKGROUND','BGCOLOR','BORDER','CELLPADDING','CHAR','CHAROFF','CHARSET',
'CHECKED','CITE','CLASS','CLASSID','CLEAR','CODE','CODEBASE','CODETYPE','COLOR',
'COLS','COLSPAN','COMPACT','CONTENT','COORDS','DATA','DATETIME','DECLARE','DEFER',
'DIR','DISABLED','ENCTYPE','FACE','FOR','FRAME','FRAMEBORDER','HEADERS','HEIGHT',
'HREF','HREFLANG','HSPACE','HTTP-EQUIV','ID','ISMAP','LABEL','LANG','LANGUAGE',
'LINK','LEFTMARGIN','LONGDESC','MARGINHEIGHT','MARGINWIDTH','MAXLENGTH','MEDIA',
'METHOD','MULTIPLE','NAME','NOHREF','NORESIZE','NOSHADE','NOWRAP','OBJECT','ONBLUR',
'ONCHANGE','ONCLICK','ONDBLCLICK','ONFOCUS','ONKEYDOWN','ONKEYPRESS','ONKEYUP',
'ONLOAD','ONMOUSEDOWN','ONMOUSEMOVE','ONMOUSEOUT','ONMOUSEOVER','ONMOUSEUP',
'ONRESET','ONSELECT','ONSUBMIT','ONUNLOAD','PROFILE','PROMPT','ADONL','REL','REV',
'ROWS','ROWSPAN','RULES','SCHEME','SCOPE','SCROLLING','SELECTED','SHAPE','SIZE',
'SPAN','SRC','STANDBY','START','STYLE','SUMMARY','TABINDEX','TARGET','TEXT','TITLE',
'TOPMARGIN','TYPE','USEMAP','VALIGN','VALUE','VALUETYPE','VERSION','VLINK','VSPACE',
'WIDTH',

'UNKNOWN');

type THTMLAlign = (haLeft,haCenter,haRight);

implementation

end.

