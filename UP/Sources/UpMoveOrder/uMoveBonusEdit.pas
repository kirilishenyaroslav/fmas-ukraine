unit uMoveBonusEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl,
    uFloatControl, uDateControl, uSpravControl, uBoolControl, uFormControl,
    uInvisControl, IBase, uMove, ActnList, DB, FIBDataSet, pFIBDataSet,
    ExtCtrls, uLogicCheck, uSimpleCheck, cxLabel, cxControls, cxContainer,
    cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, uIntControl;

type
    TfmMoveBonusEdit = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        IdRaise: TqFSpravControl;
        Percent: TqFFloatControl;
        Label1: TLabel;
        Summa: TqFFloatControl;
        Smeta: TqFSpravControl;
        Kod_Sm_Pps: TqFSpravControl;
        All_Periods: TqFBoolControl;
        ActionList1: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
        RaiseDefaults: TpFIBDataSet;
        Smets: TpFIBDataSet;
        SmetsID_SMET: TFIBBCDField;
        SmetsID_SMET_PPS: TFIBBCDField;
        SmetsSMETA_NAME: TFIBStringField;
        SmetsRATE_COUNT: TFIBFloatField;
        SmetsOKLAD_BASE2: TFIBFloatField;
        SmetsKOEFF_PPS: TFIBFloatField;
        SmetsSMETA_PPS_NAME: TFIBStringField;
        SmetsOKLAD_PPS: TFIBFloatField;
        SmetsDATES_STR: TFIBStringField;
        SmetsDATE_BEG: TFIBDateField;
        SmetsDATE_END: TFIBDateField;
        SmetsID_ORDER_ITEM: TFIBBCDField;
        SmetsID_REC: TFIBBCDField;
        cxDateBeg: TcxDateEdit;
        cxDateEnd: TcxDateEdit;
        LblDateBeg: TcxLabel;
        LblDateEnd: TcxLabel;
        NumBon: TqFIntControl;
        PubSprRaise: TpFIBDataSet;
        procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SummaChange(Sender: TObject);
        procedure PercentChange(Sender: TObject);
        procedure IdRaiseChange(Sender: TObject);
        procedure All_PeriodsChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
        procedure NumBonChange(Sender: TObject);
    private
        { Private declarations }
    public
        mode: integer; //1 = add
        id_session: int64;
    end;

var
    fmMoveBonusEdit: TfmMoveBonusEdit;

implementation

{$R *.dfm}

uses uCommonSp, GlobalSPR, qfTools, uMoveAdd, BaseTypes;

procedure TfmMoveBonusEdit.IdRaiseOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
    CalcType: TpFibDataSet;
begin
    // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(RaiseDefaults.Database.Handle);
            // модальный показ
            FieldValues['ShowStyle'] := 0;
            // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 2;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            CalcType := TpFibDataSet.Create(nil);
            CalcType.Database := TfrmMoveOrder(owner.owner).Database;
            CalcType.Transaction := TfrmMoveOrder(owner.owner).ReadTransaction;
            CalcType.SelectSQL.Text := 'select * ' +
                'from  sp_raise_movsel(' + IntToStr(sp.Output['Id_Raise']) + ')';

            CalcType.Open;
            CalcType.FetchAll;
            CalcType.First;

            if CalcType.RecordCount > 0 then
            begin
                Value := sp.Output['Id_Raise'];
                DisplayText := sp.Output['Name'];
            end
            else
            begin
                Value := Null;
                DisplayText := '';
                agMessageDlg('Увага!', 'Цю надбавку не можна додавати при переводі/подовженні! Спробуйте ще раз!', mtInformation, [mbOk]);
            end
        end;
        sp.Free;
    end;
end;

procedure TfmMoveBonusEdit.SmetaOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, TISC_DB_Handle(TfrmMoveOrder(owner.owner).Database.Handle), Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmMoveBonusEdit.SummaChange(Sender: TObject);
begin
    if not VarIsNull(Summa.Value) and (Summa.Value > 0) then
    begin
        Percent.Required := False;
        Percent.Clear;
    end
    else
        Percent.Required := True;
end;

procedure TfmMoveBonusEdit.PercentChange(Sender: TObject);
begin
    if not VarIsNull(Percent.Value) and (Percent.Value > 0) then
    begin
        Summa.Required := False;
        Summa.Clear;
    end
    else
        Summa.Required := True;
end;

procedure TfmMoveBonusEdit.IdRaiseChange(Sender: TObject);
var
    id_Calc_Type: Integer;
    OklSmeta, OklSmetaPps: string;
begin
    if not VarIsNull(IdRaise.Value) then
    begin
        RaiseDefaults.Close;
        RaiseDefaults.SelectSQL.Text := 'SELECT * FROM UP_ACCEPT_RAISE_DEFAULTS(:Key_Session, :Id_Raise)';
        RaiseDefaults.ParamByName('Key_Session').AsInteger := id_session;
        RaiseDefaults.ParamByName('Id_Raise').AsInteger := IdRaise.Value;
        RaiseDefaults.Open;

        if RaiseDefaults.IsEmpty then
            Id_Calc_Type := 2
        else {//Id_Calc_Type := RaiseDefaults['Id_Calc_Type'];} if ((RaiseDefaults['Id_Calc_Type'] = 1) or
            (RaiseDefaults['Id_Calc_Type'] = 3) or
            (RaiseDefaults['Id_Calc_Type'] = 6)) then
            Id_Calc_Type := 1
        else
            Id_Calc_Type := 2;

        // заполнить процент по умолчанию для случая добавления
        if Mode = 1 then
            if (not RaiseDefaults.IsEmpty) and (not VarISNUll(RaiseDefaults['Percent'])) then
                Percent.Value := RaiseDefaults['Percent'];

        if Id_Calc_Type = 2 then // жесткая надбавка - согласно сметам оклада
        begin
            // сами сметы нам здесь не нужны
            Smeta.Value := Null;
            Kod_Sm_Pps.Value := Null;
            // не требовать их
            Smeta.Required := False;
            Kod_Sm_Pps.Required := False;
            // блокировать ввод
            Smeta.Blocked := True;
            Kod_Sm_Pps.Blocked := True;

            // получить список смет оклада
            OklSmeta := '';
            OklSmetaPps := '';

            Smets.Close;
            Smets.SelectSQL.Text := 'select * from UP_DT_MAN_SMET_BUFF_SEL(:key_session)';
            Smets.Open;
            Smets.First;
            while not Smets.Eof do
            begin
                if not VarIsNull(Smets['Smeta_Name']) then
                    if Pos(Smets['Smeta_Name'], OklSmeta) = 0 then
                        OklSmeta := OklSmeta + Smets['Smeta_Name'] + ', ';
                if not VarIsNull(Smets['Smeta_Pps_Name']) then
                    if Pos(Smets['Smeta_Pps_Name'], OklSmetaPps) = 0 then
                        OklSmetaPps := OklSmetaPps + Smets['Smeta_Pps_Name'] + ', ';
                Smets.Next;
            end;
            Smeta.DisplayText := 'Згідно фінансування окладу: ' + OklSmeta;
            Kod_Sm_Pps.DisplayText := 'Згідно фінансування окладу: ' + OklSmetaPps;
        end
        else
        begin // гибкая надбавка - сметы вводятся
            // разблокировать сметы
            Smeta.Blocked := False;
            Kod_Sm_Pps.Blocked := False;
            // требовать ввод основной сметы
            Smeta.Required := True;
            // загрузить из реестра - только для случая добавления записи
            if Mode = 1 then
            begin
                IdRaise.AutoSaveToRegistry := False;
                qFAutoLoadFromRegistry(Self);
                IdRaise.AutoSaveToRegistry := True;
            end;
        end
            { if (Id_Calc_Type = 1) or (Id_Calc_Type = 4) then
             begin
               IdRaise.Value := Null;
               IdRaise.DisplayText := '';
               exit;
             end;

             if Id_Calc_Type = 2 then // жесткая надбавка - согласно сметам оклада
             begin
                     // сами сметы нам здесь не нужны
                 Smeta.Value := Null;
                 Kod_Sm_Pps.Value := Null;
                     // не требовать их
                 Smeta.Required := False;
                 Kod_Sm_Pps.Required := False;
                     // блокировать ввод
                 Smeta.Blocked := True;
                 Kod_Sm_Pps.Blocked := True;

                     // получить список смет оклада
                 OklSmeta := '';
                 OklSmetaPps := '';

                 Smets.Open;
                 Smets.First;
                 while not Smets.Eof do
                 begin
                     if not VarIsNull(Smets['Smeta_Name']) then
                         if Pos(Smets['Smeta_Name'], OklSmeta) = 0 then
                             OklSmeta := OklSmeta + Smets['Smeta_Name'] + ', ';
                     if not VarIsNull(Smets['Smeta_Pps_Name']) then
                         if Pos(Smets['Smeta_Pps_Name'], OklSmetaPps) = 0 then
                             OklSmetaPps := OklSmetaPps + Smets['Smeta_Pps_Name'] + ', ';
                     Smets.Next;
                 end;
                 Smeta.DisplayText := 'Згідно фінансування окладу: ' + OklSmeta;
                 Kod_Sm_Pps.DisplayText := 'Згідно фінансування окладу: ' + OklSmetaPps;
             end
             else
             begin // гибкая надбавка - сметы вводятся
                 // разблокировать сметы
                 Smeta.Blocked := False;
                 Kod_Sm_Pps.Blocked := False;
                 // требовать ввод основной сметы
                 Smeta.Required := True;
                 // загрузить из реестра - только для случая добавления записи
                 if Mode = 1 then
                 begin
                     IdRaise.AutoSaveToRegistry := False;
                     qFAutoLoadFromRegistry(Self);
                     IdRaise.AutoSaveToRegistry := True;
                 end;
             end }
    end;
end;

procedure TfmMoveBonusEdit.All_PeriodsChange(Sender: TObject);
begin
    if All_Periods.Value then
    begin
        cxDateBeg.Visible := False;
        cxDateEnd.Visible := False;
        LblDateBeg.Visible := False;
        LblDateEnd.Visible := False;
        //DateBeg.Required := False;
        //DateEnd.Required := False;
    end
    else
    begin
        cxDateBeg.Visible := True;
        cxDateEnd.Visible := True;
        LblDateBeg.Visible := True;
        LblDateEnd.Visible := True;
        //DateBeg.Required := True;
        //DateEnd.Required := True;
    end;
end;

procedure TfmMoveBonusEdit.FormCreate(Sender: TObject);
begin
    cxDateBeg.Visible := False;
    cxDateEnd.Visible := False;
    LblDateBeg.Visible := False;
    LblDateEnd.Visible := False;
    cxDateBeg.Date := TfrmAddMoving(Owner).check_date_beg; //cxDateBegEdit.Date;
    cxDateEnd.Date := TfrmAddMoving(Owner).check_date_end; //cxDateEndEdit.Date;
end;

procedure TfmMoveBonusEdit.AcceptActionExecute(Sender: TObject);
var
    BonCheck: TpFibDataSet;
begin
    if not qFCheckAll(Self) then
        exit;

    if not All_Periods.Value then
    begin
        // проверка на заполнение даты
        if Trim(cxDateBeg.Text) = '' then
        begin
            agMessageDlg('Увага!', 'Введіть дату початку періоду дії надбавки!', mtError, [mbOk]);
            cxDateBeg.SetFocus;
            cxDateBeg.Style.Color := clRed;
            Exit;
        end;

        // проверка на заполнение даты
        if Trim(cxDateEnd.Text) = '' then
        begin
            agMessageDlg('Увага!', 'Введіть дату кінця періоду дії надбавки!', mtError, [mbOk]);
            cxDateEnd.SetFocus;
            cxDateEnd.Style.Color := clRed;
            Exit;
        end;

        // проверка на корректность даты
        if cxDateBeg.Date > cxDateEnd.Date then
        begin
            agMessageDlg('Увага!', 'Дата кінця періоду дії надбавки повинна бути більше дати початку!', mtError, [mbOk]);
            cxDateBeg.SetFocus;
            cxDateBeg.Style.Color := clRed;
            cxDateEnd.Style.Color := clRed;
            Exit;
        end;

        if not (((cxDateBeg.Date >= TfrmAddMoving(Owner).check_date_beg)
            and (cxDateBeg.Date <= TfrmAddMoving(Owner).check_date_end))
            and ((cxDateEnd.Date >= TfrmAddMoving(Owner).check_date_beg)
            and (cxDateEnd.Date <= TfrmAddMoving(Owner).check_date_end)))

        {(((cxDateBeg.Date >= TfrmAddMoving(Owner).cxDateBegEdit.Date)
            and (cxDateBeg.Date <= TfrmAddMoving(Owner).cxDateEndEdit.Date))
            and ((cxDateEnd.Date >= TfrmAddMoving(Owner).cxDateBegEdit.Date)
            and (cxDateEnd.Date <= TfrmAddMoving(Owner).cxDateEndEdit.Date))) }then
        begin
            if (((cxDateBeg.Date >= TfrmAddMoving(Owner).cxDateBegEdit.Date)
                and (cxDateBeg.Date <= TfrmAddMoving(Owner).cxDateEndEdit.Date))
                and ((cxDateEnd.Date >= TfrmAddMoving(Owner).cxDateBegEdit.Date)
                and (cxDateEnd.Date <= TfrmAddMoving(Owner).cxDateEndEdit.Date))) then
            begin
                agMessageDlg('Увага!', 'Щоб додати цю надбавку з заданими датами треба спочатку зберегти інформацію по фінансуванню!', mtError, [mbOk]);
                Exit;
            end
            else
            begin
                agMessageDlg('Увага!', 'Період надбавки виходить за межі періоду роботи!', mtError, [mbOk]);
                cxDateBeg.SetFocus;
                cxDateBeg.Style.Color := clRed;
                cxDateEnd.Style.Color := clRed;
                Exit;
            end
        end;
    end;

    ModalResult := mrOk;
end;

procedure TfmMoveBonusEdit.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMoveBonusEdit.FormControlModifyRecordAfterPrepare(
    Sender: TObject);
begin
    IdRaise.Value := IdRaise.Value;
end;

procedure TfmMoveBonusEdit.NumBonChange(Sender: TObject);
var
    CalcTypeBon: TpFibDataSet;
begin
    if VarIsNull(NumBon.Value) then
        exit;

    try
        PubSprRaise.Close;
        PubSprRaise.SQLs.SelectSQL.Text := 'select * from sp_raise where Current_Date Between Use_Date_Beg And Use_Date_End and display_order=:display_order';
        PubSprRaise.Database := TfrmAddMoving(Owner).Database;
        PubSprRaise.Transaction := TfrmAddMoving(Owner).ReadTransaction;
        PubSprRaise.ParamByName('display_order').AsInteger := StrToInt(NumBon.Value);
        PubSprRaise.Open;
        PubSprRaise.FetchAll;

        if PubSprRaise.RecordCount = 1 then
        begin
            IdRaise.Value := PubSprRaise['ID_RAISE'];
            IdRaise.DisplayText := PubSprRaise['FULL_NAME'];
            PubSprRaise.Close;

            CalcTypeBon := TpFibDataSet.Create(nil);
            CalcTypeBon.Database := TfrmAddMoving(Owner).Database;
            CalcTypeBon.Transaction := TfrmAddMoving(Owner).ReadTransaction;
            CalcTypeBon.SelectSQL.Text := 'select * ' +
                'from  sp_raise_movsel(' + IntToStr(IdRaise.Value) + ')';

            CalcTypeBon.Open;
            CalcTypeBon.FetchAll;
            CalcTypeBon.First;

            if CalcTypeBon.RecordCount <= 0 then
            begin
                IdRaise.Value := Null;
                IdRaise.DisplayText := 'Цю надбавку не можна додавати при переводі/подовженні!';
            end
        end
        else
        begin
            IdRaise.Value := Null;
            IdRaise.DisplayText := 'надбавку не знайдено!';
        end;

    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

initialization
    RegisterClass(TfmMoveBonusEdit);

end.
