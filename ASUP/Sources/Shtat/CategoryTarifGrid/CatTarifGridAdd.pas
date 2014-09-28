unit CatTarifGridAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCurrencyEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, uFControl, uLabeledFControl,
  uCharControl, uFloatControl, cxCheckBox, BaseTypes, uIntControl;

type
  TfrmCatTarifGridAdd = class(TForm)
    CatNote: TcxTextEdit;
    lblNote: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    CatKoeff: TqFFloatControl;
    lblKoeff: TcxLabel;
    CategoryEdit: TqFIntControl;
    lblCategory: TcxLabel;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; EditMode:Boolean);
  end;

var
  frmCatTarifGridAdd: TfrmCatTarifGridAdd;

implementation

uses CatTarifGridMain;

{$R *.dfm}

constructor TfrmCatTarifGridAdd.Create(AOwner:TComponent; EditMode:Boolean);
begin
   inherited Create(AOwner);
   if EditMode=False then
   begin
      CategoryEdit.Value:=0;
      CatKoeff.Value:=0;
   end;
end;

procedure TfrmCatTarifGridAdd.ActOkExecute(Sender: TObject);
begin
    If (VarIsNull(CategoryEdit.Value)) then
    begin
       agMessageDlg('Увага', 'Треба ввести розряд!', mtInformation, [mbOK]);
       Exit;
    end;

    If (VarIsNull(CatKoeff.Value)) then
    begin
       agMessageDlg('Увага', 'Треба ввести коефіцієнт!', mtInformation, [mbOK]);
       Exit;
    end;

    ModalResult:=mrOk;
end;

procedure TfrmCatTarifGridAdd.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
