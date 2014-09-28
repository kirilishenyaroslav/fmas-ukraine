unit SpBankCardfmDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ActnList, ExtCtrls, cxControls,
  cxSplitter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MainSpBankCardUnit, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, Registry, dxStatusBar;

type
  TfmSpBankCardfmDog = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    AADD: TAction;
    AEdit: TAction;
    ADel: TAction;
    ATake: TAction;
    ARefresh: TAction;
    AExit: TAction;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    DataSetDog: TpFIBDataSet;
    DataSetCard: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSetDogR_COMMENT: TFIBStringField;
    DataSetDogR_DATE_DOG: TFIBDateField;
    DataSetDogR_ID_DOG_BANKCARD: TFIBBCDField;
    DataSetDogR_ID_RAS_CUST: TFIBBCDField;
    DataSetDogR_ID_RAS_NATIVE: TFIBBCDField;
    DataSetDogR_NUM_DOG: TFIBStringField;
    DataSetDogR_SHORTNAME: TFIBStringField;
    DataSetDogR_CUST_NAME: TFIBStringField;
    DataSetDogR_CUST_NAME_CUST: TFIBStringField;
    DataSetDogR_CUST_MFO: TFIBStringField;
    DataSetDogR_CUST_NAME_MFO: TFIBStringField;
    DataSetDogR_CUST_OKPO: TFIBStringField;
    DataSetDogR_NAT_NAME: TFIBStringField;
    DataSetDogR_NAT_NAME_CUST: TFIBStringField;
    DataSetDogR_NAT_MFO: TFIBStringField;
    DataSetDogR_NAT_NAME_MFO: TFIBStringField;
    DataSetDogR_NAT_OKPO: TFIBStringField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    DataSetDel: TpFIBDataSet;
    TransactionWrite: TpFIBTransaction;
    SelectLang: TAction;
    dxStatusBar1: TdxStatusBar;
    procedure AExitExecute(Sender: TObject);
    procedure AADDExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    index_lang : integer;
  public
    ResValue : Variant;
    mclass : TMainSpBankCardUnit;
    Own : TComponent;
    constructor Create(my_class : TMainSpBankCardUnit; reg_edit, only_dog, reg_vibor : boolean); reintroduce; overload;
  end;


implementation
uses SpBankCardfmDogAdd,
     UWResourcesUnit;
{$R *.dfm}

{ TfmSpBankCardfmDog }

constructor TfmSpBankCardfmDog.Create(my_class : TMainSpBankCardUnit; reg_edit, only_dog, reg_vibor : boolean);
begin
    inherited Create(my_class.Owner);
    mclass                          := my_class;
    own                             := my_class.Owner;

    Database                        := my_class.Class_Database;
    TransactionRead.DefaultDatabase := Database;
    Database.DefaultTransaction     := TransactionRead;

    DataSetDog.Database             := Database;
    DataSetDog.Transaction          := TransactionRead;

    DataSetCard.Database            := Database;
    DataSetCard.Transaction         := TransactionRead;

    TransactionRead.StartTransaction;

    if reg_edit then
    begin
        AAdd.Enabled  := true;
        AEdit.Enabled := true;
        ADel.Enabled  := true;
    end else
    begin
        AAdd.Enabled  := false;
        AEdit.Enabled := false;
        ADel.Enabled  := false;
    end;
    if not reg_vibor then
    begin
        ATake.Visible := false;
    end;

    if only_dog then
    begin
        cxSplitter1.CloseSplitter;
        cxSplitter1.Visible := false;
    end else
    begin
        DataSetCard.SQLs.SelectSQL.Text := 'select * from (?R_ID_DOG_BANKCARD)';
    end;

    DataSetDog.Close;
    DataSetDog.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOG_BANKCARD_SELECT_GRID';
    DataSetDog.Open;
    LoadCaption;
end;

procedure TfmSpBankCardfmDog.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpBankCardfmDog.AADDExecute(Sender: TObject);
var
    id_loc : int64;
begin
    id_loc := -1;
    if SpBankCardDogAddShow(id_loc, self) then
    begin
//        DataSetDog.Close;
//        DataSetDog.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOG_BANKCARD_SELECT_GRID';
//        DataSetDog.Open;
//        DataSetDog.Locate('R_ID_DOG_BANKCARD', id_loc, []);
    end;
end;

procedure TfmSpBankCardfmDog.ADelExecute(Sender: TObject);
var
    s : string;
    id_del : int64;
begin
    if not DataSetDog.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.SPBANKCARD_DELETE_BANKCARD[index_lang] + ' - ' + DataSetDog.FBN('R_SHORTNAME').AsString ), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            TransactionWrite.DefaultDatabase := Database;

            DataSetDel.Database              := Database;
            DataSetDel.Transaction           := TransactionWrite;

            TransactionWrite.StartTransaction;

            try
                id_del := StrToInt64(DataSetDog.fbn('R_ID_DOG_BANKCARD').AsString);
                DataSetDel.Close;
                DataSetDel.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOGOVOR_BANKCARD_DELETE('+intToStr(id_del)+')';
                DataSetDel.Open;
                if DataSetDel.fbn('R_RESULT').AsInteger = 1 then
                begin
                    DataSetDel.Close;
                    TransactionWrite.Commit;
                    DataSetDog.CloseOpen(true);
                end else
                begin
                    DataSetDel.Close;
                    TransactionWrite.Rollback;
                    showmessage(UWResourcesUnit.SPBANKCARD_DOG_DONT_DEL[index_lang]);
                    exit;
                end;
            except on E:Exception do begin
                TransactionWrite.Rollback;
                ShowMessage(E.Message);
                end;
            end;

        end;
    end;
end;

procedure TfmSpBankCardfmDog.ARefreshExecute(Sender: TObject);
var
    id_l : int64;
begin
    id_l := StrToInt64(DataSetDog.fbn('R_ID_DOG_BANKCARD').AsString);
    DataSetDog.Close;
    DataSetDog.SQLs.SelectSQL.Text := 'select * from PUB_SP_DOG_BANKCARD_SELECT_GRID';
    DataSetDog.Open;
    DataSetDog.Locate('R_ID_DOG_BANKCARD', id_l, []);
end;

procedure TfmSpBankCardfmDog.ATakeExecute(Sender: TObject);
begin
    ResValue := VarArrayOf([DataSetDog.FieldByName('R_ID_DOG_BANKCARD').AsString,
                            DataSetDog.FieldByName('R_NUM_DOG').AsString,
                            DataSetDog.FieldByName('R_DATE_DOG').AsDateTime,
                            DataSetDog.FieldByName('R_SHORTNAME').AsString,
                            DataSetDog.FieldByName('R_COMMENT').AsString,
                            DataSetDog.FieldByName('R_ID_RAS_CUST').AsString,
                            DataSetDog.FieldByName('R_ID_RAS_NATIVE').AsString,
                            DataSetDog.FieldByName('R_CUST_NAME').AsString,
                            DataSetDog.FieldByName('R_CUST_NAME_CUST').AsString,
                            DataSetDog.FieldByName('R_CUST_MFO').AsString,
                            DataSetDog.FieldByName('R_CUST_NAME_MFO').AsString,
                            DataSetDog.FieldByName('R_CUST_OKPO').AsString,
                            DataSetDog.FieldByName('R_NAT_NAME').AsString,
                            DataSetDog.FieldByName('R_NAT_NAME_CUST').AsString,
                            DataSetDog.FieldByName('R_NAT_MFO').AsString,
                            DataSetDog.FieldByName('R_NAT_NAME_MFO').AsString,
                            DataSetDog.FieldByName('R_NAT_OKPO').AsString
                            ]);
    Close;
end;

procedure TfmSpBankCardfmDog.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then ATakeExecute(Sender);
end;

procedure TfmSpBankCardfmDog.AEditExecute(Sender: TObject);
var
    id_edit : int64;
begin
    if not DataSetDog.IsEmpty then
    begin
        id_edit := StrToInt64(DataSetDog.fbn('R_ID_DOG_BANKCARD').AsString);
        if SpBankCardDogAddShow(id_edit, self) then
        begin
        end;
    end;
end;

procedure TfmSpBankCardfmDog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmSpBankCardfmDog.LoadCaption;
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

    AADD.Caption                         := UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Caption                        := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Caption                         := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Caption                     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Caption                        := UWResourcesUnit.MY_CONST_VIH[index_lang];
    ATake.Caption                        := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.SPBANKCARD_DOG_SHORTNAME[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.SPBANKCARD_DOG_NUMBER[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.SPBANKCARD_DOG_DATE[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.SPBANKCARD_DOG_RS[index_lang];
    cxGrid1DBTableView1DBColumn5.Caption := UWResourcesUnit.SPBANKCARD_DOG_MFO[index_lang];
    cxGrid1DBTableView1DBColumn6.Caption := UWResourcesUnit.SPBANKCARD_DOG_BANK[index_lang];
    cxGrid1DBTableView1DBColumn7.Caption := UWResourcesUnit.SPBANKCARD_DOG_OKPO[index_lang];

    Caption                              := UWResourcesUnit.SPBANKCARD_DOG_CAPTION[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];

end;

procedure TfmSpBankCardfmDog.SelectLangExecute(Sender: TObject);
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

procedure TfmSpBankCardfmDog.FormActivate(Sender: TObject);
begin
    LoadCaption;
end;

procedure TfmSpBankCardfmDog.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ATakeExecute(Sender);
end;

end.
