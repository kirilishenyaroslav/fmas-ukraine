unit dt_Type_Doc_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, FIBDataSet, pFIBDataSet, Buttons, ToolWin, ComCtrls, Grids, DBGrids,
  FIBQuery, pFIBQuery, pFIBStoredProc, tagBaseTypes, Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridLevel, cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit;

type
  Tdt_Type_Doc_Form1 = class(TForm)
    ToolBar1: TToolBar;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    EditButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CloseButton: TSpeedButton;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    StoredProc: TpFIBStoredProc;
    SelectButton: TSpeedButton;
    PopupMenu: TPopupMenu;
    AddPopup: TMenuItem;
    EditPopup: TMenuItem;
    DelPopup: TMenuItem;
    N4: TMenuItem;
    RefreshPopup: TMenuItem;
    SelectPopup: TMenuItem;
    DBGrid1: TcxGrid;
    DBGrid1Level1: TcxGridLevel;
    DBGrid1DBTableView1: TcxGridDBTableView;
    DBGrid1DBTableView1ID_TYPE_DOC: TcxGridDBColumn;
    DBGrid1DBTableView1NAME_TYPE_DOC: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddPopupClick(Sender: TObject);
    procedure EditPopupClick(Sender: TObject);
    procedure DelPopupClick(Sender: TObject);
    procedure RefreshPopupClick(Sender: TObject);
    procedure SelectPopupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dt_Type_Doc_Form1 : Tdt_Type_Doc_Form1;
  Options           : TSpravOptions;
  id_Type_Doc       : integer;
  Name_Type_Doc     : string; 
implementation

uses DataModule, dt_Type_Doc_Form_Add;

{$R *.DFM}

procedure Tdt_Type_Doc_Form1.FormCreate(Sender: TObject);
begin
 DataSet.Active              := False;
 DataSet.Transaction         := dm.ReadTransaction;
 DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_DT_TYPE_DOC';
 DataSet.Active              := True;

 AddButton.Visible           := Options.canAdd;
 SelectButton.Visible        := Options.canSelect;
 ToolBar1.Visible            := Options.HideButtons;
 EditButton.Visible          := Options.canEdit;
 DelButton.Visible           := Options.canDelete;

 AddPopup.Visible            := Options.canAdd;
 SelectPopup.Visible         := Options.canSelect;
 EditPopup.Visible           := Options.canEdit;
 DelPopup.Visible            := Options.canDelete;
end;

procedure Tdt_Type_Doc_Form1.CloseButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tdt_Type_Doc_Form1.RefreshButtonClick(Sender: TObject);
begin
 FormCreate(Sender);
end;

procedure Tdt_Type_Doc_Form1.AddButtonClick(Sender: TObject);
var
 Name_Type_Doc : string;
begin
 if dt_Type_Doc_Form_Add1 <> nil then exit;
 Application.CreateForm(Tdt_Type_Doc_Form_Add1, dt_Type_Doc_Form_Add1);
 dt_Type_Doc_Form_Add1.Caption := 'Додати тип документів';
 dt_Type_Doc_Form_Add1.ShowModal;

 if dt_Type_Doc_Form_Add1.ModalResult = mrOk then begin
  Name_Type_Doc          := dt_Type_Doc_Form_Add1.Name_Type_Doc.Text;
  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_DT_TYPE_DOC_ADD', [Name_Type_Doc]);
  StoredProc.Transaction.Commit;
  FormCreate(Sender);
 end;
 dt_Type_Doc_Form_Add1.Free;
 dt_Type_Doc_Form_Add1 := nil;
end;

procedure Tdt_Type_Doc_Form1.DelButtonClick(Sender: TObject);
begin
{ case MessageDlg('Ви дійсно бажаєте знищити цей запис?', mtConfirmation, [mbYes, mbNo], 0) of
 mrYes :
  begin
   StoredProc.Transaction := dm.WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('SP_DT_TYPE_DOC_DEL', [DBGrid1.Columns[0].Field.asinteger]);
   StoredProc.Transaction.Commit;
   FormCreate(Sender);
  end;
 mrNo : Exit;
 end;}
end;

procedure Tdt_Type_Doc_Form1.EditButtonClick(Sender: TObject);
{var
 id_Type_Doc   : integer;
 Name_Type_Doc : string;}
begin
{ if dt_Type_Doc_Form_Add1 <> nil then exit;
 Application.CreateForm(Tdt_Type_Doc_Form_Add1, dt_Type_Doc_Form_Add1);
 dt_Type_Doc_Form_Add1.Caption            := 'Змінити тип документів';
 dt_Type_Doc_Form_Add1.Name_Type_Doc.Text := DBGrid1.Columns[1].Field.AsString;
 dt_Type_Doc_Form_Add1.ShowModal;
 if dt_Type_Doc_Form_Add1.ModalResult = mrOk then begin
  id_Type_Doc            := DBGrid1.Columns[0].Field.AsInteger;
  Name_Type_Doc          := dt_Type_Doc_Form_Add1.Name_Type_Doc.Text;
  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_DT_TYPE_DOC_MODIFY', [id_Type_Doc, Name_Type_Doc]);
  StoredProc.Transaction.Commit;
  FormCreate(Sender);
 end;
 dt_Type_Doc_Form_Add1.Free;
 dt_Type_Doc_Form_Add1 := nil;}
end;

procedure Tdt_Type_Doc_Form1.SelectButtonClick(Sender: TObject);
begin
{ id_Type_Doc   := DBGrid1.Columns[0].Field.AsInteger;
 Name_Type_Doc := DBGrid1.Columns[1].Field.AsString;
 ModalResult := mrOK;}
end;

procedure Tdt_Type_Doc_Form1.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 then CloseButtonClick(Sender);
 if SelectButton.Visible and (Key = #13) then SelectButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.DBGrid1DblClick(Sender: TObject);
begin
 if SelectButton.Visible then SelectButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.FormDestroy(Sender: TObject);
begin
 dt_Type_Doc_Form1 := NIL;
end;

procedure Tdt_Type_Doc_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Type_Doc_Form1.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then RefreshButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tdt_Type_Doc_Form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

end.
