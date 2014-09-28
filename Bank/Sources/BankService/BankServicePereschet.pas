unit BankServicePereschet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxLabel, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, cxCheckBox, Un_lo_file_Alex,
  cxButtonEdit, Un_R_file_Alex;

type
  TfmBankServicePereschet = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    DateBeg: TcxDateEdit;
    ButtonPereschet: TcxButton;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DateEnd: TcxDateEdit;
    cxLabel2: TcxLabel;
    ButtonClose: TcxButton;
    cxLabel3: TcxLabel;
    ButtonEditSch: TcxButtonEdit;
    DataSetKOdSys: TpFIBDataSet;
    procedure ButtonPereschetClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonEditSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    id_user : int64;
    kod_sch,tytle_sch : string;
    id_sch  : int64;
  public
    id_sys  : variant;
    constructor Create(AOwner: TComponent; d : Tpfibdatabase); reintroduce;
  end;

function ShowBankServicePereschet(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
    exports ShowBankServicePereschet;

implementation

uses DateUtils, GlobalSpr;

{$R *.dfm}

function ShowBankServicePereschet(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
var
    T : TfmBankServicePereschet;
begin
    T := TfmBankServicePereschet.Create(Ao, d);
    T.id_user := id_use;
    T.ShowModal;
    T.Free;
end;

{ TfmBankService }

constructor TfmBankServicePereschet.Create(AOwner: TComponent; d : Tpfibdatabase);
begin
    inherited Create(AOwner);
    Database.Handle                := D.Handle;
    Database.DefaultTransaction    := Transaction;
    Transaction.DefaultDatabase    := Database;
    Transaction.StartTransaction;
    StoredProc.Database            := Database;
    StoredProc.Transaction         := Transaction;
    DateBeg.Date                   := date;
    DateEnd.Date                   := date;
    DataSetKOdSys.Database         := Database;
    DataSetKOdSys.Transaction      := Transaction;
    Caption                        := Un_R_file_Alex.BANK_FORM_PERESCHET;
    cxGroupBox1.Caption            := Un_R_file_Alex.BANK_PERESCHET_SALDO;
    cxLabel1.Caption               := Un_R_file_Alex.BANK_DO_PERESCHET;
    cxLabel2.Caption               := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel3.Caption               := Un_R_file_Alex.BANK_DAY_SHOW_SCH_BALL;
    ButtonPereschet.Caption        := Un_R_file_Alex.BANK_BEGIN_PERESCHET;
    ButtonClose.Caption            := Un_R_file_Alex.CLOSE_CONST[1];

    DataSetKOdSys.Close;
    DataSetKOdSys.Sqls.SelectSQL.Text := 'select * from PUB_SP_SYSTEM where kod_sys='+IntToStr(2)+'';
    DataSetKOdSys.Open;

    id_sys := DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant;
end;

procedure TfmBankServicePereschet.ButtonPereschetClick(Sender: TObject);
begin
   if ButtonEditSch.Text = '' then
    begin
        showmessage(Un_R_file_Alex.KASSA_NOT_SEL_SCH);
        ButtonEditSch.SetFocus;
        exit;
    end;
    if DateBeg.Text = '' then
    begin
        showmessage(Un_R_file_Alex.BANK_PERESCHET_DATE_BEG);
        DateBeg.SetFocus;
        exit;
    end;
    if DateEnd.Text = '' then
    begin
        showmessage(Un_R_file_Alex.BANK_PERESCHET_DATE_END);
        DateEnd.SetFocus;
        exit;
    end;
    Transaction.StartTransaction;
    try
        StoredProc.StoredProcName:='BANK_PERESCHET_SALDO_BAL_SCH';
        StoredProc.Prepare;
        StoredProc.ParamByName('DATE_BEG').AsDate    := Datebeg.Date;
        StoredProc.ParamByName('DATE_END').AsDate    := DateEnd.Date;
        StoredProc.ParamByName('ID_SCH').AsInt64   := id_sch;
        StoredProc.ExecProc;

        Transaction.Commit;
        showmessage(Un_R_file_Alex.BANK_PERESCHET_OK);
    except
        Transaction.Rollback;
        showmessage(Un_R_file_Alex.BANK_PERESCHET_NOT);
    end;
end;

procedure TfmBankServicePereschet.ButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmBankServicePereschet.ButtonEditSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := GlobalSpr.GetSch(self, Database.Handle, fsNormal, DateBeg.Date, 1, id_sys, -1);
    if VarArrayDimCount(Res)>0 then
    begin
        id_sch    := Res[0][0];
        kod_sch   := Res[0][3];
        tytle_sch := Res[0][1];
        ButtonEditSch.Text  := kod_sch+' "'+tytle_sch+'"';
    end;
end;

end.
