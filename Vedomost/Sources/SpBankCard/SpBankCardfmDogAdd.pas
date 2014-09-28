unit SpBankCardfmDogAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit, cxMemo,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, SpBankCardfmDog, ActnList, Registry, cxLabel;

type
  TfmSpBankCardfmDogAdd = class(TForm)
    cxTextEditNumber: TcxTextEdit;
    cxMemoComment: TcxMemo;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxDateEdit1: TcxDateEdit;
    cxTextEditName: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DB: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    ActionList1: TActionList;
    SelectLang: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SelectLangExecute(Sender: TObject);
    procedure LoadCaption;
    procedure FormActivate(Sender: TObject);
  private
    id_ras_nativ, id_ras_cust, id_loc : int64;
    index_lang : integer;
    reg_add : boolean;
  public
    mform : TfmSpBankCardfmDog;
    { Public declarations }
  end;

function SpBankCardDogAddShow(var id_dog : int64; myform : TfmSpBankCardfmDog) : boolean;

implementation
uses dogLoaderUnit,
     LoadDogManedger,
     UWResourcesUnit;

{$R *.dfm}

function SpBankCardDogAddShow(var id_dog : int64; myform : TfmSpBankCardfmDog) : boolean;
var
    T : TfmSpBankCardfmDogAdd;
begin
    T                             := TfmSpBankCardfmDogAdd.Create(myform.Own);
    T.LoadCaption;
    T.db                          := myform.Database;
    T.Transaction.DefaultDatabase := T.DB;
    T.db.DefaultTransaction       := T.Transaction;
    T.DataSet.Database            := T.DB;
    T.DataSet.Transaction         := T.Transaction;
    T.mform                       := myform;
    if id_dog <= 0 then
    begin
        T.id_ras_nativ            := -1;
        T.id_ras_cust             := -1;
        T.cxDateEdit1.Date        := date;
        T.reg_add                 := true;
    end else
    begin
        T.id_loc                  := id_dog;
        T.reg_add                 := false;
        T.cxTextEditName.Text     := myform.DataSetDog.fbn('R_SHORTNAME').AsString;
        T.cxTextEditNumber.Text   := myform.DataSetDog.fbn('R_NUM_DOG').AsString;
        T.cxDateEdit1.Date        := myform.DataSetDog.fbn('R_DATE_DOG').AsDateTime;
        T.cxButtonEdit1.Text      := myform.DataSetDog.fbn('R_NAT_NAME').AsString  + '  ' + myform.DataSetDog.fbn('R_NAT_NAME_CUST').AsString;
        T.cxButtonEdit2.Text      := myform.DataSetDog.fbn('R_CUST_NAME').AsString + '  ' + myform.DataSetDog.fbn('R_CUST_NAME_CUST').AsString;
        T.cxMemoComment.Text      := myform.DataSetDog.fbn('R_COMMENT').AsString;
        T.id_ras_nativ            := StrToInt64(myform.DataSetDog.fbn('R_ID_RAS_NATIVE').AsString);
        T.id_ras_cust             := StrToInt64(myform.DataSetDog.fbn('R_ID_RAS_CUST').AsString);
        T.cxTextEdit2.Text        := UWResourcesUnit.SPBANKCARD_DOG_MFO[T.index_lang]  + ' - ' +  myform.DataSetDog.fbn('R_NAT_MFO').AsString + '; ' + UWResourcesUnit.SPBANKCARD_DOG_BANK[T.index_lang] + ' - ' + myform.DataSetDog.fbn('R_NAT_NAME_MFO').AsString;
        T.cxTextEdit1.Text        := UWResourcesUnit.SPBANKCARD_DOG_OKPO[T.index_lang] + ' - ' + myform.DataSetDog.fbn('R_CUST_OKPO').AsString + '; ' + UWResourcesUnit.SPBANKCARD_DOG_MFO[T.index_lang]  + ' - ' +  myform.DataSetDog.fbn('R_CUST_MFO').AsString + '; ' + UWResourcesUnit.SPBANKCARD_DOG_BANK[T.index_lang] + ' - ' + myform.DataSetDog.fbn('R_CUST_NAME_MFO').AsString;
    end;
    if T.ShowModal = mrOk then
    begin
        id_dog := T.id_loc;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

procedure TfmSpBankCardfmDogAdd.cxButton2Click(Sender: TObject);
begin
    if cxTextEditName.Text = '' then exit;
    if cxTextEditNumber.Text = '' then exit;
    if cxMemoComment.Text = '' then exit;
    if id_ras_nativ <= 0 then exit;
    if id_ras_cust <= 0 then exit;


    if reg_add then
    begin
        try
            Transaction.StartTransaction;
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOGOVOR_BANKCARD_INSERT('+IntToStr(id_ras_nativ)+', '+IntToStr(id_ras_cust)+', '''+cxTextEditNumber.Text+''', '''+DateToStr(cxDateEdit1.Date)+''', '''+cxMemoComment.Text+''', '''+cxTextEditName.Text+''')';
            DataSet.Open;
            id_loc := StrToint64(DataSet.fbn('ID_DOG_BANKCARD').AsString);
            DataSet.Close;
            Transaction.Commit;
            mform.DataSetDog.Close;
            mform.DataSetDog.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOG_BANKCARD_SELECT_GRID';
            mform.DataSetDog.Open;
            mform.DataSetDog.Locate('R_ID_DOG_BANKCARD', id_loc, []);
            ModalResult := mrOK;
            Close;
        except on E:Exception do begin
            Transaction.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
    end else
    begin
        try
            Transaction.StartTransaction;
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOGOVOR_BANKCARD_UPDATE('+IntToStr(id_loc)+', '+IntToStr(id_ras_nativ)+', '+IntToStr(id_ras_cust)+', '''+cxTextEditNumber.Text+''', '''+DateToStr(cxDateEdit1.Date)+''', '''+cxMemoComment.Text+''', '''+cxTextEditName.Text+''')';
            DataSet.Open;
//            id_loc := StrToint64(DataSet.fbn('ID_DOG_BANKCARD').AsString);
            DataSet.Close;
            Transaction.Commit;

            mform.DataSetDog.Close;
            mform.DataSetDog.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOG_BANKCARD_SELECT_GRID';
            mform.DataSetDog.Open;
            mform.DataSetDog.Locate('R_ID_DOG_BANKCARD', id_loc, []);
            ModalResult := mrOK;

            Close;
        except on E:Exception do begin
            Transaction.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
    end;
end;

procedure TfmSpBankCardfmDogAdd.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, o : TSpravParams;
begin
    i                 := TSpravParams.Create;
    o                 := TSpravParams.Create;
    i['DataBase']     := Integer(DB.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
//    ShowSpravParams(self, o);
        id_ras_cust        := o['ID_RATE_ACCOUNT'];
        cxButtonEdit2.Text := VarToStr(o['RATE_ACCOUNT']) +  '  -  ' + VarToStr(o['NAME_CUSTOMER']);
        cxTextEdit1.Text   := UWResourcesUnit.SPBANKCARD_DOG_OKPO[index_lang] + ' - ' + VarToStr(o['KOD_EDRPOU']) + '; ' + UWResourcesUnit.SPBANKCARD_DOG_MFO[index_lang]  + ' - ' +  VarToStr(o['MFO']) + '; ' + UWResourcesUnit.SPBANKCARD_DOG_BANK[index_lang] + ' - ' + VarToStr(o['NAME_BANK']);

    end else
    begin
    end;
    i.Free;
    o.Free;
end;

procedure TfmSpBankCardfmDogAdd.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmSpBankCardfmDogAdd.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := LoadDogManedger.WorkSpMfoRsch(self, DB.Handle, fsNormal, 'get', -1);
    if VarArrayDimCount(res) > 0 then
    begin
        if res[0][0] > 0 then
        begin
            id_ras_nativ       := res[0][0];
            cxButtonEdit1.Text := res[0][3] + ' ' + res[0][1];
            cxTextEdit2.Text   := {UWResourcesUnit.SPBANKCARD_DOG_OKPO[index_lang] + ' - ' + VarToStr(o['KOD_EDRPOU']) + '; ' + }UWResourcesUnit.SPBANKCARD_DOG_MFO[index_lang]  + ' - ' +  VarToStr(res[0][2]) + '; ' + UWResourcesUnit.SPBANKCARD_DOG_BANK[index_lang] + ' - ' + VarToStr(res[0][6]);
//bank -res[0][6]       name_cust res[0][1]                  mfo res[0][2]
        end;
    end;
end;

procedure TfmSpBankCardfmDogAdd.SelectLangExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

procedure TfmSpBankCardfmDogAdd.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    cxButton2.Caption                      := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxButton1.Caption                      := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    cxLabel1.Caption                       := UWResourcesUnit.SPBANKCARD_DOG_SHORTNAME[index_lang];
    cxLabel2.Caption                       := UWResourcesUnit.SPBANKCARD_DOG_NUMBER[index_lang];
    cxLabel3.Caption                       := UWResourcesUnit.SPBANKCARD_DOG_DATE[index_lang];
    cxLabel4.Caption                       := UWResourcesUnit.SPBANKCARD_DOG_ADD_RS_OUR[index_lang];
    cxLabel5.Caption                       := UWResourcesUnit.SPBANKCARD_DOG_ADD_RS_CUST[index_lang];
    cxLabel6.Caption                       := UWResourcesUnit.MY_CONST_COMMENT[index_lang];
    Caption                                := UWResourcesUnit.SPBANKCARD_DOG_ADD_CAPTION[index_lang];
end;

procedure TfmSpBankCardfmDogAdd.FormActivate(Sender: TObject);
begin
    LoadCaption;
end;

end.
