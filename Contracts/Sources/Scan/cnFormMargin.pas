unit cnFormMargin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, umcmIntE, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxGroupBox, cxButtons;

type
  TFormPageMargin = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbForceMargin: TCheckBox;
    rsLeft: TcxSpinEdit;
    rsTop: TcxSpinEdit;
    rsRight: TcxSpinEdit;
    rsBottom: TcxSpinEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    function    GetForceMargin : boolean;
    function    GetMarginBottom : double;
    function    GetMarginLeft : double;
    function    GetMarginRight : double;
    function    GetMarginTop : double;
    procedure   SetForceMargin(Value : boolean);
    procedure   SetMarginBottom(Value : double);
    procedure   SetMarginLeft(Value : double);
    procedure   SetMarginRight(Value : double);
    procedure   SetMarginTop(Value : double);
  public
    { Public declarations }
    property    ForceMargin : boolean
      read      GetForceMargin
      write     SetForceMargin;
    property    MarginBottom : double
      read      GetMarginBottom
      write     SetMarginBottom;
    property    MarginLeft : double
      read      GetMarginLeft
      write     SetMarginLeft;
    property    MarginRight : double
      read      GetMarginRight
      write     SetMarginRight;
    property    MarginTop : double
      read      GetMarginTop
      write     SetMarginTop;
  end;

var
  FormPageMargin: TFormPageMargin;

implementation

{$R *.dfm}

function TFormPageMargin.GetForceMargin : boolean;
begin
  Result := cbForceMargin.Checked;
end; // TFormPageMargin.GetForceMargin.


procedure TFormPageMargin.SetForceMargin(Value : boolean);
begin
  cbForceMargin.Checked := Value;
end; // TFormPageMargin.SetForceMargin.


function TFormPageMargin.GetMarginBottom : double;
begin
  Result := rsBottom.Value;
end; // TFormPageMargin.GetMarginBottom.


function TFormPageMargin.GetMarginLeft : double;
begin
  Result := rsLeft.Value;
end; // TFormPageMargin.GetMarginLeft.


function TFormPageMargin.GetMarginRight : double;
begin
  Result := rsRight.Value;
end; // TFormPageMargin.GetMarginRight.


function TFormPageMargin.GetMarginTop : double;
begin
  Result := rsTop.Value;
end; // TFormPageMargin.GetMarginTop.


procedure TFormPageMargin.SetMarginBottom(Value : double);
begin
  rsBottom.Value := Value;
end; // TFormPageMargin.SetMarginBottom.


procedure TFormPageMargin.SetMarginLeft(Value : double);
begin
  rsLeft.Value := Value;
end; // TFormPageMargin.SetMarginLeft.


procedure TFormPageMargin.SetMarginRight(Value : double);
begin
  rsRight.Value := Value;
end; // TFormPageMargin.SetMarginRight.


procedure TFormPageMargin.SetMarginTop(Value : double);
begin
  rsTop.Value := Value;
end; // TFormPageMargin.SetMarginTop.

procedure TFormPageMargin.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFormPageMargin.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
