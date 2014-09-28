unit RecordStorageChart2;

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

{$Q-}
{$B-}
{$H+}
{$R-}
{$I XLSRWII2.inc}

interface

uses Classes, SysUtils, Contnrs, RecordStorage2, BIFFRecsII2, XLSStream2,
     EscherTypes2, XLSFonts2;

const ID_CHARTRECORDROOT = $FFFA;
const ID_CHARTRECORD_DEFAULTLEGEND = $F001;

type TDefaultRecordData = (drdAll,drdLegend,drdSerie,drdDataformat,drdStyleArea,
                           drdStyleBarColumn,drdStyleLine,drdStylePie,
                           drdStyleRadar,drdStyleScatter,drdStyleSurface);

type TDefaultRecord = record
     Id: word;
     Data: string;
     end;

type TChartRecord = class(TObjectList)
private
     FRecId: word;
     FLength: word;
     FData: PByteArray;
     FParent: TChartRecord;

     function  GetItems(Index: integer): TChartRecord;
     procedure ReadDefault(DefRecs: array of TDefaultRecord; var Index: integer; Fonts: TXFonts);
     function  FindFBIFont(Id: integer): TXFont;
protected
public
     constructor Create(Parent: TChartRecord; Header: TBIFFHeader; D: PByteArray); overload;
     constructor Create(Parent: TChartRecord; RecId,Length: word); overload;
     constructor Create(Parent: TChartRecord; RecId: word; Obj: TObject); overload;
     destructor Destroy; override;
     procedure Write(Stream: TXLSStream);
     procedure Resize(Delta: integer);
     procedure Read(Stream: TXLSStream; PBuf: PByteArray; Fonts: TXFonts);
     procedure ReadDefaultRecords(RecData: TDefaultRecordData);
     function  LastRec: TChartRecord;
     function  InsertRecord(Index: integer; RecId,Length: word; IsUpdate: boolean = False): TChartRecord;
     function  FindRecord(Id: integer): integer;
     function  FindRecordChilds(Id: integer): boolean;
     function  RemoveRecord(Id: integer): boolean;
     function  Root: TChartRecord;

     property Items[Index: integer]: TChartRecord read GetItems; default;
     property Parent: TChartRecord read FParent;
     property RecId: word read FRecId;
     property Length: word read FLength;
     property Data: PByteArray read FData;
     end;

type TChartRecordUpdate = class(TChartRecord)
private
     FUpdateEvent: TNotifyEvent;
public
     property OnUpdate: TNotifyEvent read FUpdateEvent write FUpdateEvent;
     end;

implementation

uses Escher2, DrawingObjChart2;

const DefaultRecordsSerieIndex = 22;

const DefaultRecordsLegend: array[0..7] of TDefaultRecord = (
(Id: $1033; Data: ''), //BEGIN:
(Id: $104F; Data: #$05#$00#$02#$00#$DB#$0D#$00#$00#$AB#$06#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // POS
(Id: $1025; Data: #$02#$02#$01#$00#$00#$00#$00#$00#$AF#$FF#$FF#$FF#$86#$FF#$FF#$FF#$00#$00#$00#$00#$00#$00#$00#$00#$B1#$00#$4D#$00#$A0#$15#$00#$00), // TEXT
(Id: $1033; Data: ''), //BEGIN:
(Id: $104F; Data: #$02#$00#$02#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // POS
(Id: $1051; Data: #$00#$01#$00#$00#$00#$00#$00#$00), // AI
(Id: $1034; Data: ''), //END:
(Id: $1034; Data: '')); //END:

const DefaultRecordsAll: array[0..82] of TDefaultRecord = (
(Id: $0809; Data: #$00#$06#$20#$00#$46#$18#$CD#$07#$C1#$80#$00#$00#$06#$02#$00#$00), // BOF
(Id: $0014; Data: ''), // HEADER
(Id: $0015; Data: ''), // FOOTER
(Id: $0083; Data: #$00#$00), // HCENTER
(Id: $0084; Data: #$00#$00), //VCENTER
(Id: $00A1; Data: #$09#$00#$64#$00#$01#$00#$01#$00#$01#$00#$00#$00#$58#$02#$58#$02#$00#$00#$00#$00#$00#$00#$E0#$3F#$00#$00#$00#$00#$00#$00#$E0#$3F#$01#$00), // SETUP
(Id: $0033; Data: #$03#$00),// ???
                                                           // Four extra bytes for pointer to the font.
(Id: $1060; Data: #$08#$16#$57#$12#$A0#$00#$00#$00#$F0#$00#$00#$00#$00#$00), // FBI:
(Id: $1060; Data: #$08#$16#$57#$12#$A0#$00#$01#$00#$F1#$00#$00#$00#$00#$00), // FBI:

(Id: $0012; Data: #$00#$00), // PROTECT
(Id: $1001; Data: #$00#$00), // UNITS:
(Id: $1002; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$E8#$7F#$21#$01#$00#$40#$BF#$00), // CHART:
(Id: $1033; Data: ''), // BEGIN:
(Id: $00A0; Data: #$01#$00#$01#$00), // SCL
(Id: $1064; Data: #$00#$00#$01#$00#$00#$00#$01#$00), // PLOTGROWTH:
(Id: $1032; Data: #$00#$00#$02#$00), // FRAME:
(Id: $1033; Data: ''), // BEGIN:
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$09#$00#$4D#$00), // LINEFORMAT:
(Id: $100A; Data: #$FF#$FF#$FF#$00#$00#$00#$00#$00#$01#$00#$01#$00#$4E#$00#$4D#$00), // AREAFORMAT:
(Id: $1034; Data: ''), // END:

(Id: $1003; Data: #$01#$00#$01#$00#$0A#$00#$0A#$00#$01#$00#$00#$00), // SERIES:
(Id: $1033; Data: ''), // BEGIN:
(Id: $1051; Data: #$00#$01#$00#$00#$00#$00#$00#$00), // AI:
(Id: $1051; Data: #$01#$02#$00#$00#$00#$00#$0B#$00#$3B#$00#$00#$00#$00#$09#$00#$00#$00#$00#$00), // AI:
(Id: $1051; Data: #$02#$00#$00#$00#$00#$00#$00#$00), // AI:
(Id: $1051; Data: #$03#$01#$00#$00#$00#$00#$00#$00), // AI:
(Id: $1006; Data: #$FF#$FF#$00#$00#$00#$00#$00#$00), // DATAFORMAT:
(Id: $1033; Data: ''), // BEGIN:
(Id: $105F; Data: #$00#$00),// ???
(Id: $1034; Data: ''), // END:
(Id: $1045; Data: #$00#$00), // SERTOCRT:
(Id: $1034; Data: ''), // END:
(Id: $1044; Data: #$0A#$00#$00#$00), // SHTPROPS:
(Id: $1024; Data: #$02#$00), // DEFAULTTEXT:
(Id: $1025; Data: #$02#$02#$01#$00#$00#$00#$00#$00#$CB#$FF#$FF#$FF#$AE#$FF#$FF#$FF#$00#$00#$00#$00#$00#$00#$00#$00#$B1#$00#$4D#$00#$A0#$09#$00#$00), // TEXT:
(Id: $1033; Data: ''), // BEGIN:
(Id: $104F; Data: #$02#$00#$02#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // POS:
(Id: $1026; Data: #$F0#$00), // FONTX:
(Id: $1051; Data: #$00#$01#$00#$00#$00#$00#$00#$00), // AI:
(Id: $1034; Data: ''), // END:
(Id: $1024; Data: #$03#$00), // DEFAULTTEXT:
(Id: $1025; Data: #$02#$02#$01#$00#$00#$00#$00#$00#$CB#$FF#$FF#$FF#$AE#$FF#$FF#$FF#$00#$00#$00#$00#$00#$00#$00#$00#$B1#$00#$4D#$00#$A0#$09#$00#$00), // TEXT:
(Id: $1033; Data: ''), // BEGIN:
(Id: $104F; Data: #$02#$00#$02#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // POS:
(Id: $1026; Data: #$F1#$00), // FONTX:
(Id: $1051; Data: #$00#$01#$00#$00#$00#$00#$00#$00), // AI:
(Id: $1034; Data: ''), // END:
(Id: $1046; Data: #$01#$00), // AXESUSED:
(Id: $1041; Data: #$00#$00#$94#$01#$00#$00#$47#$01#$00#$00#$23#$0B#$00#$00#$FD#$0B#$00#$00), // AXISPARENT:
(Id: $1033; Data: ''), // BEGIN:
(Id: $104F; Data: #$02#$00#$02#$00#$6A#$00#$00#$00#$A3#$00#$00#$00#$4D#$0C#$00#$00#$59#$0E#$00#$00), // POS:

(Id: $101D; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // AXIS:
(Id: $1033; Data: ''), // BEGIN:
(Id: $1020; Data: #$01#$00#$01#$00#$01#$00#$01#$00), // CATSERRANGE:
(Id: $1062; Data: #$00#$00#$00#$00#$01#$00#$00#$00#$01#$00#$00#$00#$00#$00#$00#$00#$EF#$00), // AXCEXT:
(Id: $101E; Data: #$02#$00#$03#$01#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$23#$00#$4D#$00#$00#$00), // TICK:
(Id: $1034; Data: ''), // END:

(Id: $101D; Data: #$01#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // AXIS:
(Id: $1033; Data: ''), // BEGIN:
(Id: $101F; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$1F#$01), // VALUERANGE:
(Id: $101E; Data: #$02#$00#$03#$01#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$23#$00#$4D#$00#$00#$00), // TICK:
(Id: $1021; Data: #$01#$00), // AXISLINEFORMAT:
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$FF#$FF#$09#$00#$4D#$00), // LINEFORMAT:
(Id: $1034; Data: ''), // END:

(Id: $1035; Data: ''), // PLOTAREA:
(Id: $1032; Data: #$00#$00#$03#$00), // FRAME:
(Id: $1033; Data: ''), // BEGIN:
(Id: $1007; Data: #$80#$80#$80#$00#$00#$00#$00#$00#$00#$00#$17#$00), // LINEFORMAT:
(Id: $100A; Data: #$C0#$C0#$C0#$00#$00#$00#$00#$00#$01#$00#$00#$00#$16#$00#$4F#$00), // AREAFORMAT:
(Id: $1034; Data: ''), // END:
(Id: $1014; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00), // CHARTFORMAT:
(Id: $1033; Data: ''), // BEGIN:
(Id: $1017; Data: #$00#$00#$96#$00#$00#$00), // BAR:
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), // CHARTFORMATLINK:

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: ''), // DefaultRecordsLegend

(Id: $1034; Data: ''), // END:
(Id: $1034; Data: ''), // END:
(Id: $1034; Data: ''), // END:
//(Id: $0200; Data: #$00#$00#$00#$00#$0A#$00#$00#$00#$00#$00#$01#$00#$00#$00), // DIMENSIONS
(Id: $1065; Data: #$02#$00), // SIINDEX:
(Id: $1065; Data: #$01#$00), // SIINDEX:
(Id: $1065; Data: #$03#$00), // SIINDEX:
(Id: $000A; Data: '')); // EOF

const DefaultRecordsStyleArea: array[0..11] of TDefaultRecord = (
(Id: $101A; Data: #$00#$00), //AREA
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), //CHARTFORMATLINK

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: ''), // DefaultRecordsLegend

(Id: $1006; Data: #$00#$00#$00#$00#$FD#$FF#$00#$00), //DATAFORMAT
(Id: $1033; Data: ''), //BEGIN
(Id: $105F; Data: #$00#$00), // GEOMETRY
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$FF#$FF#$09#$00#$4D#$00), //LINEFORMAT
(Id: $100A; Data: #$FF#$FF#$FF#$00#$00#$00#$00#$00#$01#$00#$01#$00#$4E#$00#$4D#$00), //AREAFORMAT
(Id: $100B; Data: #$00#$00), //PIEFORMAT
(Id: $1009; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$4D#$00#$4D#$00#$3C#$00#$00#$00), //MARKERFORMAT
(Id: $1034; Data: '')); //END

const DefaultRecordsStyleBarColumn: array[0..3] of TDefaultRecord = (
(Id: $1017; Data: #$00#$00#$96#$00#$01#$00), // BAR
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), // CHARTFORMATLINK

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: '')); // DefaultRecordsLegend

const DefaultRecordsStyleScatter: array[0..11] of TDefaultRecord = (
(Id: $101B; Data: #$64#$00#$01#$00#$00#$00), // SCATTER
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), // CHARTFORMATLINK

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: ''), // DefaultRecordsLegend

(Id: $1006; Data: #$00#$00#$00#$00#$FD#$FF#$00#$00), // DATAFORMAT
(Id: $1033; Data: ''), // BEGIN
(Id: $105F; Data: #$00#$00), // ???
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$FF#$FF#$09#$00#$4D#$00), // LINEFORMAT
(Id: $100A; Data: #$FF#$FF#$FF#$00#$00#$00#$00#$00#$01#$00#$01#$00#$4E#$00#$4D#$00), // AREAFORMAT
(Id: $100B; Data: #$00#$00), // PIEFORMAT
(Id: $1009; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$4D#$00#$4D#$00#$3C#$00#$00#$00), // MARKERFORMAT
(Id: $1034; Data: ''));// END

const DefaultRecordsStylePie: array[0..3] of TDefaultRecord = (
(Id: $1019; Data: #$00#$00#$00#$00#$02#$00), //PIE
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), //CHARTFORMATLINK
(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: '')); // DefaultRecordsLegend

const DefaultRecordsStyleLine: array[0..3] of TDefaultRecord = (
(Id: $1018; Data: #$00#$00), // Line
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), //CHARTFORMATLINK
(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: '')); // DefaultRecordsLegend

const DefaultRecordsStyleRadar: array[0..11] of TDefaultRecord = (
(Id: $103E; Data: #$01#$00#$12#$00), // RADAR
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), // CHARTFORMATLINK

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: ''), // DefaultRecordsLegend

(Id: $1006; Data: #$00#$00#$00#$00#$FD#$FF#$00#$00), // DATAFORMAT
(Id: $1033; Data: ''), // BEGIN
(Id: $105F; Data: #$00#$00), // _GEOMETRY_
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$FF#$FF#$09#$00#$4D#$00), // LINEFORMAT
(Id: $100A; Data: #$FF#$FF#$FF#$00#$00#$00#$00#$00#$01#$00#$01#$00#$4E#$00#$4D#$00), // AREAFORMAT
(Id: $100B; Data: #$00#$00), // PIEFORMAT
(Id: $1009; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$4D#$00#$4D#$00#$3C#$00#$00#$00), // MARKERFORMAT
(Id: $1034; Data: '')); // END

const DefaultRecordsStyleSurface: array[0..11] of TDefaultRecord = (
(Id: $103F; Data: #$01#$00), // SURFACE
(Id: $1022; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$0F#$00), // CHARTFORMATLINK

(Id: $1015; Data: #$DB#$0D#$00#$00#$AB#$06#$00#$00#$85#$01#$00#$00#$F4#$00#$00#$00#$03#$01#$1F#$00), // LEGEND
(Id: ID_CHARTRECORD_DEFAULTLEGEND; Data: ''), // DefaultRecordsLegend

(Id: $1006; Data: #$00#$00#$00#$00#$FD#$FF#$00#$00), // DATAFORMAT
(Id: $1033; Data: ''), // BEGIN
(Id: $105F; Data: #$00#$00), // _GEOMETRY_
(Id: $1007; Data: #$00#$00#$00#$00#$00#$00#$FF#$FF#$09#$00#$4D#$00), // LINEFORMAT
(Id: $100A; Data: #$FF#$FF#$FF#$00#$00#$00#$00#$00#$01#$00#$01#$00#$4E#$00#$4D#$00), // AREAFORMAT
(Id: $100B; Data: #$00#$00), // PIEFORMAT
(Id: $1009; Data: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$4D#$00#$4D#$00#$3C#$00#$00#$00), // MARKERFORMAT
(Id: $1034; Data: '')); // END

const DefaultRecordsDataformat: array[0..4] of TDefaultRecord = (
// (Id: $1033; Data: ''), // BEGIN
(Id: $105F; Data:  #$00#$00), // _GEOMETRY_
(Id: $1007; Data:  #$00#$00#$00#$00#$00#$00#$00#$00#$01#$00#$4F#$00), // LINEFORMAT
(Id: $100A; Data:  #$CC#$FF#$CC#$00#$FF#$FF#$FF#$00#$01#$00#$00#$00#$2A#$00#$09#$00), // AREAFORMAT
(Id: $100B; Data:  #$00#$00), // PIEFORMAT
(Id: $1009; Data:  #$00#$00#$00#$00#$00#$00#$00#$00#$02#$00#$01#$00#$4D#$00#$4D#$00#$3C#$00#$00#$00)); // MARKERFORMAT
// (Id: $1034; Data: '')); // END


{ TChartRecord }

function TChartRecord.FindFBIFont(Id: integer): TXFont;
var
  i: integer;
  Rec: TChartRecord;
begin
  Rec := Root;
  for i := 0 to Rec.Count - 1 do begin
    if (Rec[i].FRecId = CHARTRECID_FBI) and (PCRecFBI_Font(Rec[i].FData).Index = Id) then begin
      Result := TXFont(PCRecFBI_Font(Rec[i].FData).XFont);
      Exit;
    end;
  end;
  Result := Nil;
//  raise Exception.Create('Can not find FBI');
end;

function TChartRecord.FindRecord(Id: integer): integer;
begin
  for Result := 0 to Count - 1 do begin
    if Items[Result].RecId = Id then
      Exit;
  end;
  Result := -1;
end;

function TChartRecord.FindRecordChilds(Id: integer): boolean;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Items[i].Count > 0 then begin
      Result := Items[i].FindRecordChilds(Id);
      if Result then
        Exit;
    end;
    if Items[i].RecId = Id then begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function TChartRecord.GetItems(Index: integer): TChartRecord;
begin
  Result := TChartRecord(Inherited Items[Index]);
end;

function TChartRecord.InsertRecord(Index: integer; RecId, Length: word; IsUpdate: boolean = False): TChartRecord;
begin
  if Index < 0 then
    Index := Count;
  if IsUpdate then
    Insert(Index,TChartRecordUpdate.Create(Self,RecId,Length))
  else
    Insert(Index,TChartRecord.Create(Self,RecId,Length));
  Result := Items[Index];
end;

function TChartRecord.LastRec: TChartRecord;
begin
  if Count <= 0 then
    raise Exception.Create('Parent record is missing in chart');
  Result := Items[Count - 1];
end;

procedure TChartRecord.Read(Stream: TXLSStream; PBuf: PByteArray; Fonts: TXFonts);
var
  i: integer;
  H,Header: TBIFFHeader;
  RecId: word;
  P,Buf: PByteArray;
  Shape: TShapeOutsideMsoChart;
  SheetCharts: TSheetCharts;
  XFont: TXFont;
  O: TObject;
begin
  while Stream.ReadHeader(Header) = SizeOf(TBIFFHeader) do begin
    case Header.RecId of
      BIFFRECID_EOF: begin
        Stream.Read(PBuf^,Header.Length);
        Add(TChartRecord.Create(Self,Header,PBuf));
        Exit;
      end;
      BIFFRECID_MSODRAWING: begin
        i := Add(TChartRecord.Create(Self,Header,Nil));
        O := Items[i].Root.Parent;
        if O.ClassName = 'TShapeOutsideMsoChart' then begin
          Shape := TShapeOutsideMsoChart(Items[i].Root.Parent);
          Shape.Drawing := TEscherDrawing.Create(Shape.DrawingGroup,Nil,Nil);
          Shape.Drawing.LoadFromStream(Stream,PBuf);
        end
        else if O.ClassName = 'TSheetCharts' then begin
          SheetCharts := TSheetCharts(Items[i].Root.Parent);
          SheetCharts[SheetCharts.Count - 1].AddDrawing(TEscherDrawing.Create(SheetCharts.DrawingGroup,Fonts,Nil));
          SheetCharts[SheetCharts.Count - 1].Drawing.LoadFromStream(Stream,PBuf);
        end
        else
          raise Exception.Create('Chart record parent is not of excpected type');
      end;
      CHARTRECID_BEGIN: begin
        Items[Count - 1].Read(Stream,PBuf,Fonts);
      end;
      CHARTRECID_GELFRAME: begin
        H.Length := Header.Length;
        H.RecID := Header.RecID;
        Buf := AllocMem(H.Length);
        try
          Stream.Read(Buf^,Header.Length);
          repeat
            RecId := Stream.PeekHeader;
            if ((RecId = CHARTRECID_GELFRAME) or (RecId = BIFFRECID_CONTINUE)) then begin
              if Stream.ReadHeader(Header) <> SizeOf(TBIFFHeader) then
                Break;
              Stream.Read(PBuf^,Header.Length);

              ReAllocMem(Buf,H.Length + Header.Length);
              P := PByteArray(Integer(Buf) + H.Length);
              System.Move(PBuf^,P^,Header.Length);
              Inc(H.Length,Header.Length);
            end;
          until ((RecId <> CHARTRECID_GELFRAME) and (RecId <> BIFFRECID_CONTINUE));
          Add(TChartRecordUpdate.Create(Self,H,Buf));
        finally
          FreeMem(Buf);
        end;
      end;
      CHARTRECID_FBI: begin
        Stream.Read(PBuf^,Header.Length);
        Header.Length := SizeOf(TCRecFBI_Font);
        PCRecFBI_Font(PBuf).XFont := Fonts[PCRecFBI(PBuf).Index];
        TXFont(PCRecFBI_Font(PBuf).XFont).Unique := True;
        Add(TChartRecord.Create(Self,Header,PBuf));
      end;
      CHARTRECID_FONTX: begin
        Stream.Read(PBuf^,Header.Length);
//        Fonts[PCRecFONTX(PBuf).FontIndex].Unique := True;
        XFont := FindFBIFont(PCRecFONTX(PBuf).FontIndex);
        if XFont <> Nil then
          Add(TChartRecord.Create(Self,Header.RecId,XFont))
        else
          Add(TChartRecord.Create(Self,Header.RecId,Fonts[PCRecFONTX(PBuf).FontIndex]));
      end;
      CHARTRECID_END: begin
        Stream.Read(PBuf^,Header.Length);
        Exit;
      end;
      else begin
        if (Header.RecID and $00FF) = BIFFRECID_BOF then
          Stream.ReadUnencryptedSync(PBuf^,Header.Length)
        else
          Stream.Read(PBuf^,Header.Length);
        Add(TChartRecord.Create(Self,Header,PBuf));
      end;
    end;
  end;
end;

procedure TChartRecord.ReadDefault(DefRecs: array of TDefaultRecord; var Index: integer; Fonts: TXFonts);
var
  i: integer;
  Rec: TChartRecord;
  Header: TBIFFHeader;
begin
  while Index <= High(DefRecs) do begin
    Header.RecID := DefRecs[Index].Id;
    Header.Length := System.Length(DefRecs[Index].Data);
    case Header.RecId of
      BIFFRECID_EOF: begin
        Add(TChartRecord.Create(Self,Header,Nil));
        Exit;
      end;
      CHARTRECID_BEGIN: begin
        Inc(Index);
        if Count > 0 then
          Items[Count - 1].ReadDefault(DefRecs,Index,Fonts);
//        FChilds.ReadDefault(Index);
      end;
      CHARTRECID_END:
        Exit;
      CHARTRECID_FBI: begin
        Add(TChartRecord.Create(Self,Header,PByteArray(@DefRecs[Index].Data[1])));
        Rec := Items[Count - 1];
        PCRecFBI_Font(Rec.FData).XFont := Fonts.Add;
        TXFont(PCRecFBI_Font(Rec.FData).XFont).Unique := True;
      end;
      CHARTRECID_FONTX: begin
        Add(TChartRecord.Create(Self,Header.RecId,FindFBIFont(PCRecFONTX(@DefRecs[Index].Data[1]).FontIndex)));
      end;
      ID_CHARTRECORD_DEFAULTLEGEND: begin
        i := 0;
        ReadDefault(DefaultRecordsLegend,i,Fonts);
      end;
      else begin
        if Header.Length > 0 then
          Add(TChartRecord.Create(Self,Header,PByteArray(@DefRecs[Index].Data[1])))
        else
          Add(TChartRecord.Create(Self,Header,Nil));
      end;
    end;
    Inc(Index);
  end;
end;

procedure TChartRecord.Write(Stream: TXLSStream);
var
  i: integer;
  Buf: PByteArray;
  Shape: TShapeOutsideMsoChart;
  SheetCharts: TSheetCharts;
begin
  for i := 0 to Count - 1 do begin
    case Items[i].FRecId of
      CHARTRECID_GELFRAME: begin
        if (Items[i] is TChartRecordUpdate) and Assigned(TChartRecordUpdate(Items[i]).OnUpdate) then
          TChartRecordUpdate(Items[i]).OnUpdate(Self);
        Stream.WriteCONTINUE(CHARTRECID_GELFRAME,Items[i].FData^,Items[i].Length);
      end;
      BIFFRECID_MSODRAWING: begin
        GetMem(Buf,MAXRECSZ_97);
        try
          if Items[i].Root.Parent.ClassName = 'TShapeOutsideMsoChart' then begin
            Shape := TShapeOutsideMsoChart(Items[i].Root.Parent);
            Shape.Drawing.SaveToStream(Stream,Buf);
          end
          else if Items[i].Root.Parent.ClassName = 'TSheetCharts' then begin
            SheetCharts := TSheetCharts(Items[i].Root.Parent);
            SheetCharts[SheetCharts.CurrIndex].Drawing.SaveToStream(Stream,Buf);
          end
          else
            raise Exception.Create('Chart record parent is not of excpected type');
        finally
          FreeMem(Buf);
        end;
      end;
      CHARTRECID_FBI: begin
        Stream.WWord(Items[i].FRecId);
        PCRecFBI(Items[i].FData).Index := TXFont(PCRecFBI_Font(Items[i].FData).XFont).Index;
        Stream.WWord(SizeOf(TCRecFBI));
        Stream.Write(Items[i].FData^,SizeOf(TCRecFBI));
      end;
      CHARTRECID_FONTX: begin
        Stream.WWord(Items[i].FRecId);
        Stream.WWord(2);
        Stream.WWord(TXFont(Items[i].Data).Index);
      end;
      else begin
        Stream.WWord(Items[i].FRecId);
        Stream.WWord(Items[i].FLength);
        if Items[i].FLength > 0 then
          Stream.Write(Items[i].FData^,Items[i].FLength);
      end;
    end;
    if Items[i].Count > 0 then begin
      Stream.WriteHeader(CHARTRECID_BEGIN,0);
      Items[i].Write(Stream);
      Stream.WriteHeader(CHARTRECID_END,0);
    end;
  end;
end;

constructor TChartRecord.Create(Parent: TChartRecord; Header: TBIFFHeader; D: PByteArray);
begin
  inherited Create;
  GetMem(FData,Header.Length);
  if D <> Nil then
    System.Move(D^,FData^,Header.Length);
  FParent := Parent;
  FRecId := Header.RecID;
  FLength := Header.Length;
end;

constructor TChartRecord.Create(Parent: TChartRecord; RecId, Length: word);
begin
  inherited Create;
  GetMem(FData,Length);
  FParent := Parent;
  FRecId := RecID;
  FLength := Length;
end;

constructor TChartRecord.Create(Parent: TChartRecord; RecId: word; Obj: TObject);
begin
  inherited Create;
  FData := PByteArray(Obj);
  FParent := Parent;
  FRecId := RecID;
  FLength := 0;
end;

destructor TChartRecord.Destroy;
var
  Fonts: TXFonts;
begin
  if (RecId = CHARTRECID_FONTX) and (Root.Parent.ClassName = 'TShapeOutsideMsoChart') then begin
    Fonts := TShapeOutsideMsoChart(Root.Parent).Fonts;
    if not TXFont(FData).Unique and (TXFont(FData).Index < Fonts.Count) then
      Fonts.Delete(TXFont(FData).Index);
  end
  else if FLength > 0 then begin
    FreeMem(FData);
    FLength := 0;
  end;
  FData := Nil;
  inherited;
end;

procedure TChartRecord.Resize(Delta: integer);
begin
  Inc(FLength,Delta);
  ReAllocMem(FData,FLength);
end;

procedure TChartRecord.ReadDefaultRecords(RecData: TDefaultRecordData);
var
  i: integer;
  Fonts: TXFonts;
begin
  Fonts := TShapeOutsideMsoChart(Root.Parent).Fonts;
  i := 0;
  case RecData of
    drdAll:            ReadDefault(DefaultRecordsAll,i,Fonts);
    drdLegend:         ReadDefault(DefaultRecordsLegend,i,Fonts);
    drdSerie: begin
      i := DefaultRecordsSerieIndex;
      ReadDefault(DefaultRecordsAll,i,Fonts);
    end;
    drdDataformat:     ReadDefault(DefaultRecordsDataformat,i,Fonts);
    drdStyleArea:      ReadDefault(DefaultRecordsStyleArea,i,Fonts);
    drdStyleBarColumn: ReadDefault(DefaultRecordsStyleBarColumn,i,Fonts);
    drdStyleLine:      ReadDefault(DefaultRecordsStyleLine,i,Fonts);
    drdStylePie:       ReadDefault(DefaultRecordsStylePie,i,Fonts);
    drdStyleRadar:     ReadDefault(DefaultRecordsStyleRadar,i,Fonts);
    drdStyleScatter:   ReadDefault(DefaultRecordsStyleScatter,i,Fonts);
    drdStyleSurface:   ReadDefault(DefaultRecordsStyleSurface,i,Fonts);
  end;
end;

function TChartRecord.RemoveRecord(Id: integer): boolean;
var
  i: integer;
begin
  i := FindRecord(Id);
  Result := i >= 0;
  if Result then
    Delete(i);
end;

function TChartRecord.Root: TChartRecord;
begin
  Result := Self;
  while (Result <> Nil) and (Result.FRecId <> ID_CHARTRECORDROOT) do
    Result := Result.FParent;
  if Result.FRecId <> ID_CHARTRECORDROOT then
    Result := Nil;
end;

end.
