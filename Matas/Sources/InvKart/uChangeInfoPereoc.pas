{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uChangeInfoPereoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOperacii, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCurrencyEdit, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, ibase, uResources;

type
  TfmChPereocenka = class(TForm)
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    LabelNum_dog: TLabel;
    Labelpr: TLabel;
    Labeliz: TLabel;
    LabelSum: TLabel;
    cxTextEditNum: TcxTextEdit;
    cxCurrencyEditsum: TcxTextEdit;
    ActionList1: TActionList;
    ActionCurrensy: TAction;
    cxCurrencyEditiz: TcxTextEdit;
    cxCurrencyEditpr: TcxTextEdit;
    pFIBDatabaseCalc: TpFIBDatabase;
    pFIBTransactionWr: TpFIBTransaction;
    pFIBStoredProcCalc: TpFIBStoredProc;
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxCurrencyEditsumKeyPress(Sender: TObject; var Key: Char);
    procedure cxCurrencyEditsumExit(Sender: TObject);
    procedure ActionCurrensyExecute(Sender: TObject);
  private
        long_pole : string;
        prap_flag, d, dk, tip_operacii : integer;
        zpt, zpt1 : string;
        ID_SES,ID_KART,OKR_KL : integer;
  public
    ResultArray : Variant;
  end;
  function Znacheniya(AOwners:TComponent; ost_pr_s, ost_iz_s, summ_a, dog_n : Variant; ID_SES,ID_KART,OKR_KL : integer; basukag: TISC_DB_HANDLE; Tip_or : integer):Variant;
var
  fmChPereocenka: TfmChPereocenka;

implementation

uses ClassInvKart;

{$R *.dfm}

function Znacheniya(AOwners:TComponent; ost_pr_s, ost_iz_s, summ_a, dog_n : Variant; ID_SES,ID_KART,OKR_KL : integer; basukag: TISC_DB_HANDLE; Tip_or : integer):Variant;
var
 g : TfmChPereocenka;
 i: integer;
begin
    g                                := TfmChPereocenka.Create(AOwners);
    g.cxTextEditNum.Text             := dog_n;
    g.cxCurrencyEditpr.Text          := ost_pr_s;
    g.cxCurrencyEditiz.Text          := ost_iz_s;
    g.cxCurrencyEditsum.Text         := summ_a;
    g.ID_SES                         := ID_SES;
    g.ID_KART                        := ID_KART;
    g.OKR_KL                         := OKR_KL;
    g.tip_operacii                   := Tip_or;

    g.pFIBDatabaseCalc.Handle        := basukag;

    g.ActionCurrensyExecute(nil);

    g.LabelNum_dog.Caption           := MAT_INV_oper_num_doc;
    g.Labelpr.Caption                := MAT_INV_Ost_price;
    g.LabelSum.Caption               := MAT_INV_obj_sum;
    g.Labeliz.Caption                := MAT_INV_Ost_Iznos;
    g.cxButtonOk.Caption             := MAT_INV_Change;
    g.cxButtonCancel.Caption         := MAT_INV_Cansel;
    g.Caption                        := MAT_INV_system_name + MAT_INV_prov_caption_change;

    g.ShowModal;
    Znacheniya := g.ResultArray;
    g.Free;
end;

procedure TfmChPereocenka.cxButtonOkClick(Sender: TObject);
begin
    pFIBStoredProcCalc.Database:=pFIBDatabaseCalc;
    pFIBStoredProcCalc.Transaction:=pFIBTransactionWr;
    pFIBStoredProcCalc.Transaction.StartTransaction;
    pFIBStoredProcCalc.StoredProcName:='MAT_INV_DOOC_CALC';
    pFIBStoredProcCalc.Prepare;
    pFIBStoredProcCalc.ParamByName('SUMMA').AsString              := cxCurrencyEditsum.Text;
    pFIBStoredProcCalc.ParamByName('ID_SESSION').AsInt64          := ID_SES;
    pFIBStoredProcCalc.ParamByName('ID_KART').AsInt64             := ID_KART;
    pFIBStoredProcCalc.ParamByName('OKR_KLIENT').AsInt64          := OKR_KL;
    pFIBStoredProcCalc.ParamByName('TIP_OPER').AsInteger          := tip_operacii;
    try
        pFIBStoredProcCalc.ExecProc;
        cxCurrencyEditiz.Text := pFIBStoredProcCalc.FieldByName('OST_IZNOS_NEW').AsString;
        cxCurrencyEditpr.Text := pFIBStoredProcCalc.FieldByName('OST_PRICE_NEW').AsString;
    except on E:Exception do begin
        pFIBTransactionWr.Rollback;
        ShowMessage(E.Message);
    end end;
    pFIBTransactionWr.Commit;

    ResultArray := VarArrayCreate([0,3], varVariant);
    ResultArray[0] := cxCurrencyEditpr.Text;
    ResultArray[1] := cxCurrencyEditiz.Text;
    ResultArray[2] := cxCurrencyEditsum.Text;
    ResultArray[3] := cxTextEditNum.Text;
    close;
end;

procedure TfmChPereocenka.cxButtonCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfmChPereocenka.cxCurrencyEditsumKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxCurrencyEditsum.Text;
        long_pole:= IntToStr(cxCurrencyEditsum.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmChPereocenka.cxCurrencyEditsumExit(Sender: TObject);
begin

    //cxCurrencyEditsum.Enabled := false;

    //cxCurrencyEditiz.Text := CurrToStr(StrToCurr(cxCurrencyEditiz.Text) + (StrToCurr(cxCurrencyEditsum.Text) / 2));
    //cxCurrencyEditpr.Text := CurrToStr(StrToCurr(cxCurrencyEditpr.Text) + (StrToCurr(cxCurrencyEditsum.Text) / 2));

    ActionCurrensyExecute(nil);
end;

procedure TfmChPereocenka.ActionCurrensyExecute(Sender: TObject);
var
    i : integer;
begin
//**********************************************************************
        prap_flag := 0;
        d         := 0;

        zpt := cxCurrencyEditiz.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditiz.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxCurrencyEditiz.Clear;
                    cxCurrencyEditiz.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditiz.Clear;
                cxCurrencyEditiz.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditiz.Clear;
                cxCurrencyEditiz.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
//**********************************************************************
        prap_flag := 0;
        d         := 0;

        zpt := cxCurrencyEditpr.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditpr.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxCurrencyEditpr.Clear;
                    cxCurrencyEditpr.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditpr.Clear;
                cxCurrencyEditpr.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditpr.Clear;
                cxCurrencyEditpr.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;

        zpt := cxCurrencyEditsum.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditsum.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxCurrencyEditsum.Clear;
                    cxCurrencyEditsum.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditsum.Clear;
                cxCurrencyEditsum.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditsum.Clear;
                cxCurrencyEditsum.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

end.
