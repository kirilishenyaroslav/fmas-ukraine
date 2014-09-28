unit SpBankCardAddForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxButtonEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, SpBankCardfmManCard,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Registry, cxLabel;

type
  TfmSpBankCardAddForm = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    cxMemo1: TcxMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    AClose: TAction;
    AAdd: TAction;
    Db: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    ActionSelectLang: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    procedure ACloseExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LoadCaption;
    procedure ActionSelectLangExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    id_bankcard_loc, id_dog_loc : int64;
    mform : TfmSpBankCardfmManCard;
    flag_add : boolean;
    index_lang : integer;
  public
    constructor Create(AO : TComponent; id_bankcard : int64;  myform : TfmSpBankCardfmManCard); reintroduce; overload;
  end;



implementation
uses UWResourcesUnit,
     MainSpBankCardUnit;

{$R *.dfm}

constructor TfmSpBankCardAddForm.Create(AO : TComponent; id_bankcard: int64;
  myform: TfmSpBankCardfmManCard);
begin
    inherited Create(AO);
    mform                  := myform;
    if id_bankcard <= 0 then
    begin
        id_dog_loc         := -1;
        cxDateEdit1.Date   := date;
        flag_add           := true;
    end else
    begin
        id_bankcard_loc    := id_bankcard;
        flag_add           := false;
        id_dog_loc         := StrToInt64(mform.DataSetCard.fbn('R_ID_DOG_BANKCARD').AsString);
        cxDateEdit1.Date   := mform.DataSetCard.fbn('R_DATE_OPEN').AsDateTime;
        if mform.DataSetCard.fbn('R_FLAG_CLOSE_CARD').AsInteger = 1
            then cxCheckBox1.Checked := true;
        cxMemo1.Text       := mform.DataSetCard.fbn('R_N_COMMENT').AsString;
        cxTextEdit1.Text   := mform.DataSetCard.fbn('R_LIC_BANKSCH').AsString;
        cxButtonEdit1.Text := mform.DataSetCard.fbn('R_SHORTNAME').AsString + '  ( ¹' + mform.DataSetCard.fbn('R_NUM_DOG').AsString + '  -  ' +  mform.DataSetCard.fbn('R_DATE_DOG').AsString + ' )';
    end;
    LoadCaption;
end;

procedure TfmSpBankCardAddForm.ACloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpBankCardAddForm.AAddExecute(Sender: TObject);
var
    id_man : string;
    flag : smallint;
begin
    if cxTextEdit1.Text = '' then
    begin
        exit;
        showmessage(UWResourcesUnit.SPBANKCARD_ADD_DONT_LIC[index_lang]);
        cxTextEdit1.SetFocus;
    end;
    if cxCheckBox1.Checked then flag := 1 else flag := 0;
    if id_dog_loc <= 0 then
    begin
        exit;
        showmessage(UWResourcesUnit.SPBANKCARD_ADD_DONT_DOG[index_lang]);
        cxButtonEdit1.SetFocus;
    end;
    db                          := mform.Database;
    Transaction.DefaultDatabase := DB;
    db.DefaultTransaction       := Transaction;
    DataSet.Database            := DB;
    DataSet.Transaction         := Transaction;

    Transaction.StartTransaction;
    id_man := mform.DataSetGrid.fbn('ID_MAN').asString;

    if flag_add then
    begin
        try
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_BANKCARD_PEOPLE_INSERT('''+id_man+''', '+IntToStr(id_dog_loc)+', '''+cxTextEdit1.Text+''', '''+cxMemo1.Text+''', '+IntToStr(flag)+', '''+DateToStr(cxDateEdit1.Date)+''')';
showmessage(DataSet.SQLs.SelectSQL.Text);
            DataSet.Open;
            id_bankcard_loc := StrToint64(DataSet.fbn('R_ID').AsString);
            DataSet.Close;
            Transaction.Commit;
        except on E:Exception do begin
            Transaction.Rollback;
            ShowMessage(E.Message);
        end;
        end;
    end else
    begin
        try
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_BANKCARD_PEOPLE_UPDATE('+IntToStr(id_bankcard_loc)+', '''+id_man+''', '''+cxTextEdit1.Text+''', '''+cxMemo1.Text+''', '+IntToStr(flag)+', '''+DateToStr(cxDateEdit1.Date)+''', '+IntToStr(id_dog_loc)+')';
            DataSet.Open;
            DataSet.Close;
            Transaction.Commit;
        except on E:Exception do begin
            Transaction.Rollback;
            ShowMessage(E.Message);
        end;
        end;
    end;
    if id_bankcard_loc > 0 then
    begin
        mform.RefreshMan;
        mform.DataSetGrid.Locate('ID_MAN', id_man, []);
        Close;
    end;
end;

procedure TfmSpBankCardAddForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    R : Variant;
begin
    R := UVSpBankCardTakeDog(mform.Own, mform.id_user, mform.Database, true, true);
    if VarArrayDimCount(R) > 0 then
    begin
        cxButtonEdit1.Text := VarToStr(r[3])+ '  ( ¹' + VarToStr(r[1]) + '  -  '+ VarToStr(r[2]) + ' )';
        id_dog_loc         := r[0];

    end;
end;


procedure TfmSpBankCardAddForm.LoadCaption;
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

    Caption                          := UWResourcesUnit.SPBANKCARD_ADD_CAPTION[index_lang];
    AClose.Caption                   := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    AAdd.Caption                     := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxLabel1.Caption                 := UWResourcesUnit.MY_CONST_LIC_SCH[index_lang];
    cxLabel2.Caption                 := UWResourcesUnit.MY_CONST_DATE_OPEN[index_lang];
    cxLabel3.Caption                 := UWResourcesUnit.SPBANKCARD_ADD_SELECT_DOG[index_lang];
    cxLabel4.Caption                 := UWResourcesUnit.MY_CONST_COMMENT[index_lang];
    cxCheckBox1.Properties.Caption   := UWResourcesUnit.SPBANKCARD_ADD_FLAG_OPEN[index_lang];


end;

procedure TfmSpBankCardAddForm.ActionSelectLangExecute(Sender: TObject);
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

procedure TfmSpBankCardAddForm.FormActivate(Sender: TObject);
begin
    LoadCaption;
end;

end.
