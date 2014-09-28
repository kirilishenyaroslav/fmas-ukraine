{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, ComCtrls, cxButtons,
  cxSpinEdit, cxMRUEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, DateUtils, ibase,
  uSpMatOtv, GlobalSPR, cxCheckBox, uResources, cxButtonEdit,
  cxCurrencyEdit, uMatasVars, uSpCustWork, uPackageManager, uMatasUtils,
  uSpMatSchMulti, uSpMatSch, uMatasFilter, ActnList;

type
  TDocWorkFilterForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    cxFilterTipd: TcxLookupComboBox;
    Label5: TLabel;
    cxFilterDateBeg: TcxDateEdit;
    cxFilterDateEnd: TcxDateEdit;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ClearButton: TcxButton;
    cxFilterPrefix: TcxCheckBox;
    cxFilterMoOut: TcxButtonEdit;
    cxFilterMoIn: TcxButtonEdit;
    cxFilterCust: TcxButtonEdit;
    cxFilterNumDoc: TcxTextEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxFilterSummaBeg: TcxCurrencyEdit;
    cxFilterSummaEnd: TcxCurrencyEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxFilterWorkDoc: TcxComboBox;
    Label13: TLabel;
    cxFilterGroup: TcxButtonEdit;
    Label14: TLabel;
    cxFilterNomn: TcxButtonEdit;
    cxFilterOnSumma: TcxCheckBox;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    cxCheckWorkPeriod: TcxCheckBox;
    LabelSch: TLabel;
    cxSchList: TcxButtonEdit;
    Label15: TLabel;
    cxOperParamList: TcxButtonEdit;
    cxFilterDate: TcxCheckBox;
    ActionList1: TActionList;
    acClose: TAction;
    acFilter: TAction;
    procedure ClearButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure cxFilterTipdPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxFilterMoOutPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterCustPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterMoInPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterOnSummaPropertiesChange(Sender: TObject);
    procedure cxFilterNomnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterWorkDocPropertiesChange(Sender: TObject);
    procedure cxCheckWorkPeriodPropertiesChange(Sender: TObject);
    procedure cxSchListPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterMoOutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxFilterMoInKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxFilterCustKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxOperParamListPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxFilterDatePropertiesChange(Sender: TObject);
    procedure cxFilterLinktoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure acCloseExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
  private
    function GetWorkDateBeg: TDateTime;
    procedure SetWorkDateBeg(const Value: TDateTime);
    procedure SetWorkDateEnd(const Value: TDateTime);
    function GetWorkDateEnd: TDateTime;
    { Private declarations }
  public
   DBHANDLE: TISC_DB_HANDLE;
   F_DATE_BEG, F_DATE_END: TDateTime;
   F_IS_DATE_BEG, F_IS_DATE_END: boolean;
   F_ID_TIPD, F_ID_MO_IN, F_ID_MO_OUT: integer;
   F_ID_CUST: int64;
   F_TIPD, F_FIO_MO_IN, F_FIO_MO_OUT, F_NAME_CUST: string;
   F_NUM_DOC: string;
   F_DOC_WORK: integer;
   FILTER_ID_SESSION: integer;
   F_SCH_LIST: string;
   F_OPER_PARAM: string;
   F_SCH: boolean;
   F_IS_NOMN: Boolean;
   F_IS_GROUP: Boolean;
   property F_WORK_DATE_BEG: TDateTime read GetWorkDateBeg write SetWorkDateBeg;
   property F_WORK_DATE_END: TDateTime read GetWorkDateEnd write SetWorkDateEnd;
  end;

var
  DocWorkFilterForm: TDocWorkFilterForm;

implementation

uses uDocWork, uDocWorkFilterSch;

{$R *.dfm}

procedure TDocWorkFilterForm.ClearButtonClick(Sender: TObject);
begin
 cxFilterDateBeg.EditValue:=StartOfTheMonth(_MATAS_PERIOD);
 cxFilterDateEnd.EditValue:=EndOfTheMonth(_MATAS_PERIOD);
 cxFilterTipd.Text:='';
 cxFilterMoOut.Text:='';
 cxFilterMoIn.Text:='';
 cxFilterCust.Text:='';
 cxFilterNumDoc.Text:='';
 cxFilterWorkDoc.ItemIndex:=0;
 F_DOC_WORK:=0;
 F_ID_TIPD:=-1;
 F_ID_MO_IN:=-1;
 F_ID_MO_OUT:=-1;
 F_ID_CUST:=-1;
 F_TIPD:='';
 F_FIO_MO_IN:='';
 F_FIO_MO_OUT:='';
 F_NAME_CUST:='';
 F_IS_DATE_BEG:=false;
 F_IS_DATE_END:=false;
 F_NUM_DOC:='';
 F_SCH:=false;
 F_SCH_LIST:='';
 F_OPER_PARAM:='';
 cxFilterOnSumma.Checked:=false;
 cxFilterSummaBeg.EditValue:=0;
 cxFilterSummaEnd.EditValue:=0;
 
 FILTER_ID_SESSION:=(Owner as TDocWorkForm).GetNewFilterID;
 cxSchList.Text:='';
 cxOperParamList.Text:='';
 cxFilterNomn.Text:='';
end;

procedure TDocWorkFilterForm.OkButtonClick(Sender: TObject);
begin
  if cxFilterDateBeg.EditText='' then
   F_DATE_BEG:=StrToDate('01.01.1900')
  else
   F_DATE_BEG:=cxFilterDateBeg.EditValue;
  if cxFilterDateEnd.EditText='' then
   F_DATE_END:=StrToDate('31.12.3999')
  else
   F_DATE_END:=cxFilterDateEnd.EditValue;
  if cxFilterMoOut.Text='' then
   F_ID_MO_OUT:=-1;
  if cxFilterMoIn.Text='' then
   F_ID_MO_IN:=-1;
  if cxFilterCust.Text='' then
   F_ID_CUST:=-1;
  F_TIPD:=cxFilterTipd.Text;
  F_FIO_MO_IN:=cxFilterMoIn.Text;
  F_FIO_MO_OUT:=cxFilterMoOut.Text;
  F_NAME_CUST:=cxFilterCust.Text;
  F_IS_DATE_BEG:=false;
  F_IS_DATE_END:=false;
  F_NUM_DOC:=cxFilterNumDoc.Text;
  F_DOC_WORK:=cxFilterWorkDoc.ItemIndex;
  F_OPER_PARAM:=cxOperParamList.Text;
  F_SCH_LIST:=cxSchList.Text;
  cxFilterNomn.Text:=AnsiUpperCase(cxFilterNomn.Text);
end;

procedure TDocWorkFilterForm.cxFilterTipdPropertiesChange(Sender: TObject);
begin
 if cxFilterTipd.EditText='' then
  F_ID_TIPD:=0
 else
  F_ID_TIPD:=cxFilterTipd.EditValue;
end;

procedure TDocWorkFilterForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 ClearButton.Caption:=MAT_BUTTON_CLEAR_CONST;
 LoadMonthTocxComboBox(cxMonthBeg);
 LoadMonthTocxComboBox(cxMonthEnd);
end;

procedure TDocWorkFilterForm.cxFilterMoOutPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, F_ID_MO_OUT);
  if  VarType(Res) <> varEmpty
   then begin
{
  ResultArray[0] := Self.MatOtvDataSet['ID_MO'];
  ResultArray[1] := Self.MatOtvDataSet['FIO'];
  ResultArray[2] := Self.MatOtvDataSet['NAME_DEPARTMENT'];
  ResultArray[3] := Self.MatOtvDataSet['COMMENT'];
  ResultArray[4] := Self.MatOtvDataSet['SFIO'];
}
    F_ID_MO_OUT:=Res[0];
    cxFilterMoOut.Text := Res[1]+' / '+Res[2];
    F_FIO_MO_OUT:=Res[1]+' / '+Res[2];
  end;
end;

procedure TDocWorkFilterForm.cxFilterCustPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpCustWork.GetCustomers(self, self.DBHANDLE, 0, fsNormal, Date, csmCustomers, F_ID_CUST, -1, false, -1);
 if  VarType(Res) <> varEmpty then
 begin
    F_ID_CUST:=Res[0];
    cxFilterCust.Text := Res[2];
    F_NAME_CUST:=Res[2];
 end;
end;

procedure TDocWorkFilterForm.cxFilterMoInPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
  Res:=uSpMatOtv.GetMatOtv(self, self.DBHANDLE, 0, F_ID_MO_IN);
  if  VarType(Res) <> varEmpty
   then begin
    F_ID_MO_IN:=Res[0];
    cxFilterMoIn.Text := Res[1]+' / '+Res[2];
    F_FIO_MO_IN:=Res[1]+' / '+Res[2];
  end;
end;

procedure TDocWorkFilterForm.cxFilterOnSummaPropertiesChange(
  Sender: TObject);
begin
 cxFilterSummaBeg.Enabled:=cxFilterOnSumma.Checked;
 cxFilterSummaEnd.Enabled:=cxFilterOnSumma.Checked;
end;

procedure TDocWorkFilterForm.cxFilterNomnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  str: string;
begin
  str:=ShowFilterParam(Self, DBHANDLE, FILTER_ID_SESSION, 30, _MATAS_PERIOD, 'ТМЦ');
  if str='' then
    F_IS_NOMN:=false
  else begin
    F_IS_NOMN:=true;
  end;
  cxFilterNomn.Text:=str;
end;

function TDocWorkFilterForm.GetWorkDateBeg: TDateTime;
begin
 Result:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
end;

procedure TDocWorkFilterForm.SetWorkDateBeg(const Value: TDateTime);
var
 dd, dm, dy: Word;
begin
 DecodeDate(Value, dy, dm, dd);
 cxYearBeg.Value:=dy;
 cxMonthBeg.ItemIndex:=dm-1;
end;

procedure TDocWorkFilterForm.SetWorkDateEnd(const Value: TDateTime);
var
 dd, dm, dy: Word;
begin
 DecodeDate(Value, dy, dm, dd);
 cxYearEnd.Value:=dy;
 cxMonthEnd.ItemIndex:=dm-1;
end;

function TDocWorkFilterForm.GetWorkDateEnd: TDateTime;
begin
 Result:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
end;

procedure TDocWorkFilterForm.cxFilterWorkDocPropertiesChange(
  Sender: TObject);
begin
 if cxFilterWorkDoc.ItemIndex=1 then
 begin
  cxCheckWorkPeriod.Enabled:=true;
  cxOperParamList.Enabled:=true;
 end
 else begin
  cxCheckWorkPeriod.Enabled:=false;
  cxOperParamList.Enabled:=false;
 end;
end;

procedure TDocWorkFilterForm.cxCheckWorkPeriodPropertiesChange(
  Sender: TObject);
begin
 cxMonthBeg.Enabled:=cxCheckWorkPeriod.Checked;
 cxMonthEnd.Enabled:=cxCheckWorkPeriod.Checked;
 cxYearBeg.Enabled:=cxCheckWorkPeriod.Checked;
 cxYearEnd.Enabled:=cxCheckWorkPeriod.Checked;
end;

procedure TDocWorkFilterForm.cxSchListPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxSchList.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxSchList.Text:='';
 end;
end;

procedure TDocWorkFilterForm.cxFilterMoOutKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  F_ID_MO_OUT:=-1;
  cxFilterMoOut.Text := '';
  F_FIO_MO_OUT:='';
 end;
end;

procedure TDocWorkFilterForm.cxFilterMoInKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  F_ID_MO_IN:=-1;
  cxFilterMoIn.Text := '';
  F_FIO_MO_IN:='';
 end;
end;

procedure TDocWorkFilterForm.cxFilterCustKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  F_ID_CUST:=-1;
  cxFilterCust.Text := '';
  F_NAME_CUST:='';
 end;

end;

procedure TDocWorkFilterForm.cxOperParamListPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  T: TMatasFilterOper;
  s: string;
begin
  T:=TMatasFilterOper.Create(Self, DBHANDLE, FILTER_ID_SESSION);
  T.ShowFilter;
  if T.DB_SCH_LIST<>'' then
   s:=s+'Дб: '+T.DB_SCH_LIST+' ';
  if T.KR_SCH_LIST<>'' then
   s:=s+'Кр: '+T.KR_SCH_LIST+' ';
  if T.SM_LIST<>'' then
   s:=s+'Бюджет: '+T.SM_LIST+' ';
  if T.RZ_ST_LIST<>'' then
   s:=s+'Ст.: '+T.RZ_ST_LIST+' ';
  if T.KEKV_LIST<>'' then
   s:=s+'КЕКВ: '+T.KEKV_LIST+' ';
  cxOperParamList.Text:=s;
  T.Free;
end;

procedure TDocWorkFilterForm.cxFilterDatePropertiesChange(Sender: TObject);
begin
  if not cxFilterDate.Checked then
  begin
    cxFilterDateBeg.Enabled:=False;
    cxFilterDateEnd.Enabled:=False;
    cxFilterDateBeg.EditValue:=StrToDate('01.01.1900');
    cxFilterDateEnd.EditValue:=StrToDate('31.12.9999');
  end;
  if cxFilterDate.Checked then
  begin
    cxFilterDateBeg.Enabled:=True;
    cxFilterDateEnd.Enabled:=True;
    cxFilterDateBeg.EditValue:=StartOfTheMonth(Date);
    cxFilterDateEnd.EditValue:=EndOfTheMonth(Date);
  end;
end;

procedure TDocWorkFilterForm.cxFilterLinktoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  str: string;
begin
  str:=ShowFilterParam(Self, DBHANDLE, FILTER_ID_SESSION, 5, _MATAS_PERIOD, 'Групи ТМЦ');
  if str='' then
    F_IS_GROUP:=false
  else begin
    F_IS_GROUP:=true;
  end;
  cxFilterGroup.Text:=str;
end;

procedure TDocWorkFilterForm.acCloseExecute(Sender: TObject);
begin
  CancelButton.Click;
end;

procedure TDocWorkFilterForm.acFilterExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.

