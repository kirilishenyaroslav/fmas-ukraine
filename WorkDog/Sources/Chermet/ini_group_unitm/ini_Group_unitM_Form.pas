{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Справочник групп единиц измерения"                 }
{   Отображение, добавление, изменение, удаление групп единиц измерения        }
{                                               ответственный: Андрей Таганский}

unit ini_Group_unitM_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Db, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, BaseTypes, Menus, ActnList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, dxBar, dxBarExtItems,
  dogLoaderUnit, FIBDatabase, pFIBDatabase, IB_Externals;

type
  Tini_Group_unitM_Form1 = class(TForm)
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    PopupMenu: TPopupMenu;
    AddPopup: TMenuItem;
    EditPopup: TMenuItem;
    DelPopup: TMenuItem;
    N4: TMenuItem;
    RefreshPopup: TMenuItem;
    SelectPopup: TMenuItem;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    DBGrid1: TcxGrid;
    DBGrid1Level1: TcxGridLevel;
    TableView: TcxGridDBTableView;
    ID_GROUP_UNITM_Column: TcxGridDBColumn;
    NAME_GROUP_UNITM_Column: TcxGridDBColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddPopupClick(Sender: TObject);
    procedure EditPopupClick(Sender: TObject);
    procedure DelPopupClick(Sender: TObject);
    procedure RefreshPopupClick(Sender: TObject);
    procedure SelectPopupClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   id_Group_unitM_Add    : Integer;
   Input : TSpravParams;
   output : TSpravParams;
   destructor Destroy; override;
   procedure SelectAll;
   function tagShow(SpravOptions : TSpravOptions) : TResultArray;
  end;

var
  ini_Group_unitM_Form1 : Tini_Group_unitM_Form1;
  Options               : TSpravOptions;

 procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
 exports Load;

implementation

uses ini_Group_unitM_Form_Add;

{$R *.DFM}


procedure Load(Owner : TComponent; input : PSpravParams; output : PSpravParams); stdcall;
var
 f : Tini_Group_unitM_Form1;
begin
 f := Tini_Group_unitM_Form1.Create(Owner);
 f.Input := input^;
 f.output := output^;
 f.WorkDatabase.Handle := PVoid(Integer(input.Values['DataBase']));
 f.ReadTransaction.Handle := PVoid(Integer(input.Values['ReadTransaction']));
 f.WriteTransaction.Handle := PVoid(Integer(input.Values['WriteTransaction']));
 input.ApplyOnForm(f);
 if f.FormStyle = fsNormal then begin
  f.ShowModal;
  f.Free;
 end else f.Show;
end;


destructor Tini_Group_unitM_Form1.Destroy;
begin
 ini_Group_unitM_Form1 := nil;
 inherited;
end;

function Tini_Group_unitM_Form1.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr      : integer;
 idVar   : integer;
 TextVar : string;
begin
 if ini_Group_unitM_Form1 <> nil then Exit;
 Options := SpravOptions;

 Application.CreateForm(Tini_Group_unitM_Form1, ini_Group_unitM_Form1);

 SetLength(Result, 0);
 if Options.isModal then begin
  mr := ini_Group_unitM_Form1.ShowModal;
  if mr = mrOK then begin
   idVar   := ini_Group_unitM_Form1.DataSet.FieldByName('ID_GROUP_UNITM').asInteger;
   TextVar := ini_Group_unitM_Form1.DataSet.FieldByName('NAME_GROUP_UNITM').asString;
   SetLength(Result, 2);
   Result[0] := idVar;
   Result[1] := TextVar;
  end;
 end else begin
  ini_Group_unitM_Form1.FormStyle := fsMDIChild;
  ini_Group_unitM_Form1.Show;
 end;
end;

procedure Tini_Group_unitM_Form1.RefreshButtonClick(Sender: TObject);
var
 id_Key : integer;
begin
 id_Key := DataSet['ID_GROUP_UNITM'];

 SelectAll;

 TableView.DataController.LocateByKey(id_Key);
end;

procedure Tini_Group_unitM_Form1.CloseButtonClick(Sender: TObject);
begin
 if Options.isModal then ModalResult := mrCancel
 else Close;
 output.Values['ModalResult'] := mrCancel;
end;

procedure Tini_Group_unitM_Form1.AddButtonClick(Sender: TObject);
begin
 if ini_Group_unitM_Form_Add1 <> nil then exit;
 Application.CreateForm(Tini_Group_unitM_Form_Add1, ini_Group_unitM_Form_Add1);
 ini_Group_unitM_Form_Add1.Caption := 'Додати групу одиниць вимірювання';
 ini_Group_unitM_Form_Add1.ShowModal;
 if ini_Group_unitM_Form_Add1.ModalResult = mrOk then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_INI_GROUP_unitM_ADD', [ini_Group_unitM_Form_Add1.Name_Group_unitM.Text]);
  id_Group_unitM_Add := StoredProc.Fields[0].AsInteger;
  StoredProc.Transaction.Commit;
  RefreshButtonClick(Sender);
 end;
end;

procedure Tini_Group_unitM_Form1.EditButtonClick(Sender: TObject);
begin
 if DataSet.Fields[0].AsString = '' then Exit;
 if ini_Group_unitM_Form_Add1 <> nil then exit;
 Application.CreateForm(Tini_Group_unitM_Form_Add1, ini_Group_unitM_Form_Add1);
 ini_Group_unitM_Form_Add1.Caption := 'Змінити групу одиниць вимірювання';
 ini_Group_unitM_Form_Add1.Name_Group_unitM.Text := DataSet.Fields[1].AsString;
 ini_Group_unitM_Form_Add.id_Group_unitM         := DataSet.Fields[0].AsInteger;
 ini_Group_unitM_Form_Add1.ShowModal;
 if ini_Group_unitM_Form_Add1.ModalResult = mrOk then begin
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_INI_GROUP_unitM_MODIFY', [ini_Group_unitM_Form_Add.id_Group_unitM,
  ini_Group_unitM_Form_Add1.Name_Group_unitM.Text]);
  StoredProc.Transaction.Commit;
  RefreshButtonClick(Sender);
 end;
end;

procedure Tini_Group_unitM_Form1.DelButtonClick(Sender: TObject);
begin
 if DataSet.Fields[0].AsString = '' then Exit;
 case MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цей запис?', mtConfirmation, [mbYes, mbNo]) of
 mrYes :
  begin
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_INI_GROUP_unitM_DEL', [DataSet.Fields[0].AsInteger]);
   StoredProc.Transaction.Commit;
   RefreshButtonClick(Sender);
  end;
 mrNo : Exit;
 end;
end;

procedure Tini_Group_unitM_Form1.SelectButtonClick(Sender: TObject);
begin
  output.Values['ID_GROUP_UNITM'] := DataSet.FieldByName('ID_GROUP_UNITM').asInteger;
  output.Values['NAME_GROUP_UNITM'] := DataSet.FieldByName('NAME_GROUP_UNITM').AsString;
  output.Values['ModalResult'] := mrOk;
  ModalResult := mrOk;
end;

procedure Tini_Group_unitM_Form1.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 then CloseButtonClick(Sender);
 if (SelectButton.Visible = ivAlways) and (Key = #13) then SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DBGrid1DblClick(Sender: TObject);
begin
 if (SelectButton.Visible = ivAlways) then SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Group_unitM_Form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionSelExecute(Sender: TObject);
begin
 DBGrid1DblClick(Sender); 
end;

procedure Tini_Group_unitM_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tini_Group_unitM_Form1.SelectAll;
begin
 if not WorkDatabase.Connected then Exit;
 DataSet.Active := False;
 DataSet.SQLs.SelectSQL.Text := 'select * from INI_GROUP_unitM_VIEW';
 DataSet.Active := True;
end;

procedure Tini_Group_unitM_Form1.FormShow(Sender: TObject);
begin
 SelectAll;
end;

end.
