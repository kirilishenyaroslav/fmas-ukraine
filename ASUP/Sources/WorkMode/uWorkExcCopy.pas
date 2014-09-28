unit uWorkExcCopy;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, Buttons, DB, IBCustomDataSet, IBQuery;

type
    TfmCopyExc = class(TForm)
        Label6: TLabel;
        TargetWorkMode: TSpComboBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        SourceWorkMode: TSpComboBox;
        Label1: TLabel;
        WorkQuery: TIBQuery;
        procedure CancelButtonClick(Sender: TObject);
        procedure TargetWorkModeEnter(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmCopyExc: TfmCopyExc;

implementation

uses PersonalCommon, qFTools, SpCommon;

{$R *.dfm}

procedure TfmCopyExc.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmCopyExc.TargetWorkModeEnter(Sender: TObject);
begin
    OkButton.SetFocus;
end;

procedure TfmCopyExc.OkButtonClick(Sender: TObject);
begin
    if SourceWorkMode.ItemIndex < 0 then
    begin
        qFErrorDialog('Заповніть режим праці!');
        Exit;
    end;

    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery.Params.ParamValues['Source'] := SourceWorkMode.GetId;
    WorkQuery.Params.ParamValues['Target'] := TargetWorkMode.GetId;
    ExecQuery(WorkQuery);
end;

procedure TfmCopyExc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SourceWorkMode.SaveIntoRegistry;
end;

end.
