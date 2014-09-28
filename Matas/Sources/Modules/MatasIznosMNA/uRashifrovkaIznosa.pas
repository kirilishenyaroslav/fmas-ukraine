unit uRashifrovkaIznosa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, frxClass, frxDBSet, frxDesgn,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet, ActnList, StdCtrls, cxButtons, cxSpinEdit,
  cxCheckBox, cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase, DateUtils, uMatasVars,
  uMatasUtils, uSpMatOtv, uSpMatSchMulti, frxExportRTF;

type
  TPrintIznosForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl5: TLabel;
    SchSelect: TcxButtonEdit;
    MolSelect: TcxButtonEdit;
    ReportBox: TcxComboBox;
    cxSelectPrinter: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxCheckEditRep: TcxCheckBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxYear: TcxSpinEdit;
    cxMonth: TcxComboBox;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
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
    frxRTFExport1: TfrxRTFExport;
    ds_1: TpFIBDataSet;
    ds_2: TpFIBDataSet;
    pds_1: TfrxDBDataset;
    pds_2: TfrxDBDataset;
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
     F_SCH, F_MOL: boolean;
     ID_MO, ID_SCH:Integer;
     SCH_NUMBER:String;
     FILTER_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;
procedure ShowRazshifrIznosMNAForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;
exports ShowRazshifrIznosMNAForm;

var
  PrintIznosForm: TPrintIznosForm;

implementation

{$R *.dfm}

procedure ShowRazshifrIznosMNAForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;
var
    form : TPrintIznosForm;
begin
    form := TPrintIznosForm.Create(AOwner, DBHANDLE, ID_USER);
    Form.Show;
end;

constructor TPrintIznosForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
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
  DecodeDate(_MATAS_PERIOD, dy, dm, dd);
  LoadMonthTocxComboBox(cxMonth);
  LoadMonthTocxComboBox(cxMonthEnd);
  cxMonth.ItemIndex:=dm-1;
  cxYear.Value:=dy;
  cxMonthEnd.ItemIndex:=dm-1;
  cxYearEnd.Value:=dy;
  FILTER_ID_SESSION:=DB.Gen_Id('MAT_ID_SESSION',1,TR);
  F_SCH:=False;
  F_MOL:=False;
 end;
end;
procedure TPrintIznosForm.actCancelExecute(Sender: TObject);
begin
Close;
end;

procedure TPrintIznosForm.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPrintIznosForm.MolSelectPropertiesButtonClick(Sender: TObject;
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
   F_MOl:=True;
  end
  else F_MOL:=False;
end;

procedure TPrintIznosForm.SchSelectPropertiesButtonClick(Sender: TObject;
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

procedure TPrintIznosForm.FormCreate(Sender: TObject);
begin
ReportBox.ItemIndex:=0;
end;

procedure TPrintIznosForm.actPrintExecute(Sender: TObject);
VAR  dm, dy: Word;
     zapros, prefix:string;
      w: TForm;
      DBEG,DEND:TDateTime;
begin
  DBEG:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
  DEND:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  w:=ShowWaitWindow(self);
  DM:=cxMonth.ItemIndex +1;
  dy:= cxYear.Value;
   if ((ReportBox.ItemIndex = 0) or (ReportBox.ItemIndex = 2)) then
  begin
    MolSelect.Enabled:=False;
    zapros:= 'Select * from MAT_POS_LINK_IZNOS(:DATE_BEG, :DATE_END) A ';
    prefix:= ' WHERE ';
    if F_MOL then
    begin
      zapros:=zapros + prefix + ' A.ID_MO_IN = '+IntToStr(ID_MO);
      prefix:=' AND ';
    end;

    if F_SCH then
    begin
      zapros:= zapros+ prefix+' (A.FIRST_DB_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
      zapros:= zapros+' OR  A.first_db_bal_id_sch IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))';
    end;

    zapros:= zapros+' order by A.first_db_bal_sch_number, A.first_db_sch_number, A.Fio_in, A.Name';
    if ReportBox.ItemIndex = 0 then
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_for_doc.fr3');

    if ReportBox.ItemIndex = 2 then
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_new.fr3');

    MolSelect.Enabled:=True;
  end;

  if ((ReportBox.ItemIndex = 1) or (ReportBox.ItemIndex = 3)) then
  begin
    MolSelect.Enabled:=False;
    zapros:= 'Select * from MAT_POS_LINK_IZNOS_KR(:DATE_BEG, :DATE_END) A ';
    prefix:= 'WHERE ';
    if F_MOL then
    begin
      zapros:=zapros + prefix + 'A.ID_MO_IN = '+IntToStr(ID_MO);
      prefix:=' AND ';
    end;
    if F_SCH then
    begin
      zapros:= zapros+ prefix+' A.FIRST_KR_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
      zapros:= zapros+' OR  A.first_kr_bal_id_sch IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')';
    end;
    zapros:= zapros+' order by A.first_kr_bal_sch_number, A.first_kr_sch_number, A.Fio_in, A.Name';

    if ReportBox.ItemIndex = 1 then
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_for_doc_kr.fr3');

    if ReportBox.ItemIndex = 3 then
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MNA_iznos_new_kr.fr3');

    MolSelect.Enabled:=True;
  end;
  if ReportBox.ItemIndex = 4 then
  begin
    zapros:='Select * from MAT_POS_LINK_IZNOS_EX (:DATE_BEG, :DATE_END) order by name';
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MatReportMO17.fr3');

    ds_1.Close;
    ds_1.SelectSQL.Clear;
    ds_1.SelectSQL.Add('Select SEC_DB_SCH_NUMBER, SUM(SUMMA_IZNOS) from MAT_POS_LINK_IZNOS_EX (:DATE_BEG, :DATE_END) group by 1');
    ds_1.Prepare;
    ds_1.ParamByName('DATE_BEG').AsDate:= DBEG;
    ds_1.ParamByName('DATE_End').AsDate:= DEND;
    ds_1.CloseOpen(False);

    ds_2.Close;
    ds_2.SelectSQL.Clear;
    ds_2.SelectSQL.Add('Select SEC_KR_SCH_NUMBER, SUM(SUMMA_IZNOS) from MAT_POS_LINK_IZNOS_EX (:DATE_BEG, :DATE_END) group by 1') ;
    ds_2.Prepare;
    ds_2.ParamByName('DATE_BEG').AsDate:= DBEG;
    ds_2.ParamByName('DATE_End').AsDate:= DEND;
    ds_2.CloseOpen(False);
  end;

   DS.Close;
  DS.SelectSQL.Clear;
  DS.SelectSQL.Add(zapros);
  DS.Prepare;
  DS.ParamByName('DATE_BEG').AsDate:= DBEG;
  DS.ParamByName('DATE_End').AsDate:= DEND;
  DS.CloseOpen(False);
//  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvKartDateExpl.fr3');
  frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
  frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
  frxReport1.Variables['DATE_BEG']:=''''+DateToStr(DBEG)+'''';
  frxReport1.Variables['DATE_END']:=''''+DateToStr(DEND)+'''';
  frxReport1.Variables['NUM']:=''''+'Меморіальний ордер №17'+'''';
  CloseWaitWindow(w);

   frxReport1.PrepareReport;
    frxReport1.PrintOptions.ShowDialog:=True;
   if cxCopies.Value>1 then
    frxReport1.PrintOptions.Copies:=cxCopies.Value;
  if cxCheckOnPrinter.Checked then
     frxReport1.Print
    else
    frxReport1.ShowReport;

    if cxCheckEditRep.Checked then
     frxReport1.DesignReport;

end;

end.
