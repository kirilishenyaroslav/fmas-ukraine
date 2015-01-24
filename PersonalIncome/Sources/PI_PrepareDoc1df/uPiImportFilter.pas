unit uPiImportFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, GlobalSPR, ibase;

type
  TfmImportFilter = class(TForm)
    LabelDateCame: TcxLabel;
    DateEditCame: TcxDateEdit;
    LabelDateLeave: TcxLabel;
    DateEditLeave: TcxDateEdit;
    LabelKod1DF: TcxLabel;
    ButtonEditSch: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure ButtonEditPropPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_sch : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmImportFilter: TfmImportFilter;

implementation

uses DMPIPrepareDoc1df;

{$R *.dfm}

constructor TfmImportFilter.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  Screen.Cursor:=crDefault;
end;

procedure TfmImportFilter.ButtonEditPropPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    Res := GlobalSPR.GetSch(self, dm.Db.Handle, fsNormal, DateEditCame.Date, 1, 0, -1);
    if VarArrAyDimCount(res) > 0
    then
    begin
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch     := Res[0][0];
            ButtonEditSch.Text := Res[0][3] + ' - ' + Res[0][1];
        end;
    end;
end;

procedure TfmImportFilter.YesBtnClick(Sender: TObject);
begin
    if(DateEditCame.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити початок періода!');
        DateEditCame.SetFocus;
        Exit;
    end;
    if(DateEditLeave.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити кінець періода!');
        DateEditLeave.SetFocus;
        Exit;
    end;
    if(id_sch = null)  then
    Begin
        ShowMessage('Необхідно вибрати рахунок!');
        ButtonEditSch.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmImportFilter.CancelBtnClick(Sender: TObject);
begin
   close;
end;

end.
