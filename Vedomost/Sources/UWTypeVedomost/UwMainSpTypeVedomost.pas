unit UwMainSpTypeVedomost;
                                                        
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, ActnList, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxCheckBox, dxStatusBar;

type
  TfmUwMainSpTypeVedomost = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ImageList1: TImageList;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    ATake: TAction;
    AExit: TAction;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DataSource1: TDataSource;
    DSID_SP_TYPE_VEDOMOST: TFIBBCDField;
    DSNAME: TFIBStringField;
    DSMAKE_DBF: TFIBSmallIntField;
    DSSELECT_DOGOVOR: TFIBSmallIntField;
    DSID_PRINT_SHABLON: TFIBBCDField;
    TransactionWrite: TpFIBTransaction;
    DataSetDel: TpFIBDataSet;
    SelectLang: TAction;
    dxStatusBar1: TdxStatusBar;
    DSNAME_SHABLON: TFIBStringField;
    procedure AExitExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ATakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    ResValue : Variant;
    canres : boolean;
    index_lang : smallint;
  public
    id_located : int64;
    constructor Create(Ao : TComponent; D : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean); reintroduce; overload;
  end;

function SelectVedomostTypeVd(Ao : TComponent; DB : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean) : variant; stdcall;

    exports SelectVedomostTypeVd;


implementation
uses AddUWSpTypeVedomost,
     UWResourcesUnit,
     Registry;
{$R *.dfm}
{ TfmUwMainSpTypeDogovor }

function SelectVedomostTypeVd(Ao : TComponent; DB : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean) : variant; stdcall;
var
    T : TfmUwMainSpTypeVedomost;
begin
    T := TfmUwMainSpTypeVedomost.Create(Ao, DB, id_user, SelectData, CanEdit);
    if SelectData then
    begin
        T.ShowModal;
        Result := T.ResValue;
        T.Free;
    end else
    begin
        T.FormStyle   := fsMDIChild;
//        T.WindowState := wsMaximized;
        T.Show;
        Result := -1;
    end;
end;

constructor TfmUwMainSpTypeVedomost.Create(Ao: TComponent; D : TpfibDatabase;
  id_user: int64; SelectData, CanEdit: boolean);
begin
    inherited Create(Ao);

    DB                    := D;
    Tr.DefaultDatabase    := DB;
    Db.DefaultTransaction := Tr;

    DS.Database           := DB;
    DS.Transaction        := Tr;

    Tr.StartTransaction;

    canres := CanEdit;

    if not SelectData then
    begin
        ATake.Visible := false;
    end;
    if not CanEdit then
    begin
        AAdd.Visible  := false;
        AEdit.Visible := false;
        ADel.Visible  := false;
    end;

    DS.Open;

    LoadCaption;
end;

procedure TfmUwMainSpTypeVedomost.AExitExecute(Sender: TObject);
begin
    if canres then ResValue := -1;
    Close;
end;

procedure TfmUwMainSpTypeVedomost.ARefreshExecute(Sender: TObject);
var
    id : int64;
begin
    id := -1;
    if not DS.isEmpty then
        id := StrToInt64(Ds.fbn('ID_SP_TYPE_VEDOMOST').AsString);
    DS.CloseOpen(true);
    if not DS.isEmpty then
        Ds.Locate('ID_SP_TYPE_VEDOMOST', id, []);
end;

procedure TfmUwMainSpTypeVedomost.AAddExecute(Sender: TObject);
var
    T : TfmAddUWSpTypeVedomost;
begin
    T := TfmAddUWSpTypeVedomost.Create(Self, Self, 1);
    T.ShowModal;
    T.Free;
//    myform.DS.Locate('ID_SP_TYPE_VEDOMOST', id, []);
    DS.Locate('ID_SP_TYPE_VEDOMOST', id_located, []);

end;

procedure TfmUwMainSpTypeVedomost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmUwMainSpTypeVedomost.ATakeExecute(Sender: TObject);
begin
    ResValue := VarArrayOf([DS.FieldByName('ID_SP_TYPE_VEDOMOST').AsString,
                            DS.FieldByName('NAME').AsString,
                            DS.FieldByName('MAKE_DBF').AsInteger,
                            DS.FieldByName('SELECT_DOGOVOR').AsInteger,
                            DS.FieldByName('ID_PRINT_SHABLON').AsVariant
                            ]);
    Close;
end;

procedure TfmUwMainSpTypeVedomost.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
    ATakeExecute(Sender);
end;

procedure TfmUwMainSpTypeVedomost.ADelExecute(Sender: TObject);
var
    s : string;
    id_del, id_pr : int64;
begin
    if not DS.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.VEDOMOST_TYPE_VEDOM_DELETE[index_lang] + ' - ' + DS.FBN('NAME').AsString ), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            TransactionWrite.DefaultDatabase := Db;

            DataSetDel.Database              := Db;
            DataSetDel.Transaction           := TransactionWrite;

            TransactionWrite.StartTransaction;

            try
                id_del := StrToInt64(DS.fbn('ID_SP_TYPE_VEDOMOST').AsString);
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                id_pr  := StrToInt64(DS.fbn('ID_SP_TYPE_VEDOMOST').AsString);
                DS.Locate('ID_SP_TYPE_VEDOMOST', id_del, []);
                DataSetDel.Close;
                DataSetDel.SQLs.SelectSQL.Text := 'select * from UW_SP_TYPE_VEDOMOST_DELETE('+intToStr(id_del)+')';
                DataSetDel.Open;
                if DataSetDel.fbn('R_RESULT').AsInteger = 1 then
                begin
                    DataSetDel.Close;
                    TransactionWrite.Commit;
                    DS.CloseOpen(true);
                    DS.Locate('ID_SP_TYPE_VEDOMOST', id_pr, []);
                    exit;
                end else
                begin
                    DataSetDel.Close;
                    TransactionWrite.Rollback;
                    showmessage(UWResourcesUnit.VEDOMOST_TYPE_VEDOM_DONT_DEL[index_lang]);
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

procedure TfmUwMainSpTypeVedomost.LoadCaption;
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

    AAdd.Caption                         := UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Caption                        := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Caption                         := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Caption                     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ATake.Caption                        := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    AExit.Caption                        := UWResourcesUnit.MY_CONST_CLOSE[index_lang];

    Caption                              := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_CAPTION[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.SPBANKCARD_DOG_SHORTNAME[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_MAKE_DBF[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SEL_DOG[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];

end;

procedure TfmUwMainSpTypeVedomost.SelectLangExecute(Sender: TObject);
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

procedure TfmUwMainSpTypeVedomost.AEditExecute(Sender: TObject);
var
    T : TfmAddUWSpTypeVedomost;
begin
    if not DS.IsEmpty then
    begin
        T := TfmAddUWSpTypeVedomost.Create(Self, Self, 2);
        T.ShowModal;
        T.Free;
        DS.Locate('ID_SP_TYPE_VEDOMOST', id_located, []);
    end;
end;

procedure TfmUwMainSpTypeVedomost.FormActivate(Sender: TObject);
begin
    LoadCaption
end;

end.
