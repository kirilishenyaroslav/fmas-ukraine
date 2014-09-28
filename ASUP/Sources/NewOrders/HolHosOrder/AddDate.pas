unit AddDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uDateControl,
  uFormControl, DM;

type
  TAdd_Date = class(TForm)
    FormControl: TqFFormControl;
    qFDateControl1: TqFDateControl;
    Label1: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Mode:TFormMode;
    constructor Create(Mode: TFormMode; Where: Variant);
  end;

var
  Add_Date: TAdd_Date;

implementation

{$R *.dfm}

constructor TAdd_Date.Create(Mode: TFormMode; Where: Variant);
begin
  inherited Create(Application.MainForm);
	Self.Mode := Mode;
  FormControl.Prepare(Data.DB,mode,where,null);
  ShowModal;
end;


procedure TAdd_Date.OkButtonClick(Sender: TObject);
begin
  FormControl.Ok;
end;

procedure TAdd_Date.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
