unit uPiTypeDocAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit, cxLabel, ibase,
  cxMaskEdit, cxButtonEdit,  upi_resources, upi_Loader;

type
  TfmPiTypeDocAdd = class(TForm)
    cxLabel4: TcxLabel;
    MemoName: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    LabelKod1DF: TcxLabel;
    ButtonEditProp: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ButtonEditPropPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_type_name, id_prop_income: variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmPiTypeDocAdd: TfmPiTypeDocAdd;

implementation

uses DMPiTypeDoc;

{$R *.dfm}

constructor TfmPiTypeDocAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmPiTypeDocAdd.OkButtonClick(Sender: TObject);
begin
    if  (MemoName.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити назву типу стипендії!');
        MemoName.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmPiTypeDocAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmPiTypeDocAdd.ButtonEditPropPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TPiParamPacks;
    res : variant;
begin
    AParameter := TPiParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;

    res := DoFunctionFromPackage(AParameter, ['Personal_income\Pi_SpPropIncome.bpl', 'ShowPiPropIncome']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_prop_income := res[0];
        ButtonEditProp.Text:= vartostr(res[1])+' '+vartostr(res[2]);
    end;
end;

end.
