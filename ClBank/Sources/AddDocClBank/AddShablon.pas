unit AddShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxDropDownEdit, cxCalc, ExtCtrls, cxMemo, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,LoadDogManedger,
  DogLoaderUnit,IBase,ConstClBank;

type
  TfrmAddShablon = class(TForm)
    GroupBoxRSCustormer: TGroupBox;
    LabelMFO_: TLabel;
    LabelRS_: TLabel;
    cxButtonEditRSPost: TcxButtonEdit;
    cxTextEditMFOPost: TcxTextEdit;
    cxTextEditPSPost: TcxTextEdit;
    GroupBoxNote: TGroupBox;
    cxMemoNote: TcxMemo;
    RadioGroupTypeDoc: TRadioGroup;
    GroupBoxSumma: TGroupBox;
    cxMaskEditSumma: TcxCalcEdit;
    StatusBar1: TStatusBar;
    GroupBox5: TGroupBox;
    ButtonOk: TButton;
    ButtonClose: TButton;
    GroupBoxRSLeman: TGroupBox;
    cxButtonEditRSNative: TcxButtonEdit;
    pFIBDataSetNameSCH: TpFIBDataSet;
    pFIBStoredProcAll: TpFIBStoredProc;
    pFIBDataSet_post: TpFIBDataSet;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    ActionList1: TActionList;
    ActionAdd: TAction;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cxTextEditName: TcxTextEdit;
    cxTextEditShortName: TcxTextEdit;
    pFIBDataSetShablon: TpFIBDataSet;
    procedure cxButtonEditRSNativePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditRSPostPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_SHABLON:Integer);overload;
    { Public declarations }
  end;

var
  frmAddShablon: TfrmAddShablon;
  id_cust_native,id_cust:Variant;
  id_acc_native,id_acc_cust:Variant;
  id_sh:Integer;
implementation
uses
  ShablonMain;
{$R *.dfm}


constructor TfrmAddShablon.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_SHABLON:Integer);
begin
  Inherited Create(AOwner);

  Database.Handle:=DB;

  LoadSysData(TransactionRead);

  id_acc_native:=0;
  id_acc_cust:=0;
  
  id_sh:=ID_SHABLON;

  GroupBoxSumma.Caption:=ConstClBank.ClBank_summa;
  GroupBoxNote.Caption:=ConstClBank.ClBank_note;
  GroupBoxRSLeman.Caption:=ConstClBank.ClBank_rs_native;
  GroupBoxRSCustormer.Caption:=ConstClBank.ClBank_rs_customer;
  RadioGroupTypeDoc.Caption:=ConstClBank.ClBank_type_doc;
  RadioGroupTypeDoc.Items.Clear;
  RadioGroupTypeDoc.Items.Add(ConstClBank.ClBank_prihod);
  RadioGroupTypeDoc.Items.Add(ConstClBank.ClBank_rashod);
  ButtonOk.Caption:=ConstClBank.ClBank_ACTION_ADD_CONST;
  ButtonClose.Caption:=ConstClBank.ClBank_ACTION_CLOSE_CONST;
  LabelMFO_.Caption:=ConstClBank.ClBank_mfo;
  LabelRS_.Caption:=ConstClBank.ClBank_rs;
  RadioGroupTypeDoc.ItemIndex:=0;

  if id_sh<>0 then
    begin
      pFIBDataSetShablon.Active:=false;
      pFIBDataSetShablon.Database:=Database;
      pFIBDataSetShablon.Transaction:=TransactionRead;
      pFIBDataSetShablon.ParamByName('param_shablon').AsVariant:=id_sh;
      pFIBDataSetShablon.Active:=true;
      cxTextEditName.Text:=pFIBDataSetShablon.FieldByName('NAME_SHABLON').AsString;
      cxTextEditShortName.Text:=pFIBDataSetShablon.FieldByName('SHORT_NAME_SHABLON').AsString;
      if pFIBDataSetShablon.FieldByName('type_doc').AsInteger=1 then
        begin
          RadioGroupTypeDoc.ItemIndex:=0;
        end
        else
        begin
          RadioGroupTypeDoc.ItemIndex:=1;
        end;
      cxButtonEditRSNative.Text:=pFIBDataSetShablon.FieldByName('MFO_NATIVE').AsString+' '+pFIBDataSetShablon.FieldByName('ACC_native').AsString;
      id_acc_native:=pFIBDataSetShablon.FieldByName('id_acc_native').AsVariant;
      cxButtonEditRSPost.Text:=pFIBDataSetShablon.FieldByName('name_cust').AsString;
      cxTextEditMFOPost.Text:=pFIBDataSetShablon.FieldByName('MFO_CUST').AsString;
      //cxTextEditMFOPost.Text:=pFIBDataSetShablon.FieldByName('name_cust').AsString;
      cxTextEditPSPost.Text:=pFIBDataSetShablon.FieldByName('acc_cust').AsString;
      id_acc_cust:=pFIBDataSetShablon.FieldByName('id_acc_cust').AsVariant;
      cxMaskEditSumma.Text:=pFIBDataSetShablon.FieldByName('sum_doc').AsString;
      cxMemoNote.Text:=pFIBDataSetShablon.FieldByName('note').AsString;
      cxButtonEditRSNative.Properties.Buttons.Items[0].Visible:=true;
      if (id_acc_native=TfrmShablonMain(self.Owner).id_native) and (id_acc_native>0) then
        begin
          cxButtonEditRSNative.Properties.Buttons.Items[0].Visible:=false;
        end;
    end
    else
    begin
      cxButtonEditRSNative.Properties.Buttons.Items[0].Visible:=true;
      if TfrmShablonMain(self.Owner).id_native>0 then
        begin
          pFIBDataSetNameSCH.Active:=false;
          pFIBDataSetNameSCH.ParamByName('param_acc').AsInt64:=TfrmShablonMain(self.Owner).id_native;
          pFIBDataSetNameSCH.Active:=true;
          cxButtonEditRSNative.Text:=pFIBDataSetNameSCH.FieldValues['MFO'];
          cxButtonEditRSNative.Properties.Buttons.Items[0].Visible:=false;
        end;
    end;


end;

procedure TfrmAddShablon.cxButtonEditRSNativePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  post:Variant;
begin
post :=LoadDogManedger.WorkSpMfoRsch(self,Database.Handle, fsNormal, 'get', -1);
  if VarArrayDimCount(post) > 0 then
  begin
    if post[0][0] > 0 then
    begin
      id_acc_native := post[0][0];
      cxButtonEditRsNative.Text :=post[0][4]+' МФО '+post[0][2]+' Р/Р '+post[0][3];
    end;
  end;
end;

procedure TfrmAddShablon.cxButtonEditRSPostPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['show_all']     := 1;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_acc_cust := o['ID_RATE_ACCOUNT'];
        cxButtonEditRSPost.Text:= o['NAME_CUSTOMER'];
        cxTextEditMFOPost.Text := 'МФО '+ VarToStr(o['MFO'])+' банк '+VarToStr(o['NAME_BANK']);
        cxTextEditPSPost.Text := VarToStr(o['RATE_ACCOUNT']);
      end;
    i.Free;
    o.Free;
end;

procedure TfrmAddShablon.ButtonOkClick(Sender: TObject);
begin
    if cxTextEditName.Text='' then
      begin
        ShowMessage('Немає назви шаблону.');
        Exit;
      end;
    if cxTextEditShortName.Text='' then
      begin
        ShowMessage('Немає короткої назви шаблону.');
        Exit;
      end;
    if cxMemoNote.Text='' then
      begin
        ShowMessage('Немає підстави документу');
        Exit;
      end;
    pFIBStoredProcAll.Database:=Database;
    pFIBStoredProcAll.Transaction:=TransactionWrite;
    TransactionWrite.DefaultDatabase:=Database;
    TransactionWrite.Active:=true;
    pFIBStoredProcAll.StoredProcName:='CLBANK_INI_SHABLON_SAVE';
    pFIBStoredProcAll.Prepare;
    pFIBStoredProcAll.ParamByName('IN_ID_SHABLON').AsInt64             :=id_sh;
    pFIBStoredProcAll.ParamByName('IN_NAME').AsString                  :=cxTextEditName.Text;
    pFIBStoredProcAll.ParamByName('IN_SHORT_NAME').AsString            :=cxTextEditShortName.Text;

    if id_acc_native=null then
      begin
        pFIBStoredProcAll.ParamByName('IN_ID_NATIVE').AsInt64          :=-1;
      end
      else
      begin
        pFIBStoredProcAll.ParamByName('IN_ID_NATIVE').AsInt64          :=id_acc_native;
      end;
    if id_acc_cust=null then
      begin
        pFIBStoredProcAll.ParamByName('IN_ID_CUSTOMER').AsInt64        :=-1;
      end
      else
      begin
        pFIBStoredProcAll.ParamByName('IN_ID_CUSTOMER').AsInt64         :=id_acc_cust;
      end;
    pFIBStoredProcAll.ParamByName('IN_SUMMA').AsDouble                 :=StrToFloat(cxMaskEditSumma.Text);
    if RadioGroupTypeDoc.ItemIndex=0 then
    begin
      pFIBStoredProcAll.ParamByName('IN_TYPE_DOC').AsInteger:=1;
    end
    else
    begin
      pFIBStoredProcAll.ParamByName('IN_TYPE_DOC').AsInt64:=-1;
    end;
    pFIBStoredProcAll.ParamByName('IN_NOTE').AsString:=cxMemoNote.Text;
    try
      pFIBStoredProcAll.ExecProc;
    Except
      begin
        TransactionWrite.Rollback;
        ShowMessage('Помилка при доданні шаблону.');
        Exit;
      end;
    end;
    TransactionWrite.Commit;
    Close;
end;

procedure TfrmAddShablon.ButtonCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAddShablon.ActionAddExecute(Sender: TObject);
begin
  ButtonOkClick(self);
end;

end.
