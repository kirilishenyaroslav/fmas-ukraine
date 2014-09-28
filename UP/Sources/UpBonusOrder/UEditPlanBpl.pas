unit UEditPlanBpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmEditPlanBpl = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    DateStart: TcxDateEdit;
    BplName: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmEditPlanBpl.OkButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditPlanBpl.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditPlanBpl.FormCreate(Sender: TObject);
begin
      DateStart.Date:=Date;
end;

end.
