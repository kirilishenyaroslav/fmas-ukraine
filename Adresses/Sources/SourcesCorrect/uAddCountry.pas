unit uAddCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, FIBDatabase, pFIBDatabase, IBase,
  DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, Address_ZMessages,
  AdrSp_Types;

type
  TAdd_Country_Form = class(TAdrEditForm)
    NameTE: TcxTextEdit;
    NameLbl: TcxLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    procedure AcceptActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    pIdCountry:Integer;
  public
//    Mode:TFormMode;
//    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);reintroduce;
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdCountry:Integer=-1);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TAdd_Country_Form.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AIdCountry:Integer=-1);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  StartId:=AIdCountry;
end;



procedure TAdd_Country_Form.AcceptActionExecute(Sender: TObject);
begin
  if NameTE.Text='' then
   begin
    ZShowMessage('Помилка','Вкажіть назву країни',mtError,[mbOK]);
    NameTE.SetFocus;
    Exit;
   end;
  try
    StProc.StoredProcName:='ADR_COUNTRY_IU';
    WriteTransaction.StartTransaction;
    StProc.Prepare;
    if pIdCountry>-1 then
      StProc.ParamByName('ID_C').AsInteger:=pIdCountry;
    StProc.ParamByName('NAME_COUNTRY').AsString:=NameTE.Text;
    StProc.ExecProc;
    ResultId:=StProc.FN('ID_COUNTRY').AsInteger;
    WriteTransaction.Commit;
    ModalResult:=mrOk;
  except
    on E:Exception do
      begin
        WriteTransaction.Rollback;
        ZShowMessage('Помилка',E.Message,mtError,[mbOk]);
      end;
  end;
end;

procedure TAdd_Country_Form.CancelActionExecute(Sender: TObject);
begin
// Ничего не меняли, а, следовательно, обновлять ничего не надо
  ResultId:=-1;
  ModalResult:=mrCancel;
end;

procedure TAdd_Country_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TAdd_Country_Form.FormShow(Sender: TObject);
begin
  ReadTransaction.Active:=True;
  pIdCountry:=StartId;
  if pIdCountry>-1 then
    begin
      // изменение
      Caption:='Змінити країну';
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM ADR_COUNTRY_S('+IntToStr(pIdCountry)+')';
      DSet.Open;
      NameTE.Text:=DSet['NAME_COUNTRY'];
    end
  else
    Caption:='Додати країну';
end;

initialization
    RegisterClass(TAdd_Country_Form);

end.
