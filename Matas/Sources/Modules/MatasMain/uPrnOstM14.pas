{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPrnOstM14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, FIBDatabase,
  pFIBDatabase, FR_Class, DB, FIBDataSet, pFIBDataSet, FR_DSet, FR_DBSet,
  FR_Desgn, DBCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FIBQuery, pFIBQuery,
  pFIBStoredProc, DateUtils, cxSpinEdit, uMatasVars;

type
  TfmOstM14Print = class(TForm)
    PrintDialog1: TPrintDialog;
    frDBDataSet1: TfrDBDataSet;
    pFIBDatabase1: TpFIBDatabase;
    frReport1: TfrReport;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSet2: TpFIBDataSet;
    cxButtonDruk: TcxButton;
    cxButtonSbros: TcxButton;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    Label1: TLabel;
    pFIBDataSet2ID_OST: TFIBIntegerField;
    pFIBDataSet2ID_MO: TFIBIntegerField;
    pFIBDataSet2FIO: TFIBStringField;
    pFIBDataSet2SFIO: TFIBStringField;
    pFIBDataSet2NAME_DEPARTMENT: TFIBStringField;
    pFIBDataSet2ID_SCH: TFIBIntegerField;
    pFIBDataSet2ID_NOMN: TFIBIntegerField;
    pFIBDataSet2NOMN: TFIBStringField;
    pFIBDataSet2NAME: TFIBStringField;
    pFIBDataSet2ID_UNIT: TFIBIntegerField;
    pFIBDataSet2UNIT: TFIBStringField;
    pFIBDataSet2PRICE: TFIBBCDField;
    pFIBDataSet2KOL_MAT01: TFIBBCDField;
    pFIBDataSet2SUMMA01: TFIBBCDField;
    pFIBDataSet2KOL_MAT02: TFIBBCDField;
    pFIBDataSet2SUMMA02: TFIBBCDField;
    pFIBDataSet2KOL_MAT03: TFIBBCDField;
    pFIBDataSet2SUMMA03: TFIBBCDField;
    pFIBDataSet2KOL_MAT04: TFIBBCDField;
    pFIBDataSet2SUMMA04: TFIBBCDField;
    pFIBDataSet2KOL_MAT05: TFIBBCDField;
    pFIBDataSet2SUMMA05: TFIBBCDField;
    pFIBDataSet2KOL_MAT06: TFIBBCDField;
    pFIBDataSet2SUMMA06: TFIBBCDField;
    pFIBDataSet2KOL_MAT07: TFIBBCDField;
    pFIBDataSet2SUMMA07: TFIBBCDField;
    pFIBDataSet2KOL_MAT08: TFIBBCDField;
    pFIBDataSet2SUMMA08: TFIBBCDField;
    pFIBDataSet2KOL_MAT09: TFIBBCDField;
    pFIBDataSet2SUMMA09: TFIBBCDField;
    pFIBDataSet2KOL_MAT10: TFIBBCDField;
    pFIBDataSet2SUMMA10: TFIBBCDField;
    pFIBDataSet2KOL_MAT11: TFIBBCDField;
    pFIBDataSet2SUMMA11: TFIBBCDField;
    pFIBDataSet2KOL_MAT12: TFIBBCDField;
    pFIBDataSet2SUMMA12: TFIBBCDField;
    pFIBDataSet2SCH_NUMBER: TFIBStringField;
    pFIBDataSet2NAME_SCH: TFIBStringField;
    procedure cxButtonSbrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonDrukClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
   ID_MO: integer;
   CurPeriod: TDateTime;
   ID_SCH: integer;
   PMode: integer;
  end;

var
  fmOstM14Print: TfmOstM14Print;

implementation

{$R *.dfm}

procedure TfmOstM14Print.cxButtonSbrosClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOstM14Print.FormCreate(Sender: TObject);
begin
   cxButtonSbros.Caption:='Отмена';
   cxButtonDruk.Caption:='Печать';
   ID_MO:=-1;
   CurPeriod:=Date;
   PMode:=-1;
end;

procedure TfmOstM14Print.cxButtonDrukClick(Sender: TObject);
var
 dm, dy: Word;
 DBEG, DEND: TDateTime;
 i: integer;
 cVar: string;
begin
 dy:=cxYearEnd.Value;
 dm:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(dy, dm);
 dy:=cxYearEnd.Value;
 dm:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(dy, dm);
// frVariables['period'] := DateToStr( StartOfTheMonth(CurPERIOD));
 if (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
  frVariables['PERIOD']:='за '+cxMonthBeg.Text+' '+IntToStr(cxYearEnd.Value)
 else
  frVariables['PERIOD']:='c '+cxMonthBeg.Text+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
 for i:=1 to 12 do
 begin
  if i<10 then cVar:='D0' else cVar:='D';
  cVar:=cVar+trim(IntToStr(i));
  if (cxMonthBeg.ItemIndex+1<=i) and (i<=cxMonthEnd.ItemIndex+1) then
   frVariables[cVar]:=DateToStr(StartOfAMonth(dy, i))
  else
   frVariables[cVar]:='';
 end;
 pFIBDataSet2.Close;
 pFIBDataSet2.ParamByName('ID_MO').Value:=ID_MO;
 pFIBDataSet2.ParamByName('DATE_BEG').Value:=DBEG;
 pFIBDataSet2.ParamByName('DATE_END').Value:=DEND;
 pFIBDataSet2.CloseOpen(false);
 frDBDataSet1.DataSet:=pFIBDataSet2;
 frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Ost_m14.frf');
 frReport1.PrepareReport;
 frReport1.ShowPreparedReport;
 if CheckBox1.Checked then frReport1.DesignReport;
  close;
end;

procedure TfmOstM14Print.FormShow(Sender: TObject);
var
  dd, dm, dy: Word;
begin
 DecodeDate(CurPERIOD, dy, dm, dd);
 cxMonthBeg.ItemIndex:=dm-1;
 cxMonthEnd.ItemIndex:=dm-1;
 cxYearEnd.Value:=dy;
end;

end.
