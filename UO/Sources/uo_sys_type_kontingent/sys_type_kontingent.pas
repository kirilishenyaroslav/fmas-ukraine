unit sys_type_kontingent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ibase, AArray, ib_externals;

type
  Tfmsys_type_kontingent = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
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
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    DataSource1: TDataSource;
    Atake: TAction;
    DSID_SYS_TYPE_KONTINGENT: TFIBBCDField;
    DSKOD: TFIBIntegerField;
    DSNAME: TFIBStringField;
    DSNPP: TFIBIntegerField;
    DSMODULE_NAMES: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    DBHANDLE      : TISC_DB_HANDLE;
  public
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;

implementation
uses uUO_Loader;
{$R *.dfm}

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
var
    T : Tfmsys_type_kontingent;
begin
    T := Tfmsys_type_kontingent.Create(aOwner, aParam);

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
       fsNormal:   begin
                       T.ShowModal;
                   end;
       fsMDIChild: begin
                   end;
    else
        T.Free;
    end;
end;

{ Tfmsys_type_kontingent }

constructor Tfmsys_type_kontingent.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        DB.Handle             := DBHANDLE;
        Tr.DefaultDatabase    := DB;
        DB.DefaultTransaction := Tr;
        DS.Database           := DB;
        DS.Transaction        := Tr;
        Tr.StartTransaction;

        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UO_SYS_TYPE_KONTINGENT';
        DS.Open;
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfmsys_type_kontingent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure Tfmsys_type_kontingent.AtakeExecute(Sender: TObject);
var
    InputParam : TAArray;
    n : string;
begin
    if not DS.isEmpty then
    begin
        try n := ds.fbn('MODULE_NAMES').AsString; except begin n := ''; showmessage('ПОМИЛКА у системній таблиці! Зверніться до системного удмміністратора.'); exit; end; end;
        InputParam                                      := TAArray.Create;
        InputParam['Name_Bpl'].AsString                 := n;
        InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
        uUO_Loader.ShowAllUOBpl(self, InputParam);
    end;
end;

procedure Tfmsys_type_kontingent.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
    AtakeExecute(Sender);
end;

procedure Tfmsys_type_kontingent.cxGrid1DBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = VK_RETURN) then AtakeExecute(Sender);
end;

end.
