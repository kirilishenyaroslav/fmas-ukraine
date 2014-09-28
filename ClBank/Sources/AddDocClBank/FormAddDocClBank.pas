unit FormAddDocClBank; //

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, StdCtrls, cxCalc,
  cxMaskEdit, ExtCtrls, cxMemo, cxTextEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxDropDownEdit, cxCalendar,ConstClBank,Ibase,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,DogLoaderUnit,
  GlobalSPR, ActnList,LoadDogManedger, Buttons;

type
  TfrmAddDocClBank = class(TForm)
    GroupBoxDateDoc: TGroupBox;
    cxDateEditDoc: TcxDateEdit;
    GroupBoxDateVip: TGroupBox;
    cxDateEditDateVip: TcxDateEdit;
    GroupBoxRSCustormer: TGroupBox;
    LabelMFO_: TLabel;
    LabelRS_: TLabel;
    cxButtonEditRSPost: TcxButtonEdit;
    cxTextEditMFOPost: TcxTextEdit;
    cxTextEditPSPost: TcxTextEdit;
    GroupBoxNote: TGroupBox;
    cxMemoNote: TcxMemo;
    RadioGroupTypeDoc: TRadioGroup;
    GroupBoxNumberDoc: TGroupBox;
    cxMaskEditNumdoc: TcxMaskEdit;
    GroupBoxSumma: TGroupBox;
    cxMaskEditSumma: TcxCalcEdit;
    StatusBar1: TStatusBar;
    GroupBox5: TGroupBox;
    ButtonOk: TButton;
    ButtonClose: TButton;
    pFIBDataSetEditDoc: TpFIBDataSet;
    pFIBDataSetNameSCH: TpFIBDataSet;
    pFIBStoredProcAll: TpFIBStoredProc;
    pFIBDataSet_post: TpFIBDataSet;
    GroupBoxRSLeman: TGroupBox;
    cxButtonEditRSNative: TcxButtonEdit;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    ActionList1: TActionList;
    ActionAdd: TAction;
    pFIBDataSetShablon: TpFIBDataSet;
    ValutacxCalcEdit: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ValutaLabel: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonOkClick(Sender: TObject);
    procedure cxButtonEditRSLemanPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditRSPostPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_valuta : Integer;
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:variant;Flag_view:Integer);overload;
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_rate_native:int64;DateDoc:TDateTime;  id_valuta_in : Integer; name_valuta : string);overload;
    { Public declarations }
  end;
function AddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime;Id_valuta_in : Integer; name_valuta : string):Integer;stdcall;
exports AddDocClBank;

function EditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant; Id_valuta : Integer; name_valuta : string):Integer;stdcall;
exports EditDocClBank;

function ClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
exports ClonDocClBank;

function ViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
exports ViewDocClBank;

function DelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
exports DelDocClBank;


var
  frmAddDocClBank: TfrmAddDocClBank;
  id_doc_edit:Variant;
  Flag_View_local:Integer;
  id_cust_native,id_cust:Variant;
  id_acc_native,id_acc_cust:Variant;
  DateDocAdd:TdateTime;
  FlagClose:Integer;
  id_shablon_add:Variant;
implementation
uses
  ShablonMain;
{$R *.dfm}
function AddDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_native:int64;DateDoc:TDateTime; Id_valuta_in : Integer; name_valuta : string):Integer;
var
  AddDoc: TfrmAddDocClBank;
  shablon:TfrmShablonMain;
begin
  shablon:=TfrmShablonMain.Create(AOwner,DB,id_acc_native);
  id_shablon_add:=shablon.GetShablon();
  //если id_acc_native=-99999 то посмотр только шаблонов
  if id_acc_native<>-99999 then
    begin
      addDoc:=TfrmAddDocClBank.Create(AOwner,DB,frmSt,id_acc_native,DateDoc,Id_valuta_in, name_valuta);

      if ((Id_valuta_in = 0) or (Id_valuta_in = null)) then
      begin
        addDoc.ValutacxCalcEdit.Enabled := False;
        addDoc.label3.Visible           := False;
        addDoc.ValutaLabel.Visible      := False;
        addDoc.BitBtn1.enabled          := False;
        addDoc.BitBtn2.enabled          := False;
        addDoc.GroupBox1.Visible        := False;
      end
      else
      begin
        addDoc.ValutacxCalcEdit.Enabled := True;
        addDoc.label3.Visible           := True;
        addDoc.ValutaLabel.Visible      := True;
        AddDoc.ValutaLabel.Caption      := name_valuta;
        addDoc.BitBtn1.enabled          := True;
        addDoc.BitBtn2.enabled          := True;
        addDoc.GroupBox1.Visible        := True;
      end;

      AddDoc.id_valuta := Id_valuta_in;

      if frmSt=fsNormal then
        begin
          AddDoc.ShowModal;
          AddDoc.free;
        end;
     end;
  AddDocClBank:=FlagClose;
end;

function EditDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant; Id_valuta : Integer; name_valuta : string):Integer;
var
  AddDoc: TfrmAddDocClBank;
begin
  addDoc:=TfrmAddDocClBank.Create(AOwner,DB,frmSt,id_doc,0);
  if ((Id_valuta = 0) or (Id_valuta = null)) then
    begin
      addDoc.ValutacxCalcEdit.Enabled := False;
      addDoc.label3.Visible           := False;
      addDoc.ValutaLabel.Visible      := False;
    end
  else
    begin
      addDoc.ValutacxCalcEdit.Enabled := True;
      addDoc.label3.Visible           := True;
      addDoc.ValutaLabel.Visible      := True;
      AddDoc.ValutaLabel.Caption      := name_valuta;
    end;

  if frmSt=fsNormal then
    begin
      AddDoc.ShowModal;
      AddDoc.free;
    end;
  EditDocClBank:=FlagClose;
end;

function ClonDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;
var
  AddDoc: TfrmAddDocClBank;
begin
  addDoc:=TfrmAddDocClBank.Create(AOwner,DB,frmSt,id_doc,3);
  if frmSt=fsNormal then
    begin
      AddDoc.ShowModal;
      AddDoc.free;
    end;
  ClonDocClBank:=FlagClose;
end;


function ViewDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
var
  AddDoc: TfrmAddDocClBank;
begin
  addDoc:=TfrmAddDocClBank.Create(AOwner,DB,frmSt,id_doc,1);
  if frmSt=fsNormal then
    begin
      AddDoc.ShowModal;
      AddDoc.free;
    end;
ViewDocClBank:=FlagClose;
end;

function DelDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:Variant):Integer;stdcall;
var
  AddDoc: TfrmAddDocClBank;
begin
  addDoc:=TfrmAddDocClBank.Create(AOwner,DB,frmSt,id_doc,2);
  if frmSt=fsNormal then
    begin
      //AddDoc.ShowModal;
      AddDoc.free;
    end;
end;


constructor TfrmAddDocClBank.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_doc:variant;Flag_view:Integer);
begin
  Inherited Create(AOwner);

  DataBase.Handle:=DB;
  FormStyle:=frmSt;
  id_doc_edit:=id_doc;
  Flag_View_local:=Flag_view;
  cxDateEditDoc.Date:=Date;
  cxDateEditDateVip.Date:=Date;

  if (id_doc_edit=0) and (id_shablon_add<>0) then
    begin
      pFIBDataSetShablon.Active:=false;
      pFIBDataSetShablon.Database:=Database;
      pFIBDataSetShablon.Transaction:=TransactionRead;
      pFIBDataSetShablon.ParamByName('param_shablon').AsVariant:=id_shablon_add;
      pFIBDataSetShablon.Active:=true;

      if pFIBDataSetShablon.FieldByName('type_doc').AsInteger=1 then
        begin
          RadioGroupTypeDoc.ItemIndex:=0;
        end
        else
        begin
          RadioGroupTypeDoc.ItemIndex:=1;
        end;
      cxButtonEditRSNative.Text := pFIBDataSetShablon.FieldByName('native_MFO').AsString+' '+pFIBDataSetShablon.FieldByName('ACC_native').AsString;
      id_acc_native             := pFIBDataSetShablon.FieldByName('id_acc_native').AsVariant;
      cxButtonEditRSPost.Text   := pFIBDataSetShablon.FieldByName('name_cust').AsString;
      cxTextEditMFOPost.Text    := pFIBDataSetShablon.FieldByName('NAME_CUST').AsString;
      cxTextEditPSPost.Text     := pFIBDataSetShablon.FieldByName('acc_cust').AsString;
      id_acc_cust               := pFIBDataSetShablon.FieldByName('id_acc_cust').AsVariant;
      cxMaskEditSumma.Text      := pFIBDataSetShablon.FieldByName('sum_doc').AsString;
      cxMemoNote.Text           := pFIBDataSetShablon.FieldByName('note').AsString;
      ValutacxCalcEdit.Text     := pFIBDataSetShablon.FieldByName('SUMMA_VALUTA').AsString;
    end;


  if id_doc_edit>=0 then
  begin

      pFIBDataSetEditDoc.Active:=false;
      pFIBDataSetEditDoc.ParamByName('param_doc').AsInt64:=id_doc_edit;
      pFIBDataSetEditDoc.Active:=true;
      id_doc_edit:=id_doc;
      cxDateEditDoc.Date:=pFIBDataSetEditDoc.FieldByName('date_doc').AsDateTime;
      cxDateEditDateVip.Date:=pFIBDataSetEditDoc.FieldByName('date_vip').AsDateTime;
      DateDocAdd:=cxDateEditDoc.Date;

      if pFIBDataSetEditDoc.FieldByName('type_doc').AsInteger=1 then
        begin
          RadioGroupTypeDoc.ItemIndex:=0;
        end
        else
        begin
          RadioGroupTypeDoc.ItemIndex:=1;
        end;

      cxMaskEditNumdoc.Text:=pFIBDataSetEditDoc.FieldByName('num_doc').AsString;
      ValutacxCalcEdit.Text:=pFIBDataSetEditDoc.FieldByName('SUMMA_VALUTA').AsString;
      cxButtonEditRSNative.Text:=pFIBDataSetEditDoc.FieldByName('native_MFO').AsString+' '+pFIBDataSetEditDoc.FieldByName('native_rate_account').AsString;
      id_acc_native:=pFIBDataSetEditDoc.FieldByName('native_id_account').AsVariant;
      cxButtonEditRSPost.Text:=pFIBDataSetEditDoc.FieldByName('p_name_cust').AsString;
      cxTextEditMFOPost.Text:=pFIBDataSetEditDoc.FieldByName('p_MFO').AsString;
      cxTextEditPSPost.Text:=pFIBDataSetEditDoc.FieldByName('p_rate_account').AsString;
      id_acc_cust:=pFIBDataSetEditDoc.FieldByName('p_id_account').AsVariant;
      cxMaskEditSumma.Text:=pFIBDataSetEditDoc.FieldByName('sum_doc').AsString;
      cxMemoNote.Text:=pFIBDataSetEditDoc.FieldByName('note').AsString;

      if (pFIBDataSetEditDoc.FieldByName('IS_ADD_CLBANK').AsVariant<>0) then
        begin
          ButtonOk.Visible:=false;
        end;
    end;
if Flag_view=2 then
  begin

        if pFIBDataSetEditDoc.FieldByName('IS_ADD_CLBANK').AsVariant>=0 then
            begin
               pFIBStoredProcAll.StoredProcName:='CLBANK_BUFF_DELETE';
               TransactionWrite.StartTransaction;
               pFIBStoredProcAll.Prepare;
               pFIBStoredProcAll.ParamByName('ID_DOC').AsInt64:=pFIBDataSetEditDoc.FieldByName('ID_DOC').AsVariant;
               try
                 pFIBStoredProcAll.ExecProc;
                 except
                   begin
                     ShowMessage('Помилка при вилученні данних.');
                     TransactionWrite.Rollback;
                     Exit;
                 end;
               end;
               TransactionWrite.Commit;
             end
             else
             begin
                messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_NOT_DELETE),
                PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_OK or MB_ICONWARNING)
             end;
 end;
 if Flag_view=3 then
 begin
        cxDateEditDoc.Style.color         := $00FFF8E6;
        cxDateEditDateVip.Style.Color     := $00FFF8E6;
        cxMaskEditNumdoc.Style.Color      := $00FFF8E6;
        cxButtonEditRSNative.Style.Color  := $00FFF8E6;
        cxButtonEditRSPost.Style.Color    := $00FFF8E6;
        cxTextEditMFOPost.Style.Color     := $00FFF8E6;
        cxTextEditPSPost.Style.Color      := $00FFF8E6;
        cxMaskEditSumma.Style.Color       := $00FFF8E6;
        cxMemoNote.Style.Color            := $00FFF8E6;
 end;

end;

constructor TfrmAddDocClBank.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;frmSt:TFormStyle;id_acc_rate_native:int64;DateDoc:TDateTime;id_valuta_in : Integer; name_valuta : string);
begin
  Inherited Create(AOwner);
  id_valuta := id_valuta_in;
  DataBase.Handle:=DB;
  FormStyle:=frmSt;
  id_doc_edit:=0;
  Flag_View_local:=0;

  if (id_doc_edit=0) and (id_shablon_add<>0) then
    begin
      pFIBDataSetShablon.Active:=false;
      pFIBDataSetShablon.Database:=Database;
      pFIBDataSetShablon.Transaction:=TransactionRead;
      pFIBDataSetShablon.ParamByName('param_shablon').AsVariant:=id_shablon_add;

      pFIBDataSetShablon.Active:=true;
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
      cxTextEditMFOPost.Text:=pFIBDataSetShablon.FieldByName('NAME_CUST').AsString;
      cxTextEditPSPost.Text:=pFIBDataSetShablon.FieldByName('acc_cust').AsString;
      id_acc_cust:=pFIBDataSetShablon.FieldByName('id_acc_cust').AsVariant;
      cxMaskEditSumma.Text:=pFIBDataSetShablon.FieldByName('sum_doc').AsString;
      cxMemoNote.Text:=pFIBDataSetShablon.FieldByName('note').AsString;
    end;

  if id_acc_rate_native>0 then
    begin
      id_acc_native:=id_acc_rate_native;
      DateDocAdd:=DateDoc;
      cxDateEditDoc.Date:=DateDoc;
      cxDateEditDateVip.Date:=DateDoc;
      pFIBDataSetNameSCH.Active:=false;
      pFIBDataSetNameSCH.ParamByName('param_acc').AsInt64:=id_acc_rate_native;
      pFIBDataSetNameSCH.Active:=true;
      cxButtonEditRSNative.Text:=pFIBDataSetNameSCH.FieldValues['MFO'];
    end;


end;

procedure TfrmAddDocClBank.FormCreate(Sender: TObject);
begin

  LoadSysData(TransactionRead);
  GroupBoxDateDoc.Caption:=ConstClBank.ClBank_date_doc;
  GroupBoxDateVip.Caption:=ConstClBank.ClBank_date_vip;
  GroupBoxNumberDoc.Caption:=ConstClBank.ClBank_number_doc;
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

 pFIBDataSetShablon.Active:=false;
      pFIBDataSetShablon.Database:=Database;
      pFIBDataSetShablon.Transaction:=TransactionRead;
      pFIBDataSetShablon.ParamByName('param_shablon').AsVariant:=id_shablon_add;

      pFIBDataSetShablon.Active:=true;
  if ((id_shablon_add<>0) and (id_shablon_add<>null)) then
  begin
      if pFIBDataSetShablon.FieldByName('type_doc').AsInteger=1 then
      begin
          RadioGroupTypeDoc.ItemIndex:=0;
      end
      else
      begin
          RadioGroupTypeDoc.ItemIndex:=1;
      end;
  end;
  //RadioGroupTypeDoc.ItemIndex:=pFIBDataSetShablon.FieldByName('type_doc').AsInteger;
  Caption:=ConstClBank.ClBank_DOC_ClBank;
  if Flag_View_local=1 then
    begin
      ButtonOk.Visible:=False;
    end;
   if pFIBDataSetEditDoc.RecordCount>0 then
     begin
      if pFIBDataSetEditDoc.FieldByName('type_doc').AsInteger=1 then
        begin
          RadioGroupTypeDoc.ItemIndex:=0;
        end
        else
        begin
          RadioGroupTypeDoc.ItemIndex:=1;
        end;
     end;

end;

procedure TfrmAddDocClBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmAddDocClBank.ButtonOkClick(Sender: TObject);
var
   DataSetR: TpFIBDataSet;
   repDate: TDateTime;
   temp: Word;
begin
DataSetR := TpFIBDataSet.Create(Self);
DataSetR.Database := Database;
DataSetR.Transaction := TransactionRead;
DataSetR.SQLs.SelectSQL.Text := 'select bank_install_system from bank_ini';
DataSetR.Active := true;
repDate :=  DataSetR.FieldByName('bank_install_system').AsDateTime;
//ShowMessage(DataSetR.FieldByName('bank_install_system').AsString);
DataSetR.Active := false;
DataSetR.Free;

FlagClose:=0;
if Flag_View_local=3 then
begin
     id_doc_edit :=0 ;
end;
if id_doc_edit=0  then
  begin
    if cxMaskEditNumdoc.Text='' then
      begin
        cxMaskEditNumdoc.Text:='0';
      end;
    if id_acc_native<=0 then
      begin
        ShowMessage(ConstClBank.ClBank_MESSAGE_NOT_DATA);
        Exit;
      end;
    if id_acc_cust<=0 then
      begin
        ShowMessage(ConstClBank.ClBank_MESSAGE_NOT_DATA);
        Exit;
      end;
    if cxDateEditDateVip.Text='' then
      begin
        ShowMessage('Немає дати виписки документу.');
        Exit;
      end;
    if cxDateEditDoc.Text='' then
      begin
        ShowMessage('Немає дати документу');
        Exit;
      end;

    if(cxDateEditDoc.Date>cxDateEditDateVip.Date) then
    begin
         ShowMessage(ConstClBank.Clbank_date_doc_vip);
         exit;
    end;

    if(cxDateEditDateVip.Date<repDate) then
    begin
        ShowMessage('Дата банківської виписки не може бути менше, ніж ' + DateToStr(repDate) + 'р.');
        cxDateEditDateVip.SetFocus();
        exit;
    end;


    if(cxDateEditDoc.Date<repDate) then
    begin
        ShowMessage('Дата документа не може бути менше, ніж ' + DateToStr(repDate) + 'р.');
        cxDateEditDoc.SetFocus();
        exit;
    end;

    if(cxDateEditDoc.Date <> cxDateEditDateVip.Date) then
    begin
        temp:=MessageBox(Handle,'Дата документа та дата банківської виписки не співпадають!' ,'Попередження',MB_OKCANCEL+MB_ICONWARNING);
        case temp of
          IDCANCEL: exit;
        end;
    end;

    pFIBStoredProcAll.Database:=Database;
    pFIBStoredProcAll.Transaction:=TransactionWrite;
    TransactionWrite.DefaultDatabase:=Database;
    TransactionWrite.Active:=true;
    pFIBStoredProcAll.StoredProcName:='CLBANK_BUFF_INSERT';
    pFIBStoredProcAll.Prepare;
    pFIBStoredProcAll.ParamByName('DATE_VIP').AsDate             :=cxDateEditDateVip.Date;
    pFIBStoredProcAll.ParamByName('ID_ACCOUNT_NATIVE').AsInt64   :=id_acc_native;
    pFIBStoredProcAll.ParamByName('ID_ACCOUNT_CUSTOMER').AsInt64 :=id_acc_cust;
    pFIBStoredProcAll.ParamByName('NUM_DOC').AsString            :=cxMaskEditNumdoc.Text;
    pFIBStoredProcAll.ParamByName('DATE_DOC').AsDate             :=cxDateEditDoc.Date;
    pFIBStoredProcAll.ParamByName('SUM_DOC').AsDouble            :=StrToFloat(cxMaskEditSumma.Text);
    pFIBStoredProcAll.ParamByName('IS_ADD_CLBANK').AsInteger     :=0;
    pFIBStoredProcAll.ParamByName('ID_VALUTA').AsInteger         := id_valuta;
    if (ValutacxCalcEdit.Text = '')then
    begin
      pFIBStoredProcAll.ParamByName('summa_valuta').AsDouble       := 0;
    end
    else
      pFIBStoredProcAll.ParamByName('summa_valuta').AsDouble       := StrToFloat(ValutacxCalcEdit.Text);
    if RadioGroupTypeDoc.ItemIndex=0 then
    begin
      pFIBStoredProcAll.ParamByName('TYPE_DOC').AsInteger:=1;
    end
    else
    begin
      pFIBStoredProcAll.ParamByName('TYPE_DOC').AsInt64:=-1;
    end;
    pFIBStoredProcAll.ParamByName('NOTE').AsString:=cxMemoNote.Text;
    try
      pFIBStoredProcAll.ExecProc;
    Except
      begin
        TransactionWrite.Rollback;
        ShowMessage('Помилка при доданні документу.');
        Exit;
      end;
    end;
    if pFIBStoredProcAll.FieldByName('ERROR').AsVariant=2 then
      begin
        TransactionWrite.Commit;
        ShowMessage('Документ з такими данними існує.');
      end
      else
      begin
        TransactionWrite.Commit;
        Close;
      end;
  end
  else
  begin
    pFIBStoredProcAll.Database:=Database;
    pFIBStoredProcAll.Transaction:=TransactionWrite;
    TransactionWrite.DefaultDatabase:=Database;
    TransactionWrite.Active:=true;
    pFIBStoredProcAll.StoredProcName:='CLBANK_BUFF_UPDATE';
    pFIBStoredProcAll.Prepare;
//    ShowMessage(VarToStr(id_doc_edit));
    pFIBStoredProcAll.ParamByName('id_doc').asint64:=id_doc_edit;
    pFIBStoredProcAll.ParamByName('DATE_VIP').AsDate             :=cxDateEditDateVip.Date;
    pFIBStoredProcAll.ParamByName('ID_ACCOUNT_NATIVE').AsInt64   :=id_acc_native;
    pFIBStoredProcAll.ParamByName('ID_ACCOUNT_CUSTOMER').AsInt64 :=id_acc_cust;
    pFIBStoredProcAll.ParamByName('NUM_DOC').AsString            :=cxMaskEditNumdoc.Text;
    pFIBStoredProcAll.ParamByName('DATE_DOC').AsDate             :=cxDateEditDoc.Date;
    pFIBStoredProcAll.ParamByName('SUM_DOC').AsDouble            :=StrToFloat(cxMaskEditSumma.Text);
    pFIBStoredProcAll.ParamByName('summa_valuta').AsDouble       := StrToFloat(ValutacxCalcEdit.Text);
    if RadioGroupTypeDoc.ItemIndex=0 then
    begin
      pFIBStoredProcAll.ParamByName('TYPE_DOC').AsInteger:=1;
    end
    else
    begin
      pFIBStoredProcAll.ParamByName('TYPE_DOC').AsInteger:=-1;
    end;
    pFIBStoredProcAll.ParamByName('NOTE').AsString:=cxMemoNote.Text;
    try
      pFIBStoredProcAll.ExecProc;
    Except
      begin
        TransactionWrite.Rollback;
        Exit;
      end;
    end;
    TransactionWrite.Commit;
//    ShowMessage('commit');
    Close;
  end;
end;

procedure TfrmAddDocClBank.cxButtonEditRSLemanPropertiesButtonClick(
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

procedure TfrmAddDocClBank.cxButtonEditRSPostPropertiesButtonClick(
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
    if DateDocAdd<>StrToDate('30.12.1899') then
      begin
        i['actual_date']   := DateDocAdd;
//        ShowMessage(DateToStr(DateDocAdd));
      end
      else
      begin
        i['actual_date']   := Date;
      end;
//    ShowMessage(DateToStr(i['actual_date']));
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

procedure TfrmAddDocClBank.ButtonCloseClick(Sender: TObject);
begin
  FlagClose:=1;
  Close;
end;

procedure TfrmAddDocClBank.ActionAddExecute(Sender: TObject);
begin
 ButtonOkClick(self);
end;

procedure TfrmAddDocClBank.BitBtn1Click(Sender: TObject);
begin
  if (cxDateEditDateVip.Text = '') then
  begin
    ShowMessage('Заповніть спочатку дату виписки документа');
    cxDateEditDateVip.SetFocus;
    Exit;
  end;

  if (cxMaskEditSumma.Text = '') then
  begin
    ShowMessage('Заповніть спочатку суму документа у грн.');
    cxMaskEditSumma.SetFocus;
    Exit;
  end;

  TransactionWrite.StartTransaction;
  pFIBStoredProcAll.StoredProcName := 'BANK_PERESCHET_SUM_VALUTA';
  pFIBStoredProcAll.ParamByName('is_grn_v_valutu').Value := 1;
  pFIBStoredProcAll.ParamByName('id_valuta').Value       := id_valuta;
  pFIBStoredProcAll.ParamByName('data_vipiski').Value    := cxDateEditDateVip.Date;
  pFIBStoredProcAll.ParamByName('summa').Value           := cxMaskEditSumma.Text;
  pFIBStoredProcAll.ExecProc;
  TransactionWrite.Commit;

  ValutacxCalcEdit.Text := pFIBStoredProcAll.ParamByName('SUMMA_PERESCHET').Value;
  Label5.caption        := '1 грн. = ' + Floattostr(pFIBStoredProcAll.ParamByName('KURS').Value);

end;

procedure TfrmAddDocClBank.BitBtn2Click(Sender: TObject);
begin
  if (cxDateEditDateVip.Text = '') then
  begin
    ShowMessage('Заповніть спочатку дату виписки документа');
    cxDateEditDateVip.SetFocus;
    Exit;
  end;

  if (ValutacxCalcEdit.Text = '') then
  begin
    ShowMessage('Заповніть спочатку суму документа у валюті');
    ValutacxCalcEdit.SetFocus;
    Exit;
  end;

  TransactionWrite.StartTransaction;
  pFIBStoredProcAll.StoredProcName                       := 'BANK_PERESCHET_SUM_VALUTA';
  pFIBStoredProcAll.ParamByName('is_grn_v_valutu').Value := 0;
  pFIBStoredProcAll.ParamByName('id_valuta').Value       := id_valuta;
  pFIBStoredProcAll.ParamByName('data_vipiski').Value    := cxDateEditDateVip.Date;
  pFIBStoredProcAll.ParamByName('summa').Value           := ValutacxCalcEdit.Text;
  pFIBStoredProcAll.ExecProc;
  TransactionWrite.Commit;

  cxMaskEditSumma.Text := pFIBStoredProcAll.ParamByName('SUMMA_PERESCHET').Value;
  Label5.caption        := '1 грн. = ' + Floattostr(pFIBStoredProcAll.ParamByName('KURS').Value);

end;

end.
