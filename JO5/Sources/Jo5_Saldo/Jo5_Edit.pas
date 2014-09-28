unit Jo5_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMaskEdit, cxButtonEdit, cxDBEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,Ibase,
  Jo5_Types, Jo5_SaldoDM,Jo5_PackageLoad,Jo5_PackageConst, cxLabel,
  ExtCtrls,GlobalSpr;

type
  TfmEdit = class(TForm)
    ButtonCancel: TcxButton;
    EditSch: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    EditSchTitle: TcxTextEdit;
    EditSmetaTitle: TcxTextEdit;
    EditRazdTitle: TcxTextEdit;
    EditStatTitle: TcxTextEdit;
    EditKekvTitle: TcxTextEdit;
    EditSaldo: TcxMaskEdit;
    EditKekv: TcxButtonEdit;
    ButtonOK: TcxButton;
    EditStat: TcxMaskEdit;
    EditRazd: TcxMaskEdit;
    EditSmeta: TcxButtonEdit;
    procedure EditRazdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
   
    procedure EditKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaExit(Sender: TObject);
    procedure EditRazdExit(Sender: TObject);
    procedure EditStatExit(Sender: TObject);
    procedure EditRazdClick(Sender: TObject);
    procedure EditStatClick(Sender: TObject);
    procedure EditSchExit(Sender: TObject);
    procedure EditKekvExit(Sender: TObject);
    procedure EditKekvKeyPress(Sender: TObject; var Key: Char);
    procedure EditStatKeyPress(Sender: TObject; var Key: Char);
    procedure EditSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure EditSchKeyPress(Sender: TObject; var Key: Char);
    procedure EditSmetaKeyPress(Sender: TObject; var Key: Char);
    procedure EditRazdKeyPress(Sender: TObject; var Key: Char);
  private
  public
    x:TJo5ObjectSaldo;
    id_system:integer;
    DateAct:Tdate;
  end;

function ShowEditForm(Param:TJo5ObjectSaldo):variant;

implementation

uses FIBQuery, pFIBStoredProc;
{$R *.dfm}

//******************************************************************************
function ShowEditForm(Param:TJo5ObjectSaldo):variant;
var  Form:TfmEdit;
begin
  Form:=TfmEdit.Create(Param.Owner);
  Form.x:=TJo5ObjectSaldo.create;
  dm.StProc.Transaction.active:=true;
  dm.StProc.StoredProcName:='JO5_DATE';
  dm.StProc.Prepare;
  dm.StProc.ParamByName('ID_SYSTEM').asinteger:=Param.id_system;
  dm.StProc.ExecProc;
  Form.dateAct:=dm.StProc.ParamByName('date_setup').asdate;
  Form.x:=Param;
  Form.id_system:= Param.id_system;
  if Form.x.id_saldo<>null then
  begin
     Form.EditSaldo.Text  :=FloatToStr(Form.x.saldo);
     Form.EditRazd.Text   :=Form.x.razd_num;
     Form.EditStat.Text   :=Form.x.stat_num;
     Form.EditSch.Text    :=Form.x.sch_num;
     Form.EditSmeta.Text  :=Form.x.smet_kod;
     Form.EditKekv.Text   :=Form.x.kekv_kod;

     Form.EditRazdTitle.Text   :=Form.x.razd_Title;
     Form.EditStatTitle.Text   :=Form.x.stat_Title;
     Form.EditSchTitle.Text    :=Form.x.sch_Title;
     Form.EditSmetaTitle.Text  :=Form.x.smet_Title;
     Form.EditKekvTitle.Text   :=Form.x.kekv_Title;

  end;

  Result := Form.ShowModal;
  if Result=mrYes then result:=Form.x.id_saldo
  else Result := NULL;
  Form.Destroy;
end;
//******************************************************************************
procedure TfmEdit.EditRazdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var   id:Variant;
begin
    id:=GlobalSPR.GetSmets(self, x.DB_Handle,  DateAct,   psmRazdSt);
    if VarArrayDimCount(id)>0 then
    begin
      x.id_smeta    :=id[0];
      x.id_razd     :=id[1];
      x.id_sTAT     :=id[2];
      EditRazd.Text:=id[7];
      EditStat.Text:=id[8];
      EditSmeta.Text:=id[9];
    end;
end;
//******************************************************************************
procedure TfmEdit.EditSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var  Res:variant;
begin
  Res:=GlobalSpr.GetSch(self, x.DB_Handle, fsStayOnTop,DateAct, DEFAULT_ROOT_ID, x.id_system, 0);
if VarArrayDimCount(RES)=1 then
begin
  x.id_sch      :=RES[0][0];
  x.sch_num     :=RES[0][3];
  EditSchTitle.text:=RES[0][1];
  EditSch.Text  :=x.sch_num;
  EditSmeta.SetFocus;
end;
end;

//******************************************************************************
procedure TfmEdit.EditKekvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var id:Variant;
begin
    id:=GlobalSpr.GetKEKVSpr(self,x.DB_Handle,fsNormal,DateAct,DEFAULT_ROOT_ID);
    if VarArrayDimCount(id)>0then
    begin
     x.id_kekv:= id[0][0];
     EditKekvTitle.text:=id[0][1];
     x.kekv_kod:=id[0][2];
     EditKekv.text:=x.kekv_kod;
     EditSaldo.SetFocus;
    end;
end;
//******************************************************************************
procedure TfmEdit.ButtonOKClick(Sender: TObject);
begin
 IF  (X.id_razd=NULL) OR (X.id_kekv=NULL)
 OR (X.id_sTAT=NULL) OR (X.id_sch=NULL)
 OR (X.id_smeta=NULL) THEN
  begin
    ShowMessage('Введіть усі данні!');
    exit;
  end;
  try
    StrToFloat(EditSaldo.Text);
  except
    ShowMessage('Помилковий ввод у сумі');
    exit
  end;
  DM.StProcTransaction.active:=true;
  WITH DM.StProc DO
  BEGIN
    Transaction.active:=true;
    if x.ID_doc=null then
    begin
      StoredProcName:='JO5_DOC_I';
      Prepare;
      ParamByName('coment').AsString:=x.koment;
      ParamByName('id_user').AsInteger:=x.User.ID_User;
      ParamByName('ID_SYSTEM').asinteger:=id_system;
      ExecProc;
      x.id_doc:=ParamByName('id_doc').AsInteger;
    end;
    if x.id_saldo<>null then  StoredProcName:='JO5_SALDO_DOC_U'
    else  StoredProcName:='JO5_SALDO_DOC_I';
    Prepare;
    if x.id_saldo<>null then ParamByName('id_SALDO').AsInteger:=x.id_saldo;
    ParamByName('SALDO').AsExtended:=StrToFloat(EditSaldo.Text);
    ParamByName('ID_SCH').AsInteger:=x.Id_Sch;
    ParamByName('ID_SMET').AsInteger:=x.Id_smeta;
    ParamByName('ID_STAT').AsInteger:=x.Id_stat;
    ParamByName('ID_KEKV').AsInteger:=x.Id_kekv;
    ParamByName('ID_DOC').Asvariant:=x.Id_doc;
   ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;
    if x.id_saldo=null then x.id_saldo:=ParamByName('ID_SALDO').AsInteger;
    Transaction.Commit;
      ModalResult:=mrYes;
  END;

end;
//******************************************************************************
procedure TfmEdit.ButtonCancelClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;







procedure TfmEdit.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var   id:Variant;
begin
    id:=GlobalSPR.GetSmets(self, x.DB_Handle,  DateAct,   psmRazdSt);
    if VarArrayDimCount(id)>0 then
    begin
      x.id_smeta    :=id[0];
      x.id_razd     :=id[1];
      x.id_sTAT     :=id[2];
      EditRazdTitle.Text:=id[4];
      EditStatTitle.Text:=id[5];
      EditSmetaTitle.Text:=id[6];
      EditRazd.Text:=id[7];
      EditStat.Text:=id[8];
      EditSmeta.Text:=id[9];
      EditKekv.SetFocus;
    end;

end;

procedure TfmEdit.EditSmetaExit(Sender: TObject);
begin

if Length( EditSmeta.Text)>0 then
   with dm.StProc do
   begin
    Transaction.Active:=true;
    StoredProcName:='JO5_RAZD_STAT_BY_SMET_NUM';
    Prepare;
    ParamByName('WHAT').asInteger:=1;
    ParamByName('SMETA').asInteger:=StrToInt(EditSmeta.Text);
    ParamByName('razd').AsVariant:=null;
    ParamByName('Stat').AsVariant:=null;
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;
    if ParamByName('TITLE').AsString='' then
    begin
      x.id_smeta:=null;
      EditSmetaTitle.Text:='';
      x.id_razd:=null;
      EditRazd.Text:='';
      EditRazdTitle.Text:='';

      x.id_stat:=null;
      EditStatTitle.Text:='';
      EditStat.Text:='';
    end
    else
    begin
    if  x.id_smeta<>ParamByName('ID').AsInteger then
    begin
      x.id_razd:=null;
      EditRazd.Text:='';
      EditRazdTitle.Text:='';
      x.id_stat:=null;
      EditStatTitle.Text:='';
      EditStat.Text:='';
      x.id_smeta:=ParamByName('ID').AsInteger;
    end;
      EditSmetaTitle.Text:=ParamByName('TITLE').AsString;
    end;
    Transaction.Commit;
   end
else
begin
      x.id_smeta:=null;
   EditSmetaTitle.Text:='';

   x.id_razd:=null;
   EditRazd.Text:='';
   EditRazdTitle.Text:='';

   x.id_stat:=null;
   EditStatTitle.Text:='';
   EditStat.Text:='';
end;
end;

procedure TfmEdit.EditRazdExit(Sender: TObject);
begin

   if Length( EditRazd.Text)>0 then
   with dm.StProc do
   begin
    Transaction.Active:=true;
    StoredProcName:='JO5_RAZD_STAT_BY_SMET_NUM';
    Prepare;
    ParamByName('WHAT').asInteger:=2;
        if x.id_smeta<> null then
    ParamByName('SMETA').asInteger:=x.id_smeta;
    ParamByName('RAZD').asInteger:=StrToInt(EditRazd.Text);
       ParamByName('Stat').AsVariant:=null;
    if x.id_stat <> null then
    ParamByName('STAT').asInteger:=x.id_stat;
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;
    if ParamByName('RESULT_VALUE').AsInteger=1 then
    begin
    if  x.id_razd<>ParamByName('ID').AsInteger then
    begin
      x.id_stat:=null;
      EditStatTitle.text:='';
      EditStat.text:='';
      x.id_razd:=ParamByName('ID').AsInteger;
    end;
    EditRazdTitle.Text:=ParamByName('TITLE').AsString;
    end
    else
    begin
    x.id_razd:=null;
    EditRazdTitle.Text:='';
    x.id_stat:=null;
    EditStatTitle.text:='';
     EditStat.text:='';
    end;
    Transaction.Commit;
   end
   else
   begin
    x.id_razd:=null;
    EditRazdTitle.Text:='';
    x.id_stat:=null;
    EditStatTitle.text:='';
     EditStat.text:='';
   end;
end;

procedure TfmEdit.EditStatExit(Sender: TObject);
begin

   if Length( EditStat.Text)>0 then
   with dm.StProc do
   begin
    Transaction.Active:=true;
    StoredProcName:='JO5_RAZD_STAT_BY_SMET_NUM';
    Prepare;
    ParamByName('WHAT').asInteger:=3;
    ParamByName('SMETA').asInteger:=x.id_smeta;
    ParamByName('RAZD').asInteger:=x.id_razd;
    ParamByName('STAT').asInteger:=StrToInt(EditStat.Text);
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;
    if ParamByName('RESULT_VALUE').AsInteger=1 then
    begin
      x.id_sTAT:=ParamByName('ID').AsInteger;
      EditStatTitle.Text:=ParamByName('TITLE').AsString;
    end
    else
    begin
    x.id_stat:=null;
    EditStat.text:='';
    EditStatTitle.Text:='';
    end;
    Transaction.Commit;
   end
   else
   begin
    x.id_stat:=null;
    EditStat.text:='';
    EditStatTitle.Text:='';
   end;
end;

procedure TfmEdit.EditRazdClick(Sender: TObject);
begin
 if x.id_smeta=null then
   begin
    showmessage('Виберіть  бюджет');
    EditSmeta.SetFocus;
    exit;
   end;
end;

procedure TfmEdit.EditStatClick(Sender: TObject);
begin
    if x.id_razd=null then
   begin
    showmessage('Виберіть  розділ');
       EditRazd.SetFocus;
    exit;

   end;
end;

procedure TfmEdit.EditSchExit(Sender: TObject);
begin
   if Length( EditSch.Text)>0 then
   with dm.StProc do
   begin
    Transaction.Active:=true;
    StoredProcName:='JO5_PUB_SP_MAIN_SCH_BY_NUM_SCH';
    Prepare;
    ParamByName('NUM_SCH').asString:=EditSch.Text;
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;

    if ParamByName('ID').AsInteger<>null then
    begin
      x.id_sch:=ParamByName('ID').Asvariant;
      EditSchTitle.Text:=ParamByName('Sch_TITLE').AsString;
    end
    else
    begin
      x.id_sch:=null;
      EditSch.text:='';
      EditSchTitle.Text:='';
    end;
    Transaction.Commit;
   end
   else
   begin
    x.id_sch:=null;
    EditSch.text:='';
    EditSchTitle.Text:='';
   end;
end;

procedure TfmEdit.EditKekvExit(Sender: TObject);

begin
   if Length( EditKekv.Text)>0 then
   with dm.StProc do
   begin
    Transaction.Active:=true;
    StoredProcName:='JO5_PUB_SPR_KEKV_BY_KOD_KEKV';
    Prepare;
    ParamByName('KOD_KEKV').AsInteger:=strtoint(EditKekv.Text);
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    ExecProc;
    if ParamByName('ID').AsInteger<>null then
    begin
      x.id_kekv:=ParamByName('ID').AsInteger;
      EditKekvTitle.Text:=ParamByName('KEKV_TITLE').AsString;
    end
    else
    begin
      x.id_kekv:=null;
      EditKekv.text:='';
      EditKekvTitle.Text:='';
    end;
    Transaction.Commit;
   end
   else
   begin
      x.id_kekv:=null;
      EditKekv.text:='';
      EditKekvTitle.Text:='';
   end;
end;

procedure TfmEdit.EditKekvKeyPress(Sender: TObject; var Key: Char);
begin
if getasynckeystate(9)<>0 then EditSaldo.setFocus;
 if getasynckeystate(13)<>0 then EditKekvExit(sender);
end;

procedure TfmEdit.EditStatKeyPress(Sender: TObject; var Key: Char);
begin
  if getasynckeystate(9)<>0 then EditKekv.setfocus;
  if getasynckeystate(13)<>0 then EditStatExit(sender);
end;

procedure TfmEdit.EditSaldoKeyPress(Sender: TObject; var Key: Char);
begin
   if getasynckeystate(9)<>0 then ButtonOK.setfocus
  
  // if getasynckeystate(13)<>0 then ButtonOKClick(sender);

end;

procedure TfmEdit.EditSchKeyPress(Sender: TObject; var Key: Char);
begin
   if getasynckeystate(13)<>0 then EditSchExit(sender);
    if getasynckeystate(9)<>0 then EditSmeta.setfocus;
end;

procedure TfmEdit.EditSmetaKeyPress(Sender: TObject; var Key: Char);
begin
  if getasynckeystate(13)<>0 then EditSmetaExit(sender);
   if getasynckeystate(9)<>0 then EditRazd.setfocus;
end;

procedure TfmEdit.EditRazdKeyPress(Sender: TObject; var Key: Char);
begin
  if getasynckeystate(13)<>0 then EditRazdExit(sender);
  if getasynckeystate(9)<>0 then EditStat.setfocus;
end;

end.
