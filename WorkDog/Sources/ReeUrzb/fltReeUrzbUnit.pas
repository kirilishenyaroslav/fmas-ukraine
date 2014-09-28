unit fltReeUrzbUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxCheckBox, cxCurrencyEdit, cxGroupBox;

type
  TfltReeUrzb = class(TForm)
    OkButton: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    DelButton: TcxButton;
    RollButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxCheckDateRee: TcxCheckBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxCheckSumRee: TcxCheckBox;
    cxCurrencyEditSumRee1: TcxCurrencyEdit;
    cxCurrencyEditSumRee2: TcxCurrencyEdit;
    cxCheckRegNum: TcxCheckBox;
    cxTextEditNumRee: TcxTextEdit;
    cxCheckNumDog: TcxCheckBox;
    cxTextEditNumDog: TcxTextEdit;
    cxCheckReeNumDog: TcxCheckBox;
    cxTextEditDogReeNum: TcxTextEdit;
    cxCheckDogSum: TcxCheckBox;
    cxTextCurrencyDogSum1: TcxCurrencyEdit;
    cxTextCurrencyDogSum2: TcxCurrencyEdit;
    act1: TAction;
    procedure fltExecute(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckSumReeClick(Sender: TObject);
    procedure cxCheckDateReeClick(Sender: TObject);
    procedure cxCheckRegNumClick(Sender: TObject);
    procedure cxCheckReeNumDogClick(Sender: TObject);
    procedure cxCheckNumDogClick(Sender: TObject);
    procedure cxCheckDogSumClick(Sender: TObject);
    procedure closeExecute(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RollButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fltReeUrzb: TfltReeUrzb;

implementation uses ReeUrzbUnit, DateUtils;

{$R *.dfm}

procedure TfltReeUrzb.fltExecute(Sender: TObject);
begin
  OkButtonClick(Self);
end;

procedure TfltReeUrzb.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfltReeUrzb.FormCreate(Sender: TObject);
begin
  //cxCheckDateRee.Checked := True;
  //cxDateEdit1.SetFocus;
  {cxCheckSumRee.Checked := False;
  cxCurrencyEditSumRee1.Enabled := cxCheckSumRee.Checked;
  cxCurrencyEditSumRee2.Enabled := cxCheckSumRee.Checked;
  cxCheckRegNum.Checked := False;
  cxTextEditNumRee.Enabled := cxCheckRegNum.Checked;

  cxCheckNumDog.Checked := False;
  cxTextEditNumDog.Enabled := cxCheckNumDog.Checked;
  cxCheckReeNumDog.Checked := False;
  cxTextEditDogReeNum.Enabled := cxCheckReeNumDog.Checked;
  cxCheckDogSum.Checked := False;
  cxTextCurrencyDogSum1.Enabled := cxCheckDogSum.Checked;
  cxTextCurrencyDogSum2.Enabled := cxCheckDogSum.Checked; }
end;

procedure TfltReeUrzb.cxCheckSumReeClick(Sender: TObject);
begin
  cxCurrencyEditSumRee1.Enabled := cxCheckSumRee.Checked;
  cxCurrencyEditSumRee2.Enabled := cxCheckSumRee.Checked;
  if Visible then if cxCurrencyEditSumRee1.Enabled then cxCurrencyEditSumRee1.SetFocus;
end;

procedure TfltReeUrzb.cxCheckDateReeClick(Sender: TObject);
begin
   cxDateEdit1.Enabled := cxCheckDateRee.Checked;
   cxDateEdit2.Enabled := cxCheckDateRee.Checked;
   if Visible then if cxDateEdit1.Enabled then cxDateEdit1.SetFocus;
end;

procedure TfltReeUrzb.cxCheckRegNumClick(Sender: TObject);
begin
  cxTextEditNumRee.Enabled := cxCheckRegNum.Checked;
  if Visible then if cxTextEditNumRee.Enabled then cxTextEditNumRee.SetFocus;
end;

procedure TfltReeUrzb.cxCheckReeNumDogClick(Sender: TObject);
begin
  cxTextEditDogReeNum.Enabled := cxCheckReeNumDog.Checked;
  if Visible then if cxTextEditDogReeNum.Enabled then cxTextEditDogReeNum.SetFocus;
end;

procedure TfltReeUrzb.cxCheckNumDogClick(Sender: TObject);
begin
  cxTextEditNumDog.Enabled := cxCheckNumDog.Checked;
  if Visible then if cxTextEditNumDog.Enabled then cxTextEditNumDog.SetFocus;
end;

procedure TfltReeUrzb.cxCheckDogSumClick(Sender: TObject);
begin
   cxTextCurrencyDogSum1.Enabled := cxCheckDogSum.Checked;
   cxTextCurrencyDogSum2.Enabled := cxCheckDogSum.Checked;
   if Visible then if cxTextCurrencyDogSum1.Enabled then cxTextCurrencyDogSum1.SetFocus;
end;

procedure TfltReeUrzb.closeExecute(Sender: TObject);
begin
  DelButtonClick(Self);
end;

procedure TfltReeUrzb.DelButtonClick(Sender: TObject);
begin
  cxCheckSumRee.Checked := False;
  cxCheckRegNum.Checked := False;
  cxCheckNumDog.Checked := False;
  cxCheckReeNumDog.Checked := False;
  cxCheckDogSum.Checked := False;
  ModalResult := mrOk;
end;

procedure TfltReeUrzb.RollButtonClick(Sender: TObject);
begin
  Close;
end;

end.
