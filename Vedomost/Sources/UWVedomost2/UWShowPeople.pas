unit UWShowPeople;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ActnList, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxCurrencyEdit;

type
  TfmUWShowPeople = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    Action1: TAction;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    Tr: TpFIBTransaction;
    SelectLang: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
  private
    index_lang : integer;
  public
    { Public declarations }
  end;

procedure ShowUWPeopleZayav(Ao : TComponent; DB : TpFibdataBase; id_ved, id_dog : int64);

implementation
uses Registry,
     UWResourcesUnit;
{$R *.dfm}

procedure ShowUWPeopleZayav(Ao : TComponent; DB : TpFibdataBase; id_ved, id_dog : int64);
var
    T : TfmUWShowPeople;

begin
    T := TfmUWShowPeople.Create(Ao);
    T.LoadCaption;
    T.DB                    := DB;
    T.Tr.DefaultDatabase    := T.DB;
    T.DB.DefaultTransaction := T.Tr;

    T.DS.Database           := T.DB;
    T.DS.Transaction        := T.Tr; 

    T.Tr.StartTransaction;

    T.DS.Close;
    T.DS.SQLs.SelectSQL.Text := 'select * from UW2_SELECT_DOG_VEDOMOST_PEOPLE('+IntToStr(id_ved)+', '+IntToStr(id_dog)+')';
    T.DS.open;

    if T.ShowModal = mrOk then
    begin

    end;
    T.Free;
end;

procedure TfmUWShowPeople.Action1Execute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWShowPeople.LoadCaption;
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

    Caption                                 := UWResourcesUnit.V2_VEDOMOST_SHOW_PEOPLE[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption    := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption    := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption    := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption    := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxGrid1DBTableView1DBColumn5.Caption    := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxGrid1DBTableView1DBColumn6.Caption    := UWResourcesUnit.MY_CONST_SUMMA[index_lang];
end;

procedure TfmUWShowPeople.SelectLangExecute(Sender: TObject);
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
