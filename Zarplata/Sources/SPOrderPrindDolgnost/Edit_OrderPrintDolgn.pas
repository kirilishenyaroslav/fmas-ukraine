unit Edit_OrderPrintDolgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, ActnList;

type  TParamEdit = class
  ZnachDolgnost:string;
  ZnachNameDolgnost:string;
  idReport:Integer;
  AOwner:TComponent;
end;

type
  TFEdit = class(TForm)
    TextEditValue: TcxMaskEdit;
    Panel1: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActionList: TActionList;
    ActionEnter: TAction;
    ActionEsc: TAction;
    MENameDolgnost: TcxMaskEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    constructor create(Param:TParamEdit) ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure ActionEscExecute(Sender: TObject);
  private
    LocParam:TParamEdit;

  public
    { Public declarations }
  end;



var
  FEdit: TFEdit;

implementation

{$R *.dfm}

procedure TFEdit.btnOkClick(Sender: TObject);
begin
  
  LocParam.ZnachDolgnost:=VarToStrDef(TextEditValue.EditValue,'');
  LocParam.ZnachNameDolgnost:=VarToStrDef(MENameDolgnost.EditValue,'');
  ModalResult:=mrOk;
end;

procedure TFEdit.btnCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

constructor TFEdit.create(Param:TParamEdit);
begin
  inherited create(Param.AOwner);
  LocParam:=Param;
  TextEditValue.EditValue:=Param.ZnachDolgnost;
  MENameDolgnost.EditValue:= Param.ZnachNameDolgnost;
end;

procedure TFEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //Action:=caFree;
end;

procedure TFEdit.Action1Execute(Sender: TObject);
begin
  if btnOk.Focused then  btnOkClick(sender)
  else if btnCancel.Focused then btnCancelClick(Sender)
  else  keybd_event(VK_TAB,0,0,0);
end;

procedure TFEdit.ActionEscExecute(Sender: TObject);
begin
  btnCancelClick(Sender);
end;

end.
