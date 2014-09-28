unit uBonusEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl,
    uFloatControl, uDateControl, uSpravControl, uBoolControl, uFormControl,
    uInvisControl, IBase, Up_DMAcception, ActnList, uIntControl, DB,
    FIBDataSet, pFIBDataSet, BaseTypes, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

const
   WarningCaption='Увага!';

type
    TfmBonusEdit = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Percent: TqFFloatControl;
        IdRaise: TqFSpravControl;
        All_Periods: TqFBoolControl;
        Smeta: TqFSpravControl;
        Kod_Sm_Pps: TqFSpravControl;
        Summa: TqFFloatControl;
        Label1: TLabel;
        ActionList1: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
    NumBonus: TqFIntControl;
    PubSprR: TpFIBDataSet;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    lblDateBeg: TcxLabel;
    lblDateEnd: TcxLabel;
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
    procedure NumBonusChange(Sender: TObject);
    private
    { Private declarations }
       ActDate:TDate;
       KeySession:Int64;
       EditMode:Boolean;
       Id_Calc_Type: Integer;
       function CheckData:Boolean;
    public
        DM: TUPAcceptDM;
        constructor Create(AOwner:TComponent; DateFilter:TDate; SessionKey:Int64; IdRaiseIn:Variant; isEdit:boolean;
        Dmod:TUPAcceptDM);reintroduce;
    end;

var
    fmBonusEdit: TfmBonusEdit;

implementation

{$R *.dfm}

uses uCommonSp, GlobalSPR, qfTools;

constructor TfmBonusEdit.Create(Aowner:TComponent; DateFilter:TDate; SessionKey:Int64; IdRaiseIn:Variant; isEdit:Boolean; Dmod:TUPAcceptDM);
begin
   inherited Create(AOwner);
   ActDate:=DateFilter;
   KeySession:=SessionKey;
   EditMode:=isEdit;
   if EditMode then
   begin
      if PubSprR.Active then PubSprR.Close;
      PubSprR.SQLs.SelectSQL.Text:='SELECT * FROM UP_ACCEPT_BONUS_INFO(:KEY_SESSION, :IN_ID_RAISE, :IN_DATE_BEG)';
      PubSprR.ParamByName('KEY_SESSION').AsInt64:=SessionKey;
      PubSprR.ParamByName('IN_ID_RAISE').AsInteger:=IdRaiseIn;
      PubSprR.ParamByName('IN_DATE_BEG').AsDate:=DateFilter;
      PubSprR.Open;
      IdRaise.Value:=IdRaiseIn;
      IdRaise.DisplayText:=PubSprR['RAISE_NAME'];
      if not VarIsNull(PubSprR['PERCENT']) then Percent.Value:=PubSprR['PERCENT']
      else Summa.Value:=PubSprR['SUMMA'];
      Smeta.Value:=PubSprR['ID_SMET'];
      Smeta.DisplayText:=PubSprR['SMETA_TITLE'];
      if not VarIsNull(PubSprR['ID_SMET_PPS']) then
      begin
         Kod_Sm_Pps.Value:=PubSprR['ID_SMET_PPS'];
         Kod_Sm_Pps.DisplayText:=PubSprR['SMETA_PPS_TITLE'];
      end;
      if PubSprR['IS_ALL_PERIODS']=0 then
      begin
        All_Periods.Value:=False;
        All_PeriodsChange(Self);
      end;
      DateBeg.Date:=PubSprR['DATE_BEG'];
      DateEnd.Date:=PubSprR['DATE_END'];
   end;
   DM:=Dmod;
end;

function TfmBonusEdit.CheckData:Boolean;
var d:TDate;
begin
   Result:=True;

   if VarIsNull(IdRaise.Value) then
   begin
      IdRaise.Highlight(True);
      IdRaise.SetFocus;
      agMessageDlg(WarningCaption, 'Ви не обрали надбавку!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if ((VarIsNull(Percent.Value)) and  VarIsNull(Summa.Value)) then
   begin
      Percent.Highlight(True);
      Summa.Highlight(True);
      agMessageDlg(WarningCaption, 'Ви не обрали процент або суму!', mtInformation, [mbOK]);
      Result:=False;
   end;

   if (Id_Calc_Type = 2) then
   begin
       if (VarIsNull(DM.Smets['Smeta_Name'])) then
       begin
           Smeta.Highlight(True);
           agMessageDlg(WarningCaption, 'Ви не обрали джерело фінансування!', mtInformation, [mbOK]);
           Result:=False;
       end;
   end
   else if VarIsNull(Smeta.Value) then
        begin
           Smeta.Highlight(True);
           agMessageDlg(WarningCaption, 'Ви не обрали джерело фінансування!', mtInformation, [mbOK]);
           Result:=False;
        end;

   if (All_Periods.Value=False) then
   begin
      if (DateToStr(DateBeg.Date)='') then
      begin
         DateBeg.Style.Color:=clRed;
         DateBeg.SetFocus;
         agMessageDlg(WarningCaption, 'Ви не обрали дату початку!', mtInformation, [mbOK]);
         Result:=False;
      end
      else
      begin
         try
             d:=DateBeg.Date;
         except
            agMessageDlg(WarningCaption, 'Не вірний формат дати!', mtInformation, [mbOK]);
            Result:=False;
         end;
      end;

      if (DateToStr(DateEnd.Date)='') then
      begin
         DateEnd.Style.Color:=clRed;
         DateEnd.SetFocus;
         agMessageDlg(WarningCaption, 'Ви не обрали дату кінця!', mtInformation, [mbOK]);
         Result:=False;
      end
      else
      begin
         try
             d:=DateEnd.Date;
         except
            agMessageDlg(WarningCaption, 'Не вірний формат дати!', mtInformation, [mbOK]);
            Result:=False;
         end;
      end;
   end;
end;

procedure TfmBonusEdit.IdRaiseOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmBonusEdit.SmetaOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, TISC_DB_Handle(DM.DB.Handle), Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmBonusEdit.SummaChange(Sender: TObject);
begin
    if not VarIsNull(Summa.Value) and (Summa.Value > 0) then
    begin
        Percent.Required := False;
        Percent.Clear;
    end
    else
        Percent.Required := True;
end;

procedure TfmBonusEdit.PercentChange(Sender: TObject);
begin
    if not VarIsNull(Percent.Value) and (Percent.Value > 0) then
    begin
        Summa.Required := False;
        Summa.Clear;
    end
    else
        Summa.Required := True;
end;

procedure TfmBonusEdit.IdRaiseChange(Sender: TObject);
var
//    id_Calc_Type: Integer;
    OklSmeta, OklSmetaPps: string;
begin
    try
        if not VarIsNull(IdRaise.Value) then
        begin
            DM.RaiseDefaults.Close;
            DM.RaiseDefaults.ParamByName('Key_Session').AsInteger := KeySession;
            DM.RaiseDefaults.ParamByName('Id_Raise').AsInteger := IdRaise.Value;
            DM.RaiseDefaults.Open;
            if DM.RaiseDefaults.IsEmpty then Id_Calc_Type := 2
            else
            begin
            //если Id_Calc_Type = 1 или 3, значит гибкая привязка к окладам
                if ((DM.RaiseDefaults['Id_Calc_Type'] = 1) or
                    (DM.RaiseDefaults['Id_Calc_Type'] = 3) or
                    (DM.RaiseDefaults['Id_Calc_Type'] = 6))
                then Id_Calc_Type := DM.RaiseDefaults['Id_Calc_Type'].AsInteger
                else Id_Calc_Type := 2;
            end;
                // заполнить процент по умолчанию для случая добавления
            //if not EditMode then
            begin
                if (not DM.RaiseDefaults.IsEmpty) and (not VarISNUll(DM.RaiseDefaults['Percent']))
                then Percent.Value := DM.RaiseDefaults['Percent'];
            end;
            if (Id_Calc_Type = 2) then // жесткая надбавка - согласно сметам оклада
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
                DM.Smets.First;
                while not DM.Smets.Eof do
                begin
                    if not VarIsNull(DM.Smets['Smeta_Name']) then
                        if Pos(DM.Smets['Smeta_Name'], OklSmeta) = 0 then
                            OklSmeta := OklSmeta + DM.Smets['Smeta_Name'] + ', ';
                    if not VarIsNull(DM.Smets['Smeta_Pps_Name']) then
                        if Pos(DM.Smets['Smeta_Pps_Name'], OklSmetaPps) = 0 then
                            OklSmetaPps := OklSmetaPps + DM.Smets['Smeta_Pps_Name'] + ', ';
                    DM.Smets.Next;
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
                Smeta.DisplayText := '';
                Kod_Sm_Pps.DisplayText := '';
            // загрузить из реестра - только для случая добавления записи
                if not EditMode then
                begin
                    IdRaise.AutoSaveToRegistry := False;
                    qFAutoLoadFromRegistry(Self);
                    IdRaise.AutoSaveToRegistry := True;
                end;
            end
        end;
    except
    end;
end;

procedure TfmBonusEdit.All_PeriodsChange(Sender: TObject);
begin
    if All_Periods.Value then
    begin
        DateBeg.Visible := False;
        DateEnd.Visible := False;
        lblDateBeg.Visible:=False;
        lblDateEnd.Visible:=False;
    end
    else
    begin
        DateBeg.Visible := True;
        DateEnd.Visible := True;
        lblDateBeg.Visible:=True;
        lblDateEnd.Visible:=True;        
    end;
end;

procedure TfmBonusEdit.FormCreate(Sender: TObject);
begin
    {DateBeg.Visible := False;
    DateEnd.Visible := False;    }
end;

procedure TfmBonusEdit.AcceptActionExecute(Sender: TObject);
begin
    if CheckData then
    begin
       ModalResult:=mrOk;
    end;
end;

procedure TfmBonusEdit.CancelActionExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmBonusEdit.FormControlModifyRecordAfterPrepare(
    Sender: TObject);
begin
    IdRaise.Value := IdRaise.Value;
end;

procedure TfmBonusEdit.NumBonusChange(Sender: TObject);
var    CalcTypeBon: TpFibDataSet;
begin
   if VarIsNull(NumBonus.Value)
        then exit;

    try
        PubSprR.Close;
        PubSprR.SQLs.SelectSQL.Text:='select * from sp_raise where Current_Date Between Use_Date_Beg And Use_Date_End and display_order=:display_order';
        //PubSprR.Database := dm.DB;
        //PubSprR.Transaction := dm.ReadTransaction;
        PubSprR.ParamByName('display_order').AsInteger := StrToInt(NumBonus.Value);
        PubSprR.Open;
        PubSprR.FetchAll;

        if PubSprR.RecordCount = 1 then
        begin
            IdRaise.Value := PubSprR['ID_RAISE'];
            IdRaise.DisplayText := PubSprR['FULL_NAME'];
            PubSprR.Close;
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
    RegisterClass(TfmBonusEdit);

end.

