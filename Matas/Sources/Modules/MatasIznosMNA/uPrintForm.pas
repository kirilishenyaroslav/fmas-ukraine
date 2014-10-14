unit uPrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxSpinEdit, cxCheckBox,
  cxLookAndFeelPainters, ActnList, cxButtons, ibase, DateUtils, uMatasVars,
  uMatasUtils, uSpMatOtv, uSpMatSchMulti, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet, frxDesgn;

type
  TPrintForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    SchSelect: TcxButtonEdit;
    MolSelect: TcxButtonEdit;
    ReportBox: TcxComboBox;
    cxSelectPrinter: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    lbl6: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckEditRep: TcxCheckBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    actlst1: TActionList;
    actPrint: TAction;
    actCancel: TAction;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    ST: TpFIBStoredProc;
    TR: TpFIBTransaction;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    lbl4: TLabel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MolSelectPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SchSelectPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
    ID_USER : Int64;

  public
     F_SCH: boolean;
     ID_MO, ID_SCH:Integer;
     SCH_NUMBER:String;
     FILTER_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;
procedure ShowIznosMNAForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;
exports ShowIznosMNAForm;
var
  PrintForm: TPrintForm;

implementation

{$R *.dfm}
procedure ShowIznosMNAForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;
var
    form : TPrintForm;
begin
    form := TPrintForm.Create(AOwner, DBHANDLE,ID_USER);
    Form.Show;
end;

constructor TPrintForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
 Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;

   ReportBox.ItemIndex:=0;
   cxCheckEditRep.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);

 //PERIOD:=_MATAS_PERIOD;
 DecodeDate(_MATAS_PERIOD, dy, dm, dd);
  LoadMonthTocxComboBox(cxMonth);
  cxMonth.ItemIndex:=dm-1;
  cxYear.Value:=dy;

 FILTER_ID_SESSION:=DB.Gen_Id('MAT_ID_SESSION',1,TR);
 end;
end;


procedure TPrintForm.actCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPrintForm.MolSelectPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk: boolean;
 dm, dy: Word;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty then
  begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
  // cxButtonEditMVO.Text:=FioMO+' / '+SpodrMO;
   MolSelect.Text:=FioMO+' / '+SpodrMO;
  end;

end;

procedure TPrintForm.SchSelectPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
 FILTER_ID_SESSION:=DB.Gen_Id('MAT_ID_SESSION',1,TR);

 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   SchSelect.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  SchSelect.Text:='';
 end;

end;

procedure TPrintForm.FormCreate(Sender: TObject);
begin
ReportBox.ItemIndex:=0;
end;

procedure TPrintForm.actPrintExecute(Sender: TObject);
VAR  dm, dy: Word;
     zapros, prefix:string;
      w: TForm;
      DBEG,DEND:TDateTime;
begin
  DBEG:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
 // DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  w:=ShowWaitWindow(self);
//  DM:=cxMonth.ItemIndex +1;
//  dy:= cxYear.Value;
    if ReportBox.ItemIndex = 0 then
  begin
   prefix:=' WHERE ';
   zapros:='SELECT * FROM MAT_IZNOS_MNA(:DATE_BEG) A';
   if ID_MO<>0 then
   begin
    zapros:= zapros+prefix+' ID_MO='+IntToStr(id_mo);
    prefix:=' AND ';
   end;
   if F_SCH then
   begin
    zapros:= zapros+ prefix+' (A.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    zapros:= zapros+'OR A.BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))';
   end;
   zapros:= zapros+' order by A.sch_number, A.fio, A.NNUM, A.NAME_NOMN';
   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_sch_mo.fr3');
  end;

 if ReportBox.ItemIndex = 1 then
  begin
  zapros:='SELECT * FROM MAT_IZNOS_MNA(:DATE_BEG) A';
  prefix:=' WHERE ';
   if ID_MO<>0 then
   begin
    zapros:= zapros+prefix+' ID_MO='+IntToStr(id_mo);
    prefix:=' AND ';
   end;
   if F_SCH then
   begin
    zapros:= zapros+ prefix+' (A.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    zapros:= zapros+'OR A.BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))';
   end;
  zapros:= zapros+' order by A.sch_number, A.fio, A.NNUM, A.NAME_NOMN';
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_mo_sch.fr3');
  end;

  if ReportBox.ItemIndex = 2 then
  begin
  zapros:='SELECT A.id_sch, A.sch_number, A.sch_title, A.bal_id_sch, A.bal_sch_number, A.bal_sch_title, A.id_mo, A.fio, A.sfio, A.name_department, SUM(A.SUMMA), SUM(A.SUMMA_AM), SUM(A.ost_st) FROM MAT_IZNOS_MNA(:DATE_BEG) A';
  prefix:=' WHERE ';
   if ID_MO<>0 then
   begin
    zapros:= zapros+prefix+' ID_MO='+IntToStr(id_mo);
    prefix:=' AND ';
   end;
   if F_SCH then
   begin
    zapros:= zapros+ prefix+' (A.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    zapros:= zapros+'OR A.BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))';
   end;
  zapros:= zapros+' group by A.id_sch, A.sch_number, A.sch_title, A.bal_id_sch, A.bal_sch_number, A.bal_sch_title, A.id_mo, A.fio, A.sfio, A.name_department';
  zapros:= zapros+' order by A.sch_number, A.fio, A.NNUM, A.NAME_NOMN';
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos.fr3');
  end;

  if ReportBox.ItemIndex = 3 then
  begin
  zapros:='SELECT A.id_sch, A.sch_number, A.sch_title, A.bal_id_sch, A.bal_sch_number, A.bal_sch_title, SUM(A.SUMMA), SUM(A.SUMMA_AM), SUM(A.ost_st) FROM MAT_IZNOS_MNA(:DATE_BEG) A';
  prefix:=' WHERE ';
   if F_SCH then
   begin
    zapros:= zapros+ prefix+' (A.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    zapros:= zapros+'OR A.BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))';
   end;
  zapros:= zapros+' group by A.id_sch, A.sch_number, A.sch_title, A.bal_id_sch, A.bal_sch_number, A.bal_sch_title';
  zapros:= zapros+' order by A.sch_number';
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_for_sch.fr3');
  end;

 { if ReportBox.ItemIndex = 4 then
  begin
    MolSelect.Enabled:=False;
    zapros:= 'Select * from MAT_POS_LINK_IZNOS(:DATE_BEG, :DATE_END) A ';
    prefix:= 'WHERE';
    if F_SCH then
    begin
    // zapros:= zapros+ prefix+' A.FIRST_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
     zapros:= zapros+ prefix+' A.FIRST_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
   //  zapros:= zapros+' OR  A.first_db_bal_id_sch IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
     zapros:= zapros+' OR  A.first_kr_bal_id_sch IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    end;
    zapros:= zapros+' order by A.first_kr_sch_number';
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_for_doc.fr3');
    MolSelect.Enabled:=True;
  end;  }
  DS.Close;
  DS.SelectSQL.Clear;
 // showmessage(zapros );
  DS.SelectSQL.Add(zapros);
  DS.Prepare;
  //if ReportBox.ItemIndex<>4 then
  DS.ParamByName('DATE_BEG').AsDate:= DBEG;
{  else
  begin
   DS.ParamByName('DATE_BEG').AsDate:= DBEG;
   DS.ParamByName('DATE_End').AsDate:= DEND;
  end; }
//  ShowMessage(DS.SelectSQL.Text);
  DS.CloseOpen(False);
//  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvKartDateExpl.fr3');
  frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
  frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
  frxReport1.Variables['PERIOD']:=''''+DateToStr(DBEG)+'''';
  CloseWaitWindow(w);

   frxReport1.PrepareReport;
    frxReport1.PrintOptions.ShowDialog:=True;
   if cxCopies.Value>1 then
    frxReport1.PrintOptions.Copies:=cxCopies.Value;
 //   frxReport1.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;

    if cxCheckOnPrinter.Checked then
     frxReport1.Print
    else
    if cxCheckEditRep.Checked then
     frxReport1.DesignReport
     else frxReport1.ShowReport;

// frxReport1.DesignReport;
end;

end.
