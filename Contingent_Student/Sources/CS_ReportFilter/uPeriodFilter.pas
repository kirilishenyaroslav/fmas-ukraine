unit uPeriodFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, ComCtrls, ibase;

type
  TfmPeriodFilter = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonEnter: TcxButton;
    cxButtonCancel: TcxButton;
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxDateEditbegin: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDateEditEnd: TcxDateEdit;
    procedure cxButtonEnterClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
   public
  DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;



implementation

uses DM_ReportFilter;

{$R *.dfm}

constructor TfmPeriodFilter.Create(AOwner:TComponent);
begin

  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmPeriodFilter.cxButtonEnterClick(Sender: TObject);
begin
    if  (cxDateEditbegin.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити дату!');
      cxDateEditbegin.SetFocus;
      Exit;
    end;
    if  (cxDateEditEnd.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити дату!');
      cxDateEditEnd.SetFocus;
      Exit;
    end;

    ModalResult := mrok;
end;

procedure TfmPeriodFilter.cxButtonCancelClick(Sender: TObject);
begin
    close;
end;

end.
