unit BsEditCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, ActnList, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls, cxButtons, AdrEdit,
  BaseTypes, BsAdrConsts;

type
  TfrmEditCountry = class(TEditForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    EditDB: TpFIBDatabase;
    eTrRead: TpFIBTransaction;
    eTrWrite: TpFIBTransaction;
    eStoredProc: TpFIBStoredProc;
    EDSet: TpFIBDataSet;
    ActionList1: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    CountryEdit: TcxTextEdit;
    lblCountry: TcxLabel;
    procedure ActCancelExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditCountry: TfrmEditCountry;

implementation

{$R *.dfm}

procedure TfrmEditCountry.ActCancelExecute(Sender: TObject);
begin
   CloseConnect;
   ModalResult:=mrCancel;
end;

procedure TfrmEditCountry.ActOkExecute(Sender: TObject);
begin
   eStoredProc.StoredProcName:='ADR_COUNTRY_IU';
   eStoredProc.Transaction.StartTransaction;
   eStoredProc.Prepare;
   if not VarIsNull(KeyField) then
          eStoredProc.ParamByName('NAME_COUNTRY').AsString:=KeyField;
   eStoredProc.ParamByName('NAME_COUNTRY').AsString:=CountryEdit.Text;
   try
     eStoredProc.ExecProc;
     ReturnId:=eStoredProc.FldByName['ID_COUNTRY'].AsInteger;
     eStoredProc.Transaction.Commit;
     ModalResult:=mrOk;
   except on E:Exception
          do begin
               agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
               eStoredProc.Transaction.Rollback;
               ModalResult:=mrCancel;
          end;
   end;
end;

procedure TfrmEditCountry.FormShow(Sender: TObject);
begin
  try
     if Not VarIsNull(KeyField) then
     begin
        EDSet.Close;
        EDSet.SQLs.SelectSQL.Text:=frmCountrySqlText+'('+IntToStr(KeyField)+')';
        EDSet.Open;
        CountryEdit.Text:=EDSet['NAME_COUNTRY'];
        Self.Caption:='Змінити країну'
     end
     else Self.Caption:='Додати країну';
  except on E:Exception
         do agMessageDlg(WarningText, E.Message, mtInformation, [mbOK]);
  end;
end;

initialization
     RegisterClass(TfrmEditCountry);

end.
