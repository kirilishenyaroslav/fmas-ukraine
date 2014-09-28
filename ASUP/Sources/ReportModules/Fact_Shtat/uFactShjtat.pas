unit uFactShjtat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  uLabeledFControl, uDateControl, StdCtrls, Buttons, uFControl,
  uFactShtatData;

type
  TfmFactShtat = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    New_Data: TqFDateControl;
    procedure OkButtonClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    Design: Boolean;
    DataModule: TdmFactShtatData;
  end;

var
  fmFactShtat: TfmFactShtat;

implementation

{$R *.dfm}

uses qFTools;

procedure TfmFactShtat.OkButtonClick(Sender: TObject);
begin
    DataModule.ReportDS.Close;
    DataModule.ReportDS.ParamByName('New_Date').AsDate := New_Data.Value;
    DataModule.ReportDS.Open;
    DataModule.Report.LoadFromFile('Reports\ASUP\NewFactShtat.fr3');
    if Design then DataModule.Report.DesignReport
    else DataModule.Report.ShowReport;
end;

procedure TfmFactShtat.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if ( ssCtrl in Shift ) and ( ssAlt in Shift ) and ( ssShift in Shift ) then
        Design := not Design;
end;

procedure TfmFactShtat.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
end;

procedure TfmFactShtat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self);
end;

end.
