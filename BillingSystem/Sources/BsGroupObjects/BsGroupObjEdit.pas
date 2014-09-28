unit BsGroupObjEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxCheckBox, ActnList, DB, FIBDataSet,
  pFIBDataSet;

type
  TfrmGroupObjEdit = class(TForm)
    NameObjEdit: TcxTextEdit;
    NameComment: TcxTextEdit;
    btnAdd: TcxButton;
    btnCancel: TcxButton;
    lblNameObj: TcxLabel;
    lblComment: TcxLabel;
    lblKodObj: TcxLabel;
    KodEdit: TcxTextEdit;
    btnAddParent: TcxButton;
    ActionList1: TActionList;
    ActAdd: TAction;
    ActAddParent: TAction;
    ActCancel: TAction;
    lblNode: TcxLabel;
    NodeEdit: TcxTextEdit;
    ObjectSet: TpFIBDataSet;
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure ActAddExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure ActAddParentExecute(Sender: TObject);
  private
     function CheckData:boolean;
  public
     CurrentNode, UpperNode:Integer;
     constructor Create(AOwner:TComponent; IdCurNode, IdUpperNode:Variant; EditMode:String);reintroduce;
  end;

var
  frmGroupObjEdit: TfrmGroupObjEdit;

implementation

uses BsGroupObj;

{$R *.dfm}

constructor TfrmGroupObjEdit.Create(AOwner:TComponent; IdCurNode, IdUpperNode:Variant; EditMode:string);
begin
   inherited Create(AOwner);
   If VarIsNull(IdCurNode) then UpperNode:=-1
   else
   begin
       CurrentNode:=IdCurNode;
       UpperNode:=IdUpperNode;
       ObjectSet.Close;
       ObjectSet.SQLs.SelectSQL.Text:='Select Distinct Name_Gr_List_Obj '+
                                      'From BS_NAME_GR_LIST_OBJ_SEL '+
                                      'Where Id_Gr_List_Obj=:Id_Gr_List_Obj';
       ObjectSet.ParamByName('Id_Gr_List_Obj').AsInteger:=UpperNode;
       ObjectSet.Open;
       NodeEdit.Text:=ObjectSet['Name_Gr_List_Obj'];
   end;

   if EditMode='Edit' then
   begin
      ActAddParent.Enabled:=False;
      btnAddParent.Visible:=False;
      btnAdd.Left:=180;
      ActAdd.Caption:='Змінити';
   end
   else
   begin
      if UpperNode=-1 then
      begin
         ActAddParent.Enabled:=False;
         btnAddParent.Enabled:=ActAddParent.Enabled;
         lblNode.Visible:=False;
         NodeEdit.Visible:=False;
         btnAdd.Top:=109;
         btnAddParent.Top:=109;
         btnCancel.Top:=109;
      end;
   end;
end;

function TfrmGroupObjEdit.CheckData:Boolean;
begin
   Result:=True;
   if KodEdit.Text='' then
   begin
      KodEdit.Style.Color:=clRed;
      ShowMessage('Ви не заповнили поле "Код об''єкту"');
      Result:=False;
   end;
   if NameObjEdit.Text='' then
   begin
      NameObjEdit.Style.Color:=clRed;
      ShowMessage('Ви не заповнили поле "Назва об''єкту"');
      Result:=False;
   end;
end;

procedure TfrmGroupObjEdit.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
   if ((key in ['0'..'9']) or (Key=#8)) then KodEdit.Properties.ReadOnly:=False
   else KodEdit.Properties.ReadOnly:=True;
end;

procedure TfrmGroupObjEdit.ActAddExecute(Sender: TObject);
begin
   if CheckData then
   begin
      if UpperNode=CurrentNode then UpperNode:=-1;
      ModalResult:=mrOk;
   end;
end;

procedure TfrmGroupObjEdit.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmGroupObjEdit.ActAddParentExecute(Sender: TObject);
begin
   if CheckData then
   begin
      UpperNode:=CurrentNode;
      ModalResult:=mrOk;
   end;
end;

end.
