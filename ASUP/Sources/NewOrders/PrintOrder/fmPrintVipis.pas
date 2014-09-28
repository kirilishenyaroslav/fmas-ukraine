unit fmPrintVipis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ActnList, DB, FIBDataSet,
  pFIBDataSet, CheckLst;

type
  TPrintVipisForm = class(TForm)
    Label1: TLabel;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ResultList: TCheckListBox;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Prepare;
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    ar : array[0..1000] of integer;
  end;

var
  PrintVipisForm: TPrintVipisForm;

implementation

uses fmPrintOrder;
{$R *.dfm}

procedure TPrintVipisForm.Prepare;
var
    i : Integer;
begin
    ResultList.Clear;
    PrintOrderForm.ReportSummary.First;

    i := 0;

    While not PrintOrderForm.ReportSummary.Eof
    do begin
        ResultList.Items.Add(VarToStr(PrintOrderForm.ReportSummary['COLUMN1']));
        ar[i] := PrintOrderForm.ReportSummary['ID_ORDER'];
        PrintOrderForm.ReportSummary.Next;
        i := i + 1;
    end;
end;

procedure TPrintVipisForm.OkActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TPrintVipisForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TPrintVipisForm.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

end.
