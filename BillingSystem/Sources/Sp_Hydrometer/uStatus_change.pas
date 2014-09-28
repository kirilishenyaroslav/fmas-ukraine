unit uStatus_change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, uCommon_Messages,
  uCommon_Types, iBase, uCommon_Loader, cxDropDownEdit, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDataSet, uHydrometer_DM,
  pFIBDataSet;

type
  TfrmStatus_change = class(TForm)
    cxLabel1: TcxLabel;
    Button_OK: TcxButton;
    Button_cancel: TcxButton;
    lblDate: TcxLabel;
    DateSet: TcxDateEdit;
    StateBox: TcxLookupComboBox;
    StateSet: TpFIBDataSet;
    StateDS: TDataSource;
    procedure Button_cancelClick(Sender: TObject);
    procedure Button_OKClick(Sender: TObject);
    procedure StateBoxPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
  public
    id_status, id_user : Int64;
    aHandle : TISC_DB_HANDLE;
    Name_User : String;
    is_admin : Boolean;
    procedure StatusDSetCloseOpen;
  end;

var
  frmStatus_change: TfrmStatus_change;

implementation

{$R *.dfm}

procedure TfrmStatus_change.StatusDSetCloseOpen;
begin
   if StateSet.Active then StateSet.Close;
   StateSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_HYDROMETER_STATUS_FILTER(:FILTER_STR)';
   StateSet.ParamByName('FILTER_STR').AsString:='';
   StateSet.Open;
end;

procedure TfrmStatus_change.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmStatus_change.Button_OKClick(Sender: TObject);
begin
  if StateBox.EditText = '' then
  begin
    bsShowMessage(Application.Title, 'Необхідно обрати статус!', mtError, [mbOK]);
    Exit;
  end;


  if DateSet.Text='' then
  begin
    bsShowMessage(Application.Title, 'Необхідно обрати дату!', mtError, [mbOK]);
    Exit;
  end;
  ModalResult := mrOk; 
end;

procedure TfrmStatus_change.StateBoxPropertiesInitPopup(Sender: TObject);
begin
   StatusDSetCloseOpen;
end;

end.
