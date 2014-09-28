unit UWSelectPrintShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, ComCtrls, ToolWin, ActnList, ImgList;

type
  TfmUWSelectPrintShablon = class(TForm)
    DBase: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DS: TpFIBDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ATake: TAction;
    ARefresh: TAction;
    AExit: TAction;
    Selectlang: TAction;
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
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    procedure ARefreshExecute(Sender: TObject);
    procedure AExitExecute(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectlangExecute(Sender: TObject);
  private
    index_lang : smallint;
  public
    { Public declarations }
  end;

function ShowSelectPrintShablon (Ao : TComponent; db : TpfibDatabase; var  id_pr : int64; var str : string) : boolean;


implementation
uses Registry,
     UWResourcesUnit;

{$R *.dfm}

function ShowSelectPrintShablon (Ao : TComponent; db : TpfibDatabase; var  id_pr : int64; var str : string) : boolean;
var
    T : TfmUWSelectPrintShablon;
begin
    T := TfmUWSelectPrintShablon.Create(Ao);
    T.LoadCaption;
    T.DBase                    := Db;
    T.Tr.DefaultDatabase       := T.DBase;
    T.DBase.DefaultTransaction := T.Tr;
    T.DS.Database              := T.DBase;
    T.DS.Transaction           := T.Tr;

    T.Tr.StartTransaction;

    T.DS.SQLs.SelectSQL.Text := 'select * from UW_PRINT_SHABLON_SELECT_ALL';
    T.DS.Open;
    T.DS.FetchAll;
    if T.DS.RecordCount = 1 then
    begin
        id_pr  := StrToInt64(T.DS.fbn('ID_SHABLON').AsString);
        str    := T.DS.fbn('NAME_SHABLON').AsString;
        Result := true;
        exit;
    end;

    if T.ShowModal = mrOk then
    begin
        id_pr  := StrToInt64(T.DS.fbn('ID_SHABLON').AsString);
        str    := T.DS.fbn('NAME_SHABLON').AsString;
        result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;


procedure TfmUWSelectPrintShablon.ARefreshExecute(Sender: TObject);
begin
    DS.Close;    
    DS.SQLs.SelectSQL.Text := 'select * from UW_PRINT_SHABLON_SELECT_ALL';
    DS.Open;
end;

procedure TfmUWSelectPrintShablon.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWSelectPrintShablon.ATakeExecute(Sender: TObject);
begin
    if not DS.IsEmpty then ModalResult := mrOk;
end;

procedure TfmUWSelectPrintShablon.LoadCaption;
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

    ARefresh.Caption                     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ATake.Caption                        := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    AExit.Caption                        := UWResourcesUnit.MY_CONST_CLOSE[index_lang];

    Caption                              := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_CAP[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_D1[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_P1[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_D2[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_P2[index_lang];
    cxGrid1DBTableView1DBColumn5.Caption := UWResourcesUnit.VEDOMOST_TYPE_VEDOM_SHABLO_TY[index_lang];

end;

procedure TfmUWSelectPrintShablon.SelectlangExecute(Sender: TObject);
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

end.
