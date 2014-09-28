unit uAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMemo, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCurrencyEdit, DB, FIBDataSet, pFIBDataSet, uReg, uReestr_DM,
  iBase;

type
  TfrmAdd = class(TForm)
    Note_memo: TcxMemo;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Date_Edit: TcxDateEdit;
    cxLabel3: TcxLabel;
    Num_Edit: TcxCurrencyEdit;
    DataSet_max: TpFIBDataSet;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DM : TfrmReestr_DM;
  public
    constructor create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;

var
  frmAdd: TfrmAdd;

implementation

{$R *.dfm}

constructor TfrmAdd.create(aOwner: TComponent; aHandle: TISC_DB_HANDLE);
begin
  inherited create(aOwner);

  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Tran_Read.StartTransaction;
end;

procedure TfrmAdd.cxButton_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAdd.cxButton_okClick(Sender: TObject);
Var
  i:integer;
begin
  If Num_Edit.Text='' then
   Begin
    showmessage('Не заполнено поле с номером!');
    Num_Edit.SetFocus;
    Exit;
   End;

  If Date_Edit.Text='' then
   Begin
    showmessage('Не поставлена дата!');
    Date_Edit.SetFocus;
    Exit;
   End;
   for i:=1 to 5-length(num_Edit.text) do
    num_Edit.text:='0'+num_Edit.text;
  ModalResult:=mrOk;
end;

procedure TfrmAdd.FormCreate(Sender: TObject);
begin
  Date_Edit.EditValue:=Date;
end;

procedure TfrmAdd.FormShow(Sender: TObject);
begin
  DataSet_max.Close;
  DataSet_max.SQLs.SelectSQL.Text:='Select max(NUM_REESTR) AS NUM From CN_DT_DOG_REESTR';
  DataSet_max.Open;
  if DataSet_max['NUM'] <> null
   then Num_Edit.Text:=DataSet_max['NUM']
   Else Num_Edit.Text:='0';
  Num_Edit.Text:=IntToStr(StrToInt(Num_Edit.Text)+1);
end;

procedure TfrmAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Free;
end;

end.
