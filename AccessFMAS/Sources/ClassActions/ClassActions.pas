unit ClassActions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls, MainDM, Db,
  IBCustomDataSet, IBQuery, IBDatabase, ActnList;

type
  TFormClassAction = class(TForm)
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    GroupBoxCalsses: TGroupBox;
    ToolBar2: TToolBar;
    ToolButtonAddClass: TToolButton;
    ToolButtonEditClass: TToolButton;
    TreeView1: TTreeView;
    GroupBoxActions: TGroupBox;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButtonAddAction: TToolButton;
    ToolButtonEditAction: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    IBQueryActions: TIBQuery;
    IBTransactionActions: TIBTransaction;
    DataSourceActions: TDataSource;
    ActionList: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    procedure AddActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses AddAction;

procedure TFormClassAction.FormCreate(Sender: TObject);
begin
     try
        IBQueryActions.Open;
     except
           on exc: Exception do
           begin
                MessageBox(Handle,
                  PChar('Ошибка! Невозможно выполнить запрос ! '+exc.Message),
                  PChar('Ошибка'),MB_OK+MB_ICONERROR);
           end;
     end;
end;

procedure TFormClassAction.AddActionExecute(Sender: TObject);
var
   FormAddAction: TFormAddAction;
begin
     FormAddAction := TFormAddAction.Create(Self, fmAdd);
     FormAddAction.ShowModal;
     if FormAddAction.ModalResult <> mrCancel then
     begin
        IBQueryActions.Close;
        IBQueryActions.Open;
        if FormAddAction.ResultID <> -1 then
           IBQueryActions.Locate('ID_ACTION',FormAddAction.ResultID,[]);
     end;
     FormAddAction.Free;
end;

procedure TFormClassAction.EditActionExecute(Sender: TObject);
var
   FormEditAction: TFormAddAction;
   EditRecID: Integer;
begin
     EditRecID := IBQueryActions.FieldByName('ID_ACTION').AsInteger;
     FormEditAction := TFormAddAction.Create(Self, fmEdit);
     FormEditAction.ShowModal;
     IBQueryActions.Close;
     IBQueryActions.Open;
     IBQueryActions.Locate('ID_ACTION',EditRecID,[]);
     FormEditAction.Free;
end;

procedure TFormClassAction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
