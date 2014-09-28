//******************************************************************************
// Проект "Контракты"
// Печать договоров
// Перчак А.Л. 2008
//******************************************************************************
unit Unit_cn_PrintDogovor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxLookAndFeelPainters, cxButtons, iBase, cxDropDownEdit,
  cxImageComboBox,cn_common_types, frxClass, frxDBSet, frxDesgn,
  cxProgressBar, cn_common_funcs, ActnList, cxSpinEdit, cxCheckBox, cxLabel,
  frxBarcode, frxExportHTML, frxExportPDF, frxExportImage, frxExportRTF,
  frxExportXLS, Registry, uZProc;

Const
 MonthRU:array[1..12]of string=('Января','Февраля','Марта','Апреля','Мая','Июня','Июля','Августа','Сентября','Октября','Ноября','Декабря');
 MonthUK:array[1..12]of string=('Січня','Лютого','Березня','Квітня','Травня','Червня','Липня','Серпня','Вересня','Жовтня','Листопада','Грудня');

type
  TForm_cn_printDogovor = class(TForm)
    PD_Database: TpFIBDatabase;
    PD_Transaction: TpFIBTransaction;
    Shablon: TLabel;
    Button_print: TcxButton;
    Button_cancel: TcxButton;
    PD_Box: TcxComboBox;
    PD_DataSet: TpFIBDataSet;
    PD_DBDataset: TfrxDBDataset;
    ActionList1: TActionList;
    acDebug: TAction;
    DataSet_stage_opl: TpFIBDataSet;
    PD_BDataset_stage_opl: TfrxDBDataset;
    OnPrint: TcxCheckBox;
    kol_exampl: TcxSpinEdit;
    cxLabel1: TcxLabel;
    close_act: TAction;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    PD_Report: TfrxReport;
    procedure Button_cancelClick(Sender: TObject);
    procedure LoadReportsTocxComboBox;
    procedure Button_printClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PD_BoxPropertiesChange(Sender: TObject);
    procedure close_actExecute(Sender: TObject);
  private
    IndexReg, Length_list : Integer;
  public
   IsDebugMode: boolean;
   res:Variant;
   ATmpl: array of string;
   id_dogovor,id_dog_root:int64;
   draft_f : Integer;
   constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

 function PrintDogovor(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports PrintDogovor;

var
  PLanguageIndex:integer;

implementation

{$R *.dfm}
function PrintDogovor(AParameter:TcnSimpleParamsEx):Variant;
var
 ViewForm:TForm_cn_printDogovor;
begin
 ViewForm := TForm_cn_printDogovor.Create(AParameter);
 ViewForm.FormStyle:= fsNormal;
 ViewForm.ShowModal;
 ViewForm.free;
end;

procedure TForm_cn_printDogovor.LoadReportsTocxComboBox;
var
  i: integer;
  Reg : TRegistry;
begin
  PD_Transaction.StartTransaction;
  PD_DataSet.Close;
  Pd_DataSet.SelectSQL.Clear;
  PD_DataSet.SelectSQL.add('Select * From cn_ini_report_tmpl where IS_USE=:ais_use and REP_GROUP=:aRep_group order by NAME_REPORT');
  Pd_DataSet.ParamByName('ais_use').AsInteger:=1;
  PD_DataSet.ParamByName('aRep_Group').AsString := 'Dogovora';
  PD_DataSet.Open;

  PD_DataSet.FetchAll;

  SetLength(ATmpl, PD_DataSet.RecordCount);
  PD_Box.Properties.Items.Clear;
  Length_list := PD_DataSet.RecordCount;

  i:=0;
  while not PD_DataSet.Eof do
   begin
    PD_Box.Properties.Items.Add(PD_DataSet.FieldByName('NAME_REPORT').AsString);
    ATmpl[i]:=PD_DataSet.FieldByName('NAME_FILE').AsString;
    i:=i+1;
    PD_DataSet.Next;
  end;
  PD_Transaction.Commit;
  PD_DataSet.close;

  IndexReg := 0;
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\Print_Dogs_list2\',False)
    then indexReg := StrToInt(reg.ReadString('index'));
   finally
    reg.Free;
  end;

  if indexReg > Length_list
   then PD_Box.ItemIndex := 0
   else PD_Box.ItemIndex := IndexReg;
end;

constructor TForm_cn_printDogovor.Create(AParameter:TcnSimpleParamsEx);
begin
 inherited Create(AParameter.Owner);
 if Assigned(AParameter.Db_Handle) then
 begin
  self.PD_Database.Handle:=AParameter.Db_Handle;
  self.PD_Database.Connected:=true;
  self.id_dogovor:=AParameter.cnParamsToPakage.ID_DOG;
  self.id_dog_root:=AParameter.cnParamsToPakage.ID_DOG_ROOT;
  PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex();
  draft_f := AParameter.cnParamsToPakage.Is_collect;
 end;
end;

procedure TForm_cn_printDogovor.Button_cancelClick(Sender: TObject);
begin
 Close;
end;

Function MonthNumberToName(MonthNumber:Word):String;
Begin
 Case PLanguageIndex of
  //---RU---
   2:begin
      If (MonthNumber<=12)and(MonthNumber>0)
       then result:=MonthRU[MonthNumber]
       Else Result:='ERROR';
     End;
  //---UK---
   1:begin
      If (MonthNumber<=12)and(MonthNumber>0)
       then result:=MonthUK[MonthNumber]
       Else Result:='ERROR';
     End;
   Else Result:='ERROR';
 End;
End;

procedure TForm_cn_printDogovor.Button_printClick(Sender: TObject);
Var
 aName_File                       : String;
 D_DOG,M_DOG,Y_DOG                : Word;
 D_BEG_DOG, M_BEG_DOG, Y_BEG_DOG  : Word;
 S_D_PAS,S_M_PAS,S_Y_PAS          : Word;
 FIZ_D_PAS,FIZ_M_PAS,FIZ_Y_PAS    : Word;
 PRED_D_PAS,PRED_M_PAS,PRED_Y_PAS : Word;
 S,pat1,pat2                      : String;
 reg                              : TRegistry;
 sum_str, out_sum_str             : string;
 kol                              : Integer;
begin
 reg := TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\Contracts\Print_Dogs_list2\', True)
   then reg.WriteString('index', IntToStr(PD_Box.ItemIndex));
 finally
   reg.Free;
 end;

 Screen.Cursor:=crHourGlass;

 aName_File:=ATmpl[PD_Box.ItemIndex];

 PD_Report.Clear;
 PD_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+aName_File);
 PD_Report.Variables.Clear;

  //сумма прописью
  sum_str := SumToString(Pd_DataSet['SUMM_DOG'], 1);
  out_sum_str := '';
  for kol := 1 to Length(sum_str) do
   if sum_str[kol] = ''''
    then out_sum_str := out_sum_str + '"'
    else out_sum_str := out_sum_str + sum_str[kol];

  PD_Report.Variables['SUM_P']  := ''''+ out_sum_str + '''';

  //дата начала действия договора
  If Pd_DataSet['BEG_DOG'] <> null Then
   Begin
    DecodeDate(Pd_DataSet['BEG_DOG'],Y_BEG_DOG, M_BEG_DOG, D_BEG_DOG);
    PD_Report.Variables['Y_BEG_DOG']  := ''''+ IntToStr(Y_BEG_DOG) + '''';

    If MonthNumberToName(M_BEG_DOG)<>'ERROR'
     Then PD_Report.Variables['M_BEG_DOG']  := ''''+ MonthNumberToName(M_BEG_DOG) + ''''
     Else PD_Report.Variables['M_BEG_DOG']  := ''''+ '''';

    PD_Report.Variables['D_BEG_DOG']  := ''''+ IntToStr(D_BEG_DOG) + '''';
   End
  Else
   Begin
    PD_Report.Variables['Y_BEG_DOG']  := ''''+ '''';
    PD_Report.Variables['M_BEG_DOG']  := ''''+ '''';
    PD_Report.Variables['D_BEG_DOG']  := ''''+ '''';
   End;

//---Дата подписания договора---
 If Pd_DataSet['DATE_DOG'] <> null Then
  Begin
   DecodeDate(Pd_DataSet['DATE_DOG'],Y_DOG,M_DOG,D_DOG);
   PD_Report.Variables['Y_DOG']  := ''''+ IntToStr(Y_DOG) + '''';

   If MonthNumberToName(M_DOG)<>'ERROR'
    Then PD_Report.Variables['M_DOG']  := ''''+ MonthNumberToName(M_DOG) + ''''
    Else PD_Report.Variables['M_DOG']  := ''''+ '''';

   PD_Report.Variables['D_DOG']  := ''''+ IntToStr(D_DOG) + '''';
  End
 Else
   Begin
    PD_Report.Variables['Y_DOG']  := ''''+ '''';
    PD_Report.Variables['M_DOG']  := ''''+ '''';
    PD_Report.Variables['D_DOG']  := ''''+ '''';
   End;

//---Дата выдачи паспорта студента---
 If Pd_DataSet['S_PAS_DATE'] <> null Then
  Begin
   DecodeDate(Pd_DataSet['S_PAS_DATE'],S_Y_PAS,S_M_PAS,S_D_PAS);
   PD_Report.Variables['S_Y_PAS']  := ''''+ IntToStr(S_Y_PAS) + '''';

   If MonthNumberToName(S_M_PAS)<>'ERROR'
    Then PD_Report.Variables['S_M_PAS']  := ''''+ MonthNumberToName(S_M_PAS) + ''''
    Else PD_Report.Variables['S_M_PAS']  := ''''+ '''';

   PD_Report.Variables['S_D_PAS']  := ''''+ IntToStr(S_D_PAS) + '''';
  End
 Else
   Begin
    PD_Report.Variables['S_Y_PAS']  := ''''+ '''';
    PD_Report.Variables['S_M_PAS']  := ''''+ '''';
    PD_Report.Variables['S_D_PAS']  := ''''+ '''';
   End;
//---Дата выдачи паспорта физического лица---
 If Pd_DataSet['FIZ_PAY_PAS_DATE'] <> null Then
  Begin
   DecodeDate(Pd_DataSet['FIZ_PAY_PAS_DATE'],FIZ_Y_PAS,FIZ_M_PAS,FIZ_D_PAS);
   PD_Report.Variables['FIZ_Y_PAS']  := ''''+ IntToStr(FIZ_Y_PAS) + '''';

   If MonthNumberToName(FIZ_M_PAS)<>'ERROR'
    Then PD_Report.Variables['FIZ_M_PAS']  := ''''+ MonthNumberToName(FIZ_M_PAS) + ''''
    Else PD_Report.Variables['FIZ_M_PAS']  := ''''+ '''';

   PD_Report.Variables['FIZ_D_PAS']  := ''''+ IntToStr(FIZ_D_PAS) + '''';
  End
 Else
   Begin
    PD_Report.Variables['FIZ_Y_PAS']  := ''''+ '''';
    PD_Report.Variables['FIZ_M_PAS']  := ''''+ '''';
    PD_Report.Variables['FIZ_D_PAS']  := ''''+ '''';
   End;
//---Дата выдачи паспорта представителя---
 If Pd_DataSet['PRED_PAS_DATE'] <> null Then
  Begin
   DecodeDate(Pd_DataSet['PRED_PAS_DATE'],PRED_Y_PAS,PRED_M_PAS,PRED_D_PAS);
   PD_Report.Variables['PRED_Y_PAS']  := ''''+ IntToStr(PRED_Y_PAS) + '''';

   If MonthNumberToName(PRED_M_PAS)<>'ERROR'
    Then PD_Report.Variables['PRED_M_PAS']  := ''''+ MonthNumberToName(PRED_M_PAS) + ''''
    Else PD_Report.Variables['PRED_M_PAS']  := ''''+ '''';

   PD_Report.Variables['PRED_D_PAS']  := ''''+ IntToStr(PRED_D_PAS) + '''';
  End
 Else
   Begin
    PD_Report.Variables['PRED_Y_PAS']  := ''''+ '''';
    PD_Report.Variables['PRED_M_PAS']  := ''''+ '''';
    PD_Report.Variables['PRED_D_PAS']  := ''''+ '''';
   End;
//------------------------------------------------------------------------------
 IF Pd_DataSet['S_PAS_VIDAN']<> null Then
  Begin
   S:=Pd_DataSet['S_PAS_VIDAN'];
   pat1:=copy(S,1,32);
   Delete(S,1,32);
   pat2:=S;
   PD_Report.Variables['S_PAS_VIDAN_PAT1']  := '''' +PAT1+ '''';
   PD_Report.Variables['S_PAS_VIDAN_PAT2']  := '''' +PAT2+ '''';
  End
 Else
   Begin
    PD_Report.Variables['S_PAS_VIDAN_PAT1']  := '''' + '''';
    PD_Report.Variables['S_PAS_VIDAN_PAT2']  := '''' + '''';
   End;

 IF Pd_DataSet['FIZ_PAY_PAS_VIDAN']<> null Then
  Begin
   S:=Pd_DataSet['FIZ_PAY_PAS_VIDAN'];
   pat1:=copy(S,1,32);
   Delete(S,1,32);
   pat2:=S;
   PD_Report.Variables['FIZ_PAS_VIDAN_PAT1']  := '''' +PAT1+ '''';
   PD_Report.Variables['FIZ_PAS_VIDAN_PAT2']  := '''' +PAT2+ '''';
  End
 Else
   Begin
    PD_Report.Variables['FIZ_PAS_VIDAN_PAT1']  := '''' + '''';
    PD_Report.Variables['FIZ_PAS_VIDAN_PAT2']  := '''' + '''';
   End;

 IF Pd_DataSet['PRED_PAS_VIDAN']<> null Then
  Begin
   S:=Pd_DataSet['PRED_PAS_VIDAN'];
   pat1:=copy(S,1,32);
   Delete(S,1,32);
   pat2:=S;
   PD_Report.Variables['PRED_PAS_VIDAN_PAT1']  := '''' +PAT1+ '''';
   PD_Report.Variables['PRED_PAS_VIDAN_PAT2']  := '''' +PAT2+ '''';
  End
 Else
   Begin
    PD_Report.Variables['PRED_PAS_VIDAN_PAT1']  := '''' + '''';
    PD_Report.Variables['PRED_PAS_VIDAN_PAT2']  := '''' + '''';
   End;
//------------------------------------------------------------------------------
 If Pd_DataSet['S_KAT']='Бакалавр'
  then
   begin
    PD_Report.Variables['S_PROF']:=''''+Pd_DataSet['S_SPEC']+'''';
    PD_Report.Variables['S_SPEC']:=''''+'''';
   End
  else
   Begin
    PD_Report.Variables['S_PROF']:=''''+'''';
    PD_Report.Variables['S_SPEC']:=''''+Pd_DataSet['S_SPEC']+'''';
   End;

 PD_Report.Variables['SUMM_IN_SEMESTR']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR1']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR2']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR3']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR4']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR1_SEM']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR2_SEM']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR3_SEM']:=''''+'0'+'''';
 PD_Report.Variables['SUMM_YEAR4_SEM']:=''''+'0'+'''';
 if draft_f = 1
  then PD_Report.Variables['Draft'] := 1
  else PD_Report.Variables['Draft'] := 0;
//------------------------------------------------------------------------------
  PD_Report.PrintOptions.Copies:=kol_exampl.Value;
//  PD_Report.PrintOptions.Reverse:=true;

 PD_Report.PrepareReport(True);
 if IsDebugMode then
  Begin
   Screen.Cursor:=crDefault;
   PD_Report.DesignReport
  End
 else
   if OnPrint.Checked then PD_REport.print
                      else PD_Report.ShowReport;

 //PD_DataSet.Close;

 Screen.Cursor:=crDefault;
// close;
end;

procedure TForm_cn_printDogovor.FormCreate(Sender: TObject);
begin
 IsDebugMode:=false;
end;

procedure TForm_cn_printDogovor.acDebugExecute(Sender: TObject);
begin
  if IsDebugMode then
                  Begin
                   IsDebugMode:=false;
                   Caption:='Друк контракту';
                  End
                 Else
                  Begin
                   IsDebugMode:=true;
                   Caption:=Caption+' *debug';
                  End;
end;

procedure TForm_cn_printDogovor.FormShow(Sender: TObject);
Var
   Cur_date:TDateTime;
begin
  cur_date:=date;
  LoadReportsTocxComboBox;
  //Pd_Box.ItemIndex:=0;

  DataSet_stage_opl.Close;
  DataSet_stage_opl.SelectSQL.Clear;
  DataSet_stage_opl.SelectSQL.add('SELECT * FROM CN_DT_GET_STAGE_OPL_FOR_PRINT(:Id_Dog_root,:Id_dog)');
  DataSet_stage_opl.ParamByName('Id_Dog_root').AsInt64:=id_dog_root;
  DataSet_stage_opl.ParamByName('Id_Dog').AsInt64:=id_dogovor;
  DataSet_stage_opl.open;

  // PD_Transaction.StartTransaction;
  Pd_DataSet.Close;
  PD_DataSet.SelectSQL.Clear;
  Pd_DataSet.SelectSQL.add('SELECT * FROM cn_dogovor_print(:Id_Dogovor,:cur_date)');
  Pd_DataSet.ParamByName('Id_Dogovor').AsInt64:=id_dogovor;
  Pd_DataSet.ParamByName('cur_date').AsDate:=Cur_date;
  Pd_DataSet.open;

  If PD_DataSet['COL_EXAMPL'] <> null then kol_exampl.Value := PD_DataSet['COL_EXAMPL'];
end;

procedure TForm_cn_printDogovor.PD_BoxPropertiesChange(Sender: TObject);
begin
  Button_print.SetFocus;
end;

procedure TForm_cn_printDogovor.close_actExecute(Sender: TObject);
begin
  close;
end;

end.

