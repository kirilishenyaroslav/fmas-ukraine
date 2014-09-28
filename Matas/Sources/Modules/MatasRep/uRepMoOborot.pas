{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepMoOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, FIBQuery, pFIBQuery, ibase, DateUtils,
  FIBDatabase, pFIBDatabase, FR_Class, FR_DSet, FR_DBSet, DB, FIBDataSet,
  pFIBDataSet, cxButtonEdit, cxCheckBox, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  uSpMatSchEx, uSpMatOtv, uSpMatSchMulti, uMatasUtils, uMatasVars, uResources,
  frxClass, frxExportXLS, frxExportRTF, frxDesgn, frxDBSet;

procedure ShowRepMoOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepMoOborot;

type
  TMoOborotRepForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    LabelSch: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxReport: TcxComboBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxLookupSch: TcxButtonEdit;
    cxMatOtv: TcxButtonEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    RepDataSet: TpFIBDataSet;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxReport1: TfrxReport;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth1, MatasYear1: Word;
   MatasMonth2, MatasYear2: Word;
   PERIOD: TDateTime;
   ID_SESSION: integer;
   ID_SCH, TIP_SCH: integer;
   ID_MO: integer;
   FILTER_ID_SESSION: integer;
   F_SCH, F_MO: boolean;
   Reports: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  MoOborotRepForm: TMoOborotRepForm;

implementation

{$R *.dfm}
procedure ShowRepMoOborot(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TMoOborotRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TMoOborotRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_OMO ;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear1:=dy;
   MatasMonth1:=dm;
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=MatasMonth1-1;
   self.cxYearBeg.Value:=MatasYear1;
   self.cxMonthEnd.ItemIndex:=MatasMonth1-1;
   self.cxYearEnd.Value:=MatasYear1;
 end;
 ID_SESSION:=0;
end;

procedure TMoOborotRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TMoOborotRepForm.ActionOkExecute(Sender: TObject);
begin
 OkButtonClick(self);
end;

procedure TMoOborotRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMoOborotRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TMoOborotRepForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end
end;

procedure TMoOborotRepForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res : Variant;
begin
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then
 begin
  ID_MO:=Res[0];
  cxMatOtv.Text:=VarToStr(Res[1])+' / '+VarToStr(Res[2]);
 end
 else
  ID_MO:=0;
end;

procedure TMoOborotRepForm.cxLookupSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  ID_SCH:=0;
  F_SCH:=false;
 end
end;

procedure TMoOborotRepForm.cxLookupSchPropertiesButtonClick(
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
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxLookupSch.Text:='';
 end;
end;

procedure TMoOborotRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
 period_str:string;
begin
 if ID_MO=0 then
  exit;
 w:=ShowWaitWindow(self);
 MatasYear1:=cxYearBeg.Value;
 MatasMonth1:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
 MatasYear2:=cxYearEnd.Value;
 MatasMonth2:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear2, MatasMonth2);

 if cxReport.ItemIndex=0 then
 begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_OBOROT_BY_PERIOD(:PID_MO, :PDATE_BEG, :PDATE_END)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY SCH_NUMBER, NAME');
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  RepDataSet.ParamByName('PDATE_END').Value:=DEND;
  RepDataSet.CloseOpen(false);
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\oborot_mo1.fr3');
 end;



 if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
  period_str:=AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)
 else
  period_str:='ПЕРІОД З '+AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)+' ПО '+AnsiUpperCase(cxMonthEnd.Text)+' '+IntToStr(cxYearEnd.Value);
 frxReport1.Variables['PERIOD']:=''''+period_str+'''';
 frxReport1.Variables['DATE_BEG']:=''''+DateToStr(DBEG)+'''';
 frxReport1.Variables['DATE_END']:=''''+DateToStr(IncDay(DEND))+'''';
 frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
 frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
 CloseWaitWindow(w);

 frxReport1.PrepareReport;
 if cxCopies.Value>1 then
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
 if cxCheckOnPrinter.Checked then
 begin
  if cxSelectPrinter.Checked then
   frxReport1.PrintOptions.ShowDialog:=True
  else
   frxReport1.Print;
 end
 else
  if cxCheckBox1.Checked then
   frxReport1.DesignReport
   else frxReport1.ShowReport;
end;

procedure TMoOborotRepForm.FormCreate(Sender: TObject);
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
 F_MO:=false;
 cxReport.ItemIndex:=0;
end;

end.
