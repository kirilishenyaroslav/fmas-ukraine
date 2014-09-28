unit uNewOkladReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  uLabeledFControl, uDateControl, StdCtrls, Buttons, uFControl,
  uNewOkladData, IBase, ActnList, NagScreenUnit;

type
  TfmNewOkladPrint = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure OkButtonClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
  private
    DataModule: TNewOkladsData;
  public
    Design: Boolean;
    Id_Order: Int64;

    constructor Create(AOwner: TComponent; Data: TNewOKladsData); reintroduce;
  end;

var
  fmNewOkladPrint: TfmNewOkladPrint;

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64); stdcall;
exports GetExtReport;

implementation

{$R *.dfm}

uses qFTools;

procedure TfmNewOkladPrint.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані...');

    DataModule.ReportDS.Close;
    DataModule.ReportDS.ParamByName('Id_Order').AsInt64 := Id_Order;
    DataModule.ReportDS.Open;

    NagScreen.Free;
    DataModule.Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\ASUP\NewFactShtat.fr3', true);
    if Design then DataModule.Report.DesignReport
    else DataModule.Report.ShowReport;
end;

procedure TfmNewOkladPrint.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if ( ssCtrl in Shift ) and ( ssAlt in Shift ) and ( ssShift in Shift ) then
        Design := not Design;
end;

procedure TfmNewOkladPrint.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
end;

procedure TfmNewOkladPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self);
end;

constructor TfmNewOkladPrint.Create(AOwner: TComponent;
  Data: TNewOKladsData);
begin
    inherited Create(AOwner);

    DataModule := Data;
end;

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64);
var
    data: TNewOkladsData;
    form: TfmNewOkladPrint;
begin
    data := TNewOkladsData.Create(Application.MainForm);
    with data do
    begin
        if Database.Connected then
            Database.Connected:=False;
        Database.Handle := DBHandle;
        Database.Connected := True;
    end;

    form := TfmNewOkladPrint.Create(Application.MainForm, Data);
    form.Id_Order := Id_Order;
    form.Label2.Caption := IntToStr(Id_Order);
    form.ShowModal;
    form.Free;

    data.Free;
end;


procedure TfmNewOkladPrint.Action1Execute(Sender: TObject);
begin
    Design := True;
    Label2.Caption := Label2.Caption + '  DESIGN';
end;

end.
