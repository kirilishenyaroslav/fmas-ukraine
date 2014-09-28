unit ProtFSS_ReestrAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, IBase,ZMessages,Dates,Unit_sprSubs_Consts,
  cxControls, Unit_NumericConsts, PackageLoad,ZTypes,cxContainer, cxEdit, cxTextEdit,
  cxSpinEdit;

type
  TAddReestrParametr = record
   DateBeg:TDate;
   DateEnd:TDate;
   Kod_setup:Integer;
end;

type
  TfmAddForm = class(TForm)
    Label1: TLabel;
    cxNumReestr: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    cxDateBeg: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PParameter:TAddReestrParametr;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
    property Parameter:TAddReestrParametr read PParameter;
  end;

var
  fmAddForm: TfmAddForm;

implementation

{$R *.dfm}
constructor TfmAddForm.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PDb_Handle := ADB_Handle;
end;
procedure TfmAddForm.cxButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmAddForm.cxButton1Click(Sender: TObject);
begin
    if (cxNumReestr.Text='') then
    begin
      ZShowMessage(TFSprSubs_LabelTo_Caption,'Треба заповнити номер реєстра',mtWarning,[mbOK]);
      cxNumReestr.SetFocus;
      Exit;
    end;

    if (cxDateBeg.Text='') then
    begin
      ZShowMessage(TFSprSubs_LabelTo_Caption,'Треба заповнити дату реєстра',mtWarning,[mbOK]);
      cxDateBeg.SetFocus;
      Exit;
    end;

    if (cxDateEnd.Text='') then
    begin
      ZShowMessage(TFSprSubs_LabelTo_Caption,'Треба заповнити дату реєстра',mtWarning,[mbOK]);
      cxDateEnd.SetFocus;
      Exit;
    end;

    ModalResult          := mrOk;
end;

end.
