unit uGrantSubTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, StdCtrls,
  cxButtons, cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit, cxLabel, ucs_types, ucs_loader,
  ibase, DogLoaderUnit, ActnList;

type
  TfmGrantSubAdd = class(TForm)
    cxLabel4: TcxLabel;
    MemoName: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    ButtonEditType: TcxButtonEdit;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    procedure ButtonEditTypePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_name, id_subtype_name : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmGrantSubAdd: TfmGrantSubAdd;  }

implementation

uses DM_GrantSubType;

{$R *.dfm}

constructor TfmGrantSubAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantSubAdd.ButtonEditTypePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TcsParamPacks;
    res : variant;
begin
    AParameter := TcsParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;
    res := DoFunctionFromPackage(AParameter, ['Contingent_Student\Cs_GrantType.bpl', 'ShowGrantType']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_type_name := res[0];
        ButtonEditType.Text:= vartostr(res[1]);
    end;
end;

procedure TfmGrantSubAdd.OkButtonClick(Sender: TObject);
begin
    if  (MemoName.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити назву підтипу стипендії!');
      MemoName.SetFocus;
      Exit;
    end;
    if  (id_type_name = null)  then
    Begin
        ShowMessage('Необхідно вибрати вид стипендії!');
        ButtonEditType.SetFocus;
        Exit;
    end;
    Modalresult := mrOk;
end;

procedure TfmGrantSubAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

end.
