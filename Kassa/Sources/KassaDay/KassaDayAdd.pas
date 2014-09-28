unit KassaDayAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxLabel, KassaDayClass, KassaDayForm, Un_R_file_Alex, Un_func_file_Alex,
  ActnList;

type
  TfmAddDay = (Add_Day, Change_Day);

  TfmKassaDayAdd = class(TForm)
    cxLabel1: TcxLabel;
    cxDateEditday: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxTextEditSaldoBegin: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxTextEditSumDeb: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxTextEditSaldoEnd: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxTextEditsumKred: TcxTextEdit;
    cxCheckBoxBlokDebet: TcxCheckBox;
    cxCheckBoxBlokKredit: TcxCheckBox;
    cxCheckBoxdayBlokSaldo: TcxCheckBox;
    cxCheckBoxCloseDay: TcxCheckBox;
    Bevel1: TBevel;
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    Action2: TAction;
    Action1: TAction;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxTextEditSaldoBeginExit(Sender: TObject);
    procedure cxTextEditSaldoBeginKeyPress(Sender: TObject; var Key: Char);
    procedure ActionAddExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
  public
    myclass : TMainKassaDayClass;
    myform : TfmKassaDayForm;
    flag : TfmAddDay;
    constructor Create(AOwner: TComponent; mform : TfmKassaDayForm;  mclass: TMainKassaDayClass; m : TfmAddDay; saldo : string); reintroduce; overload;
  end;


implementation
uses Accmgmt;
{$R *.dfm}

procedure TfmKassaDayAdd.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaDayAdd.cxButtonAddClick(Sender: TObject);
var
    j : int64;
    bl_deb, bl_kred, bl_saldo_end, bl_day : smallint;
    pr, error : integer;
begin
{    if ((flag = AddTovar) or (flag = ChangeTovar)) AND ((cxTextEditName.Text = '') or (EditKod.Text = '') ) then
    begin
        ShowMessage(Un_R_file_Alex.AUTOKOD_ADD_VETKA_ERROR_MESS);
        exit;
    end;

    if ((flag = AddVetka) or (flag = ChangeVetka)) AND ((cxTextEditName.Text = '') or (EditKod.Text = '') or (cxTextEditShortName.Text = '')) then
    begin
        ShowMessage(Un_R_file_Alex.AUTOKOD_ADD_VETKA_ERROR_MESS);
        exit;
    end;
 }
    pr := 1;
    cxTextEditSaldoBegin.Text := AddNol(cxTextEditSaldoBegin.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
        exit;
    end;

    if (myform.cxCheckBoxWith.Checked) and (cxDateEditday.Date<myform.cxDateEditBegin.Date) then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_DAY_ERROR_DAY_BEG);
        exit;
    end;

    if (myform.cxCheckBoxTo.Checked) and (cxDateEditday.Date>myform.cxDateEditEnd.Date) then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_DAY_ERROR_DAY_BEG);
        exit;
    end;

    if (cxDateEditday.Date>Date) then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_DAY_ERROR_DAY_END);
        exit;
    end;


    if Flag = Add_Day then
    begin
        if cxCheckBoxdayBlokSaldo.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Saldo','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
        if cxCheckBoxBlokDebet.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_debet','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error) + ' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
        if cxCheckBoxBlokKredit.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_kredit','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+ ' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;

        if cxCheckBoxBlokDebet.Checked         then bl_deb := 1 else bl_deb := 0;
        if cxCheckBoxBlokKredit.Checked        then bl_kred := 1 else bl_kred := 0;
        if cxCheckBoxCloseDay.Checked          then bl_day := 1 else bl_day := 0;
        if cxCheckBoxdayBlokSaldo.Checked      then bl_saldo_end := 1 else bl_saldo_end := 0;

        j := myclass.AddDay(myform.id_kassa, cxDateEditday.Text, StrToFloat(cxTextEditSaldoBegin.Text), StrToFloat(cxTextEditSaldoBegin.Text), 0, 0, bl_deb, bl_kred, bl_day, bl_saldo_end);

        If j > 0 then
        begin
            myform.ActionRefreshExecute(Sender);
            myform.DataSetDay.Locate('ID_DT_DAY', j, []);
        end;
        close;
    end;
    if Flag = Change_Day then
    begin
        if (myform.DataSetDay['BLOK_DEB'] = 1) then
        begin
            if (not cxCheckBoxBlokDebet.Checked)  then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_debet','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        end else
        begin
            if (cxCheckBoxBlokDebet.Checked)  then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_debet','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        end;
        if myform.DataSetDay['BLOK_KREDIT'] = 1 then
        begin
            if not cxCheckBoxBlokKredit.Checked then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_kredit','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error) + ' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        end else
        begin
            if cxCheckBoxBlokKredit.Checked then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_kredit','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error) + ' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        end;
        if myform.DataSetDay['BLOK_SALDO_END'] = 1 then
        begin
            if not cxCheckBoxdayBlokSaldo.Checked then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Saldo','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+ ' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        END ELSE
        begin
            if cxCheckBoxdayBlokSaldo.Checked then
            begin
                error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Saldo','Block');
                if error <> 0 then
                begin
                    MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+ ' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                    exit;
                end;
            end;
        end;
        if cxCheckBoxBlokDebet.Checked         then bl_deb := 1 else bl_deb := 0;
        if cxCheckBoxBlokKredit.Checked        then bl_kred := 1 else bl_kred := 0;
        if cxCheckBoxCloseDay.Checked          then bl_day := 1 else bl_day := 0;
        if cxCheckBoxdayBlokSaldo.Checked      then bl_saldo_end := 1 else bl_saldo_end := 0;
        j := myform.DataSetDay['ID_DT_DAY'];
        myclass.ChangeDay(myform.id_kassa, myform.DataSetDay['ID_DT_DAY'], bl_deb, bl_kred, bl_day, bl_saldo_end);
        myform.ActionRefreshExecute(Sender);
        myform.DataSetDay.Locate('ID_DT_DAY', j, []);
        close;
    end;
end;

constructor TfmKassaDayAdd.Create(AOwner: TComponent; mform : TfmKassaDayForm;  mclass: TMainKassaDayClass; m : TfmAddDay; saldo : string);
begin
    inherited Create (AOwner);
    myclass := mclass;
    myform  := mform;
    flag    := m;
    caption          := Un_R_file_Alex.KASSA_DAY_ADD_CAPTION;
    cxLabel1.Caption := Un_R_file_Alex.KASSA_DAY_ADD_DAY;
    cxLabel2.Caption := Un_R_file_Alex.KASSA_DAY_SALDO_BEGIN;
    cxLabel3.Caption := Un_R_file_Alex.KASSA_DAY_SALDO_END;
    cxLabel4.Caption := Un_R_file_Alex.KASSA_DAY_SUM_DEBET;
    cxLabel5.Caption := Un_R_file_Alex.KASSA_DAY_SUM_KREDIT;
    cxCheckBoxBlokDebet.Properties.Caption    := Un_R_file_Alex.KASSA_DAY_BLOK_DEBET;
    cxCheckBoxBlokKredit.Properties.Caption   := Un_R_file_Alex.KASSA_DAY_BLOK_KREDIT;
    cxCheckBoxdayBlokSaldo.Properties.Caption := Un_R_file_Alex.KASSA_DAY_BLOK_SALDO;
    cxCheckBoxCloseDay.Properties.Caption     := Un_R_file_Alex.KASSA_DAY_CLOSE_DAY;
    cxButtonClose.Caption                     := Un_R_file_Alex.MY_BUTTON_CLOSE;
    if flag = Add_Day then
    begin
         cxButtonAdd.Caption := Un_R_file_Alex.MY_BUTTON_ADD;
         if saldo = '0,00' then
         begin
             cxTextEditSaldoBegin.Enabled := true;
             cxTextEditSaldoBegin.Text    := saldo;
             cxTextEditSaldoEnd.Text      := saldo;
         end
         else
         begin
             cxTextEditSaldoBegin.Text := saldo;
             cxTextEditSaldoEnd.Text   := saldo;
         end;
         cxDateEditday.Date := date;
    end;
    if flag = Change_Day then
    begin
         cxDateEditday.Date := myform.DataSetDay['DAY_KASSA'];
         cxButtonAdd.Caption := Un_R_file_Alex.MY_BUTTON_EDIT;
         cxTextEditSaldoBegin.Text := myform.DataSetDay['SALDO_BEGIN'];
         cxTextEditSaldoEnd.Text   := myform.DataSetDay['SALDO_END'];
         cxTextEditSumDeb.Text     := myform.DataSetDay['SUM_DEBET'];
         cxTextEditsumKred.Text    := myform.DataSetDay['SUM_KREDIT'];
         if myform.DataSetDay['BLOK_DEB'] = 1 then cxCheckBoxBlokDebet.Checked := true;
         if myform.DataSetDay['BLOK_KREDIT'] = 1 then cxCheckBoxBlokKredit.Checked := true;
//         if myform.DataSetDay[''] = 1 then cxCheckBoxCloseDay.Checked;
         if myform.DataSetDay['BLOK_SALDO_END'] = 1 then cxCheckBoxdayBlokSaldo.Checked := true;
    end;
end;

procedure TfmKassaDayAdd.cxTextEditSaldoBeginExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSaldoBegin.Text := AddNol(cxTextEditSaldoBegin.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
    if (cxTextEditSaldoBegin.Text <> '0,00') or (cxTextEditSaldoBegin.Text <> '0') then
        cxTextEditSaldoEnd.Text := cxTextEditSaldoBegin.Text;
end;

procedure TfmKassaDayAdd.cxTextEditSaldoBeginKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSaldoBegin.Text) - Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmKassaDayAdd.ActionAddExecute(Sender: TObject);
begin
    cxButtonAddClick(Sender);
end;

procedure TfmKassaDayAdd.Action1Execute(Sender: TObject);
var
    j : int64;
    bl_deb, bl_kred, bl_saldo_end, bl_day : smallint;
    pr, error : integer;
begin
    pr := 1;
    cxTextEditSaldoBegin.Text := AddNol(cxTextEditSaldoBegin.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
        exit;
    end;

    if (myform.cxCheckBoxWith.Checked) and (cxDateEditday.Date<myform.cxDateEditBegin.Date) then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_DAY_ERROR_DAY_BEG);
        exit;
    end;

    if (myform.cxCheckBoxTo.Checked) and (cxDateEditday.Date>myform.cxDateEditEnd.Date) then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_DAY_ERROR_DAY_BEG);
        exit;
    end;

    if Flag = Add_Day then
    begin
        if cxCheckBoxdayBlokSaldo.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Saldo','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
        if cxCheckBoxBlokDebet.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_debet','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error) + ' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
        if cxCheckBoxBlokKredit.Checked then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Oborot_kredit','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+ ' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;

        if cxCheckBoxBlokDebet.Checked         then bl_deb := 1 else bl_deb := 0;
        if cxCheckBoxBlokKredit.Checked        then bl_kred := 1 else bl_kred := 0;
        if cxCheckBoxCloseDay.Checked          then bl_day := 1 else bl_day := 0;
        if cxCheckBoxdayBlokSaldo.Checked      then bl_saldo_end := 1 else bl_saldo_end := 0;

        j := myclass.AddDay_ext(myform.id_kassa, cxDateEditday.Text, StrToFloat(cxTextEditSaldoBegin.Text), StrToFloat(cxTextEditSaldoBegin.Text), 0, 0, bl_deb, bl_kred, bl_day, bl_saldo_end);

        If j > 0 then
        begin
            myform.ActionRefreshExecute(Sender);
            myform.DataSetDay.Locate('ID_DT_DAY', j, []);
        end;
        close;
    end;end;

end.

