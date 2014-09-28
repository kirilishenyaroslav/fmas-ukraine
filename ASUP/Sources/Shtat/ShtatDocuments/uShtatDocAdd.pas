unit uShtatDocAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uFControl, uLabeledFControl, uCharControl,
  ExtCtrls, StdCtrls, Buttons, uFormControl, uLogicCheck, uSimpleCheck,
  ActnList, uBoolControl, FIBDatabase, pFIBDatabase;

type
  TfmShtatDocAdd = class(TForm)
    Panel: TPanel;
    qFCharControl1: TqFCharControl;
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FormControl: TqFFormControl;
    qFSimpleCheck1: TqFSimpleCheck;
    ActionList1: TActionList;
    AcceptAction: TAction;
    Use_Default_Smeta: TqFBoolControl;
    QuitAction: TAction;
    Set_Date_End: TqFBoolControl;
    procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
      Mode: TFormMode);
    procedure AcceptActionExecute(Sender: TObject);
    procedure QuitActionExecute(Sender: TObject);
    procedure FormControlDatabaseEventBefore(Sender: TObject; Form: TForm;
      Mode: TFormMode; Transaction: TFIBTransaction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShtatDocAdd: TfmShtatDocAdd;

implementation

uses DateUtils, UpKernelUnit;

{$R *.dfm}

procedure TfmShtatDocAdd.FormControlAfterPrepare(Sender: TObject;
  Form: TForm; Mode: TFormMode);
var
    y: Integer;
begin
    if Mode = fmAdd then
    begin
        y := YearOf(Date);

        Date_Beg.Value := EncodeDate(y+1, 1, 1);
        Date_End.Value := EncodeDate(y+2, 1, 1)-1;
    end;


    if ( Mode = fmAdd ) or ( Mode = fmInfo ) then Set_Date_End.Visible := False;
end;

procedure TfmShtatDocAdd.AcceptActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmShtatDocAdd.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatDocAdd.FormControlDatabaseEventBefore(Sender: TObject;
  Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

initialization
    RegisterClass(TfmShtatDocAdd);

end.
