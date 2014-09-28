unit AddBankOstatok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BankOstMain, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxLabel, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmAddBankOstatok = class(TForm)
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    WTr: TpFIBTransaction;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxButtonEdit3: TcxButtonEdit;
    cxButtonEdit4: TcxButtonEdit;
    cxButtonEdit5: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    Add: TAction;
    Stored: TpFIBStoredProc;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddExecute(Sender: TObject);
    function AddOst : boolean;
    procedure DelOst;
  private
    myform : TfmBankOstMain;
    id_sch, id_smeta, {id_razd, id_state,} id_kekv : int64;
    work_date : TDate;
    reg : integer;
  public

    constructor Create(AOwner : TComponent; fm : TfmBankOstMain; r : smallint); reintroduce; overload;
  end;

implementation
uses GlobalSPR,
     Un_R_file_Alex;

{$R *.dfm}

{ TfmAddBankOstatok }

constructor TfmAddBankOstatok.Create(AOwner: TComponent; fm: TfmBankOstMain; r : smallint);
begin
    inherited Create(AOwner);

    reg                   := r;
    myform                := fm;
    if myform.cxComboBoxMonth.ItemIndex < 9
        then work_date := StrToDate('01.'+'0'+ IntToStr(myform.cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(myform.cxSpinEditYear.Value))
        else work_date := StrToDate('01.'+ IntToStr(myform.cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(myform.cxSpinEditYear.Value));

    DB                    := myform.DB;
    Tr.DefaultDatabase    := DB;
    DB.DefaultTransaction := Tr;

    DS.Database           := DB;
    DS.Transaction        := Tr;

    Tr.StartTransaction;

    if r = 2 then
    begin
        id_sch             := myform.DSMainID_SCH.AsInt64;
        cxButtonEdit1.Text := myform.DSMainSCH_NUMBER.AsString;
        cxTextEdit2.Text   := myform.DSMainSCH_TITLE.AsString;

        id_smeta           := myform.DSMainID_SMETA.AsInt64;
        cxButtonEdit2.Text := myform.DSMainSM_KOD.AsString;
        cxTextEdit3.Text   := myform.DSMainSM_TITLE.AsString;

{        id_razd           := myform.DSMainID_RASZEL.AsInt64;
        cxButtonEdit3.Text := myform.DSMainRAZ_KOD.AsString;
        cxTextEdit4.Text   := myform.DSMainRAZ_TITLE.AsString;

        id_state             := myform.DSMainID_STATE.AsInt64;
        cxButtonEdit4.Text := myform.DSMainST_KOD.AsString;
        cxTextEdit5.Text   := myform.DSMainST_TITLE.AsString;
 }
        id_kekv            := myform.DSMainID_KEKV.AsInt64;
        cxButtonEdit5.Text := myform.DSMainKEKV_KOD.AsString;
        cxTextEdit6.Text   := myform.DSMainKEKV_TITLE.AsString;

        cxTextEdit1.Text   := myform.DSMainSUMMA.AsString;

    end;

    cxLabel1.Caption       := Un_R_file_Alex.N_KASSA_SCH[1];
    cxLabel2.Caption       := Un_R_file_Alex.N_KASSA_SMETA[1];
    cxLabel3.Caption       := Un_R_file_Alex.N_KASSA_RAZD[1];
    cxLabel4.Caption       := Un_R_file_Alex.N_KASSA_STAT[1];
    cxLabel5.Caption       := Un_R_file_Alex.N_KASSA_KEKV[1];
    cxLabel6.Caption       := Un_R_file_Alex.N_KASSA_SUMMA[1];

    cxButton1.Caption      := Un_R_file_Alex.OK[1];
    cxButton2.Caption      := Un_R_file_Alex.BANK_MO_EXIT[1];

    Caption                := Un_R_file_Alex.BANK_OSTATOK_ADD_CAP[1];
end;

procedure TfmAddBankOstatok.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmAddBankOstatok.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
//    res := GlobalSPR.GetSch(self, Class_Database.Handle, fsNormal, mm.cxDateEdit2.Date, 1, 0, 0);
//if (mm.prih = 0) then
//    res := GlobalSPR.GetSchWithOperFilter(self, DB.Handle, fsNormal, work_date, 1, 0, id_sch, 1);
//else
//    res := GlobalSPR.GetSchWithOperFilter(self, DB.Handle, fsNormal, work_date, 1, 0, id_sch, 0);

    Res := GlobalSPR.GetSch(self, DB.Handle, fsNormal, work_date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch               := res[0][0];
            cxButtonEdit1.Text   := res[0][3];
            cxTextEdit2.Text     := res[0][1];
        end;
    end;
end;

procedure TfmAddBankOstatok.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : variant;
begin
    Res := GlobalSPR.GetSmets(Self, DB.Handle, work_date, psmSmet);
    if VarArrayDimCount(Res)>0 then
    begin
        if Res[0]<>NULL then
        begin
            id_smeta           := Res[0];
            cxButtonEdit2.Text := VarToStr(Res[3]);
            cxTextEdit3.Text   := VarToStr(Res[2]);
        end;
    end;

end;

procedure TfmAddBankOstatok.cxButtonEdit5PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : variant;
begin
    res := GlobalSPR.GetKEKVSpr(self, DB.Handle, fsNormal, work_date, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_kekv            := res[0][0];
            cxButtonEdit5.Text := res[0][2];
            cxTextEdit6.Text   := res[0][1];
        end;
    end;

end;

procedure TfmAddBankOstatok.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEdit1.Text)>0)
    then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEdit1.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEdit1.Text) - Pos(DecimalSeparator, cxTextEdit1.Text) > 1) and (Pos(DecimalSeparator, cxTextEdit1.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);

end;

procedure TfmAddBankOstatok.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
//var
//    rr : variant;
begin
{    rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, date, 0, allEnable, cmRazd);
    try
    begin
        id_razd := rr;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(Date)+''', '+IntToStr(2)+')';
        pFIBDataSet1.Open;
        cxButtonEdit4.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
 }
end;

procedure TfmAddBankOstatok.cxButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
{    rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, date, 0, allEnable, cmSt);
    try
    begin
        id_state := rr;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
        pFIBDataSet1.Open;
        cxButtonEdit5.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
}
end;

procedure TfmAddBankOstatok.AddExecute(Sender: TObject);
begin
    WTr.DefaultDatabase := DB;

    DS.Database         := DB;
    DS.Transaction      := WTr;

    Stored.Database     := DB;
    Stored.Transaction  := WTr;

    WTr.StartTransaction;
    try
        if reg=1 then
        begin
            if not AddOst then
            begin
                WTr.Rollback;
                Showmessage(Un_R_file_Alex.BANK_OSTATOK_ADD_EXIT[1]);
                Exit;
            end;
        end;
        if reg=2 then
        begin
            DelOst;
            if not AddOst then
            begin
                WTr.Rollback;
                Showmessage(Un_R_file_Alex.BANK_OSTATOK_ADD_EXIT[1]);
                Exit;
            end;
        end;

        WTr.Commit;
    except on E:Exception do begin
        WTr.Rollback;
        ShowMessage(E.Message);
        exit;
    end;
    end;
    myform.ARefreshExecute(nil);
    myform.DSMain.Last;
    close;
end;

function TfmAddBankOstatok.AddOst : boolean;
begin
    Ds.Close;
    DS.Sqls.SelectSQL.Text := 'select * from KASSA_DT_OST_SMETA_INSERT('''+DateToStr(work_date)+''', '+IntToStr(id_smeta)+', null, null, '+IntToStr(id_kekv)+', '+IntToStr(id_sch)+', ''' + StringReplace(cxTextEdit1.Text,',','.',[]) + ''', '+IntToStr(myform.id_users)+', '+IntToStr(2)+', '+IntToStr(1)+')';
    DS.Open;
    if DS.FBN('R_RESULT').AsInteger = 1
        then Result := true
        else Result := false;
end;

procedure TfmAddBankOstatok.DelOst;
begin
    Stored.StoredProcName := 'KASSA_DT_OST_SMETA_DELETE';
    Stored.Prepare;
    Stored.ParamByName('D_ID_SCH').AsInt64      := myform.DSMainID_SCH.AsInt64;
    Stored.ParamByName('D_ID_SMETA').AsInt64    := myform.DSMainID_SMETA.AsInt64;
//    Stored.ParamByName('D_ID_RAZD').AsInt64     := null;
//    Stored.ParamByName('D_ID_STATE').AsInt64    := null;
    Stored.ParamByName('D_ID_KEKV').AsInt64     := myform.DSMainID_KEKV.AsInt64;
    Stored.ParamByName('D_DATE_REG').AsDateTime := myform.DSMainDATE_REG.AsDateTime;
    Stored.ParamByName('D_SUMMA').AsExtended    := myform.DSMainSUMMA.AsExtended;
    Stored.ExecProc;
end;

end.
