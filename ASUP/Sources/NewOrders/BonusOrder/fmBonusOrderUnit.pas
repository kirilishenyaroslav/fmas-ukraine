unit fmBonusOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
  FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
  uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
  uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
  qFTools, uSelectForm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
  uSimpleCheck, fmChangeSmetaUnit, uBoolControl, GlobalSPR, uShtatUtils,
  Math;

type
  TfmBonusOrder = class(TForm)
    KeyList: TActionList;
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    SmetsViewQuery: TRxMemoryData;
    SmetSource: TDataSource;
    WorkQuery: TpFIBDataSet;
    CancelAction: TAction;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
    BottomPanel: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    GetRaiseCalcType: TpFIBDataSet;
    GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField;
    GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField;
    FormControl: TqFFormControl;
    SmetsViewQueryKOD_SM: TIntegerField;
    SmetsViewQueryKOD_SM_PPS: TIntegerField;
    SmetsViewQuerySUMMA: TFloatField;
    SmetsViewQuerySUMMA_PPS: TFloatField;
    SmetsViewQueryTITLE_SM: TStringField;
    SmetsViewQueryTITLE_SM_PPS: TStringField;
    SelectMovSmet: TpFIBDataSet;
    SelectMovSmetKOD_SM: TFIBIntegerField;
    SelectMovSmetKOD_SM_PPS: TFIBIntegerField;
    SelectMovSmetOKLAD_BASE: TFIBBCDField;
    SelectMovSmetOKLAD_PPS: TFIBBCDField;
    SelectMovSmetTITLE_SM: TFIBStringField;
    SelectMovSmetTITLE_SM_PPS: TFIBStringField;
    WorkQueryID_MAN_BONUS_SMET: TFIBIntegerField;
    WorkQueryID_MAN_BONUS: TFIBIntegerField;
    WorkQueryKOD_SM: TFIBIntegerField;
    WorkQueryKOD_SM_PPS: TFIBIntegerField;
    WorkQuerySUMMA: TFIBFloatField;
    WorkQuerySUMMA_PPS: TFIBFloatField;
    WorkQueryIS_PERCENT: TFIBStringField;
    WorkQueryDATE_BEG: TFIBDateField;
    WorkQueryDATE_END: TFIBDateField;
    WorkQueryREAL_DATE_END: TFIBDateField;
    WorkQuerySMETA_TITLE: TFIBStringField;
    WorkQuerySMETA_TITLE_PPS: TFIBStringField;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    SelectMovSmetSum: TpFIBDataSet;
    SelectMovSmetSumSUM: TFIBBCDField;
    PageControl: TPageControl;
    MainSheet: TTabSheet;
    TopPanel: TPanel;
    Label1: TLabel;
    RaiseCalcType: TLabel;
    Label2: TLabel;
    Fio: TqFSpravControl;
    WorkPlace: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    IsPercentBox: TGroupBox;
    PeriodCheck: TqFSimpleCheck;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Percent: TqFFloatControl;
    Summa: TqFFloatControl;
    Reason: TqFCharControl;
    Note: TqFCharControl;
    IdRaise: TqFSpravControl;
    Smeta: TqFSpravControl;
    Splitter: TcxSplitter;
    MiddlePanel: TPanel;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel3: TPanel;
    ModifyItemButton: TSpeedButton;
    RecalcSmetsButton: TSpeedButton;
    Panel1: TPanel;
    AdditionalSheet: TTabSheet;
    Department: TqFSpravControl;
    PostSalary: TqFSpravControl;
    Label3: TLabel;
    IsPercent: TqFInvisControl;
    SmNumberEdit: TEdit;
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
    CalcPercent: TButton;
    GetDefaultPercent: TpFIBDataSet;
    GetDefaultPercentRAISE_DEFAULT: TFIBFloatField;
    IsForever: TqFBoolControl;
    WorkQueryPERCENT: TFIBFloatField;
    SmetsViewQueryPERCENT: TFloatField;
    SelectCurBonus: TpFIBDataSet;
    SelectCurBonusRAISE_FULL_NAME: TFIBStringField;
    SelectCurBonusDATE_BEG: TFIBDateField;
    SelectCurBonusDATE_END: TFIBDateField;
    SelectCurBonusPERCENT: TFIBFloatField;
    SelectCurBonusSUMMA: TFIBFloatField;
    SelectCurBonusID_MAN_BONUS: TFIBIntegerField;
    ShowExistBonusButton: TButton;
    SelectCurWorkPlaceWORK_REASON: TFIBStringField;
    SelectCurWorkPlaceKOL_STAVOK: TFIBFloatField;
    SelectSovmOklad: TpFIBDataSet;
    Reform_Smet: TAction;
    pFIBDS_CheckPermission: TpFIBDataSet;
    pFIBDS_CheckPermissionNUM_PROJECT: TFIBStringField;
    pFIBDS_CheckPermissionDATE_ORDER: TFIBDateField;
    pFIBDS_CheckPermissionOWNER_NAME: TFIBStringField;
    qFSC_SovmestFIO: TqFSpravControl;
    Label4: TLabel;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FioChange(Sender: TObject);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure RadioButton1Click(Sender: TObject);
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CreateBonusSmets;
    procedure WriteBonusSmets(FMode : TFormMode);
    procedure ReadBonusSmets;
    procedure RecalcSmetsButtonClick(Sender: TObject);
    procedure IdRaiseChange(Sender: TObject);
    procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
    procedure ModifyItemButtonClick(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
      Mode: TFormMode);
    procedure SmNumberEditChange(Sender: TObject);
    procedure CalcPercentClick(Sender: TObject);
    procedure IsForeverChange(Sender: TObject);
    procedure ShowExistBonusButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Id_Calc_Type : Integer; // Тип расчета разбивки надбавок
    dmShtatUtils : TdmShtatUtils;
    DateOrder : TDate;
    IdOrder, IdManBonus, SpType : Integer;
    Id_order_group : Integer;
  end;

var
  fmBonusOrder: TfmBonusOrder;

implementation

{$R *.dfm}

procedure TfmBonusOrder.CreateBonusSmets;
var
    Oklad : Double;
    Oklad_Str : String;
begin
    if (VarIsNull(IdRaise.Value)) or
       (VarIsNull(Smeta.Value) and Smeta.Required) or
       (VarIsNull(Fio.Value)) or
       (VarIsNull(WorkPlace.Value)) or
       (VarIsNull(Reason.Value)) or
       (VarIsNull(Percent.Value) and Percent.Required) or
       (VarIsNull(Summa.Value) and Summa.Required)
    then begin
        qFCheckAll(Self);
        exit;
    end;

    SmetsViewQuery.Close;
    SmetsViewQuery.Open;

    ModifyItemButton.Enabled := False;

    if (Id_Calc_Type = 1) then begin  // Надбавка без привязки к окладу
        SmetsViewQuery.Append;

        SmetsViewQuery['KOD_SM'] := Smeta.Value;
        SmetsViewQuery['KOD_SM_PPS'] := null;
        SmetsViewQuery['SUMMA_PPS'] := null;
        SmetsViewQuery['TITLE_SM'] := Smeta.DisplayText;
        SmetsViewQuery['TITLE_SM_PPS'] := null;

        if RadioButton1.Checked then begin

            // считаем сумарный оклад по всем сметам
            SelectMovSmetSum.Close;

            if SpType = 1 then
                SelectMovSmetSum.SelectSQL.Text := 'SELECT sum(oklad) FROM ASUP_GET_CUR_MOV_SMET2(:Id_Man_Moving, :Cur_Date)';

            if SpType = 0 then
                SelectMovSmetSum.SelectSQL.Text := 'SELECT sum(oklad) FROM ASUP_GET_CUR_MOV_SMET(:Id_Man_Moving, :Cur_Date)';

            SelectMovSmetSum.ParamByName('ID_MAN_MOVING').AsInteger := WorkPlace.Value;

            //if SpType = 0 then
                SelectMovSmetSum.ParamByName('CUR_DATE').AsDate := DateBeg.Value;

            //if SpType = 1 then
            //    SelectMovSmetSum.ParamByName('ID_ORDER').AsInteger := IdOrder;

            SelectMovSmetSum.Open;

            SmetsViewQuery['SUMMA'] := SimpleRoundTo(SelectMovSmetSumSUM.Value * Percent.Value / 100);
            SmetsViewQuery['PERCENT'] := Percent.Value;

            SelectMovSmetSum.Close;
        end
        else begin
            SmetsViewQuery['SUMMA'] := Summa.Value;
            SmetsViewQuery['PERCENT'] := Percent.Value;
        end;

        SmetsViewQuery.Post;
    end;

    if (Id_Calc_Type = 2) or (Id_Calc_Type = 3) then begin  // Надбавка с привязкой к окладу (жесткая и гибкая)

        if (Id_Calc_Type = 3) then
            ModifyItemButton.Enabled := True;

        SelectMovSmet.Close;

        if SpType = 0 then
            SelectMovSmet.SelectSQL.Text := 'SELECT * FROM ASUP_GET_CUR_MOV_SMET(' + IntToStr(WorkPlace.Value) +
                                        ',' + QuotedStr(DateToStr(DateBeg.Value)) + ')';

        if SpType = 1 then
            SelectMovSmet.SelectSQL.Text := 'SELECT * FROM ASUP_GET_CUR_MOV_SMET2(' + IntToStr(WorkPlace.Value) +
                                        ',' + QuotedStr(DateToStr(DateBeg.Value)) + ')';

        SelectMovSmet.Open;
        SelectMovSmet.First;

        while not SelectMovSmet.eof do begin
            SmetsViewQuery.Append;

            SmetsViewQuery['KOD_SM'] := SelectMovSmetKOD_SM.Value;

            if not VarIsNull(SelectMovSmet['KOD_SM_PPS']) then
                SmetsViewQuery['KOD_SM_PPS'] := SelectMovSmetKOD_SM_PPS.Value
            else
                SmetsViewQuery['KOD_SM_PPS'] := null;

            SmetsViewQuery['SUMMA'] := SimpleRoundTo(SelectMovSmetOKLAD_BASE.Value * Percent.Value / 100);

            SmetsViewQuery['SUMMA_PPS'] := SimpleRoundTo(SelectMovSmetOKLAD_PPS.Value * Percent.Value / 100);

            SmetsViewQuery['TITLE_SM'] := SelectMovSmetTITLE_SM.value;
            SmetsViewQuery['TITLE_SM_PPS'] := SelectMovSmetKOD_SM_PPS.Value;
            SmetsViewQuery['PERCENT'] := null;
            SmetsViewQuery.Post;

            SelectMovSmet.Next;
        end;

    end;

    // если тип надбавки "% от совмещаемой должности"
    if id_calc_type = 4 then begin
        if VarIsNull(PostSalary.Value) then begin
            qFErrorDialog('Не вибрана суміщуєма посада!');
            exit;
        end;

        SmetsViewQuery.Append;

        SmetsViewQuery['KOD_SM'] := Smeta.Value;
        SmetsViewQuery['KOD_SM_PPS'] := null;
        SmetsViewQuery['SUMMA_PPS'] := null;
        SmetsViewQuery['TITLE_SM'] := Smeta.DisplayText;
        SmetsViewQuery['TITLE_SM_PPS'] := null;

        if RadioButton1.Checked then begin

            // считаем сумарный оклад по всем сметам
            SelectSovmOklad.Close;
            SelectSovmOklad.ParamByName('ID_POST_SALARY').AsInteger := PostSalary.Value;
            SelectSovmOklad.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            SelectSovmOklad.Open;

            if SelectSovmOklad.IsEmpty then begin
                qFErrorDialog('Неможливо отримати оклад для суміщуємої посади "' +
                PostSalary.DisplayText + '" на дату "' + DatEToStr(DateBeg.Value) + '"');
                exit;
            end;

            if SelectSovmOklad['OKLAD_MAX'] <> SelectSovmOklad['OKLAD_MIN'] then begin
                InputQuery('Для суміщуємої посади існує вилка окладів!',
                           'введіть оклад у межах від ' +
                           FloatToStr(SelectSovmOklad['OKLAD_MIN'])  + ' до ' + FloatToStr(SelectSovmOklad['OKLAD_MAX']),
                           Oklad_Str);

                Oklad := StrToFloat(Oklad_Str);                           
            end
            else
                Oklad := SelectSovmOklad['OKLAD_MAX'];

            SmetsViewQuery['SUMMA'] := SimpleRoundTo(Oklad * Percent.Value / 100);
            SmetsViewQuery['PERCENT'] := Percent.Value;

            SelectMovSmetSum.Close;
        end
        else begin
            SmetsViewQuery['SUMMA'] := Summa.Value;
            SmetsViewQuery['PERCENT'] := Percent.Value;
        end;

        SmetsViewQuery.Post;
    end;

    // если тип надбавки "% от совмещаемой должности, временно отсутствующего"
    if id_calc_type = 5 then begin
        if VarIsNull(PostSalary.Value) then begin
            qFErrorDialog('Не вибрана суміщуєма посада!');
            exit;
        end;
        if VarIsNull(qFSC_SovmestFIO.Value) then begin
            qFErrorDialog('Не вибрана людина обов''язки якої виконуються!');
            exit;
        end;

        SmetsViewQuery.Append;

        SmetsViewQuery['KOD_SM'] := Smeta.Value;
        SmetsViewQuery['KOD_SM_PPS'] := null;
        SmetsViewQuery['SUMMA_PPS'] := null;
        SmetsViewQuery['TITLE_SM'] := Smeta.DisplayText;
        SmetsViewQuery['TITLE_SM_PPS'] := null;

        if RadioButton1.Checked then begin

            // считаем сумарный оклад по всем сметам
            SelectSovmOklad.Close;
            SelectSovmOklad.ParamByName('ID_POST_SALARY').AsInteger := PostSalary.Value;
            SelectSovmOklad.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            SelectSovmOklad.Open;

            if SelectSovmOklad.IsEmpty then begin
                qFErrorDialog('Неможливо отримати оклад для суміщуємої посади "' +
                PostSalary.DisplayText + '" на дату "' + DatEToStr(DateBeg.Value) + '"');
                exit;
            end;

            if SelectSovmOklad['OKLAD_MAX'] <> SelectSovmOklad['OKLAD_MIN'] then begin
                InputQuery('Для суміщуємої посади існує вилка окладів!',
                           'введіть оклад у межах від ' +
                           FloatToStr(SelectSovmOklad['OKLAD_MIN'])  + ' до ' + FloatToStr(SelectSovmOklad['OKLAD_MAX']),
                           Oklad_Str);

                Oklad := StrToFloat(Oklad_Str);                           
            end
            else
                Oklad := SelectSovmOklad['OKLAD_MAX'];

            SmetsViewQuery['SUMMA'] := SimpleRoundTo(Oklad * Percent.Value / 100);
            SmetsViewQuery['PERCENT'] := Percent.Value;

            SelectMovSmetSum.Close;
        end
        else begin
            SmetsViewQuery['SUMMA'] := Summa.Value;
            SmetsViewQuery['PERCENT'] := Percent.Value;
        end;

        SmetsViewQuery.Post;
    end;
end;

procedure TfmBonusOrder.WriteBonusSmets(FMode : TFormMode);
begin
    if (FMode = fmInfo) then exit;

    WorkQuery.Transaction.StartTransaction;

    try

        // Удаляем старые записи
        if FMode <> fmAdd then begin

            WorkQuery.QDelete.Close;

            if SpType = 0 then
                WorkQuery.QDelete.ParamByName('ID_ORDER').AsInteger := IdOrder;

            If SpType = 1 then begin
                WorkQuery.QDelete.SQL.Text := 'execute procedure DT_MAN_BONUS_SMET_DELETE_ALL2(:id_Man_Bonus)';
                WorkQuery.QDelete.ParamByName('ID_Man_Bonus').AsInteger := IdManBonus;
            end;

            WorkQuery.QDelete.ExecQuery;
        end;

        WorkQuery.Close;

        // Пишем новые и обновляем старые записи
        SmetsViewQuery.First;

        while not SmetsViewQuery.Eof do begin
            WorkQuery.QInsert.Close;

            if SpType = 1 then
                WorkQuery.QInsert.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_SMET_INSERT2(:ID, :KOD_SM, :KOD_SM_PPS, :PERCENT, :SUMMA, :SUMMA_PPS)';

            if SpType = 0 then
                WorkQuery.QInsert.ParamByName('ID').AsInteger := IdOrder;

            if SpType = 1 then
                WorkQuery.QInsert.ParamByName('ID').AsInteger := IdManBonus;

            WorkQuery.QInsert.ParamByName('KOD_SM').AsInteger := SmetsViewQueryKOD_SM.Value;
            WorkQuery.QInsert.ParamByName('KOD_SM_PPS').AsInteger := SmetsViewQueryKOD_SM_PPS.Value;
            WorkQuery.QInsert.ParamByName('PERCENT').AsFloat := SmetsViewQueryPERCENT.Value;
            WorkQuery.QInsert.ParamByName('SUMMA').AsFloat := SmetsViewQuerySUMMA.Value;
            WorkQuery.QInsert.ParamByName('SUMMA_PPS').AsFloat := SmetsViewQuerySUMMA_PPS.Value;
            WorkQuery.QInsert.ExecQuery;
            SmetsViewQuery.Next;
        end;

    except on E:Exception do begin
            qFErrorDialog('При занесенні даних про погодинну працю виникла помилка: "' + E.Message + '"');
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;
end;

procedure TfmBonusOrder.ReadBonusSmets;
begin
    WorkQuery.Close;

    if SpType = 1 then
        WorkQuery.SelectSQL.Text := 'select * from DT_MAN_BONUS_SMET_SELECT2(:id)';

    If SpType = 0 then
        WorkQuery.ParamByName('ID').AsInteger := IdOrder;

    If SpType = 1 then
        WorkQuery.ParamByName('ID').AsInteger := IdManBonus;        

    WorkQuery.Open;

    SmetsViewQuery.Close;
    SmetsViewQuery.Open;

    While not WorkQuery.Eof do begin
        SmetsViewQuery.Append;

        SmetsViewQuery['KOD_SM'] := WorkQueryKOD_SM.Value;
        SmetsViewQuery['KOD_SM_PPS'] := WorkQueryKOD_SM_PPS.Value;
        SmetsViewQuery['SUMMA'] := WorkQuerySUMMA.Value;
        SmetsViewQuery['SUMMA_PPS'] := WorkQuerySUMMA_PPS.Value;
        SmetsViewQuery['TITLE_SM'] := WorkQuerySMETA_TITLE.Value;
        SmetsViewQuery['TITLE_SM_PPS'] := WorkQuerySMETA_TITLE_PPS.Value;
        SmetsViewQuery['PERCENT'] := WorkQueryPERCENT.Value;

        SmetsViewQuery.Post;
        WorkQuery.Next;
    end;

    // Подставляем смету в случае, если тип надбавки - без привязки к окладу
    if ((ID_CALC_TYPE = 1) or (ID_CALC_TYPE = 4)) and (SmetsViewQuery.RecordCount = 1)  then begin
        Smeta.Value := WorkQueryKOD_SM.Value;
        Smeta.DisplayText := WorkQuerySMETA_TITLE.Value;
    end;

    WorkQuery.Close;
end;

procedure TfmBonusOrder.OkActionExecute(Sender: TObject);
begin
    pFIBDS_CheckPermission.ParamByName('id_pcard').AsInteger:=FIO.Value;
    pFIBDS_CheckPermission.ParamByName('id_order').AsInteger:=Id_order_group;
    pFIBDS_CheckPermission.Open;
    if (not pFIBDS_CheckPermission.IsEmpty)
     then begin
       qFInformDialog('Не можливо створити наказ на цю людину тому, що є інші не виконані накази пов''язані з нею!');
       qSelect(pFIBDS_CheckPermission,'Перелік наказів');
       pFIBDS_CheckPermission.Close;
       ModalResult:=0;
       Exit;
     end;
    pFIBDS_CheckPermission.Close;

    if not SmetsViewQuery.IsEmpty then begin
        FormControl.Ok;
        
        if ModalResult = mrOk then begin
            if FormControl.Mode = fmAdd then begin
                if SpType = 0 then
                    IdOrder := FormControl.LastId;

                if SpType = 1 then
                    IdManBonus := FormControl.LastId;
            end;
                                                
            WriteBonusSmets(FormControl.Mode);
        end
    end
    else begin
        if not qFCheckAll(Self) then exit;

        MessageDlg('Не було сформовано розбивки по кошторисах. Зараз відбудеться формування!', mtInformation, [mbYes], 0);
        CreateBonusSmets;
        PageControl.ActivePageIndex := 0;
    end;
end;

procedure TfmBonusOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBonusOrder.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := DateOrder;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
//            FieldValues['AdminMode'] := Adm;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            SelectCurWorkPlace.Close;
            SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := FIO.Value;
            SelectCurWorkPlace.Open;
            SelectCurWorkPlace.FetchAll;

            if SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
                WorkPlace.DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
            end
            else begin
                WorkPlace.Value := Null;
                WorkPlace.DisplayText := '';
            end;

            Reason.Value := 'Заява ' + sp.Output['FIO_SMALL'];
        end;
        sp.Free;
    end;
end;

procedure TfmBonusOrder.FioChange(Sender: TObject);
begin
    if not Visible then
        exit;

    if VarIsNull(Fio.Value) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateBeg.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end
    else
        WorkPlace.OpenSprav;
end;

procedure TfmBonusOrder.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateBeg.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;    

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';

        try
//            DateBeg.Value := SelectCurWorkPlaceDATE_BEG.Value;
            DateEnd.Value := SelectCurWorkPlaceReal_DATE_End.Value;

            IsForever.Value := (DateEnd.Value >= EncodeDate(2050, 12, 31));
            IsForeverChange(Self);
        except
        end;
    end;
end;

procedure TfmBonusOrder.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked then begin
        Percent.Blocked := False;
        Percent.Required := True;
        Summa.Blocked := True;
        Summa.Value := null;
        Summa.Required := False;
        IsPercent.Value := '''T''';
    end;

    if RadioButton2.Checked then begin
        Percent.Blocked := True;
        Summa.Blocked := False;
        Summa.Required := True;
        Percent.Value := null;
        Percent.Required := False;
        IsPercent.Value := '''F''';
    end;
end;

procedure TfmBonusOrder.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 0;
            FieldValues['Actual_Date'] := DateOrder;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];

            try
                GetDefaultPercent.Close;
                GetDefaultPercent.ParamByName('ID_RAISE').AsInteger := Value;
                GetDefaultPercent.Open;
                Percent.Value := GetDefaultPercentRAISE_DEFAULT.Value;
            except
            end;
        end;
        sp.Free;
    end;
end;

procedure TfmBonusOrder.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, LocalDatabase.Handle, DateOrder, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmBonusOrder.RecalcSmetsButtonClick(Sender: TObject);
begin
    CreateBonusSmets;
end;

procedure TfmBonusOrder.IdRaiseChange(Sender: TObject);
begin
    if varIsNull(IdRaise.Value) then
        exit;

    GetRaiseCalcType.Close;
    GetRaiseCalcType.ParamByName('ID_RAISE').AsInteger := IdRaise.Value;
    GetRaiseCalcType.ParamByName('CUR_DATE').AsDate := DateOrder;
    GetRaiseCalcType.Open;

    if not GetRaiseCalcType.IsEmpty then begin
        RaiseCalcType.Caption := GetRaiseCalcTypeCALC_TYPE_NAME.Value;
        Id_Calc_Type := GetRaiseCalcTypeID_CALC_TYPE.Value;

        if (Id_Calc_Type = 1) or (Id_Calc_Type = 4) then begin
            Smeta.Blocked := False;
            Smeta.Required := True;
            SmNumberEdit.Enabled := True;
            RadioButton2.Enabled := True;
        end
        else begin
            Smeta.Blocked := True;
            Smeta.Required := False;
            SmNumberEdit.Enabled := False;            
            Smeta.Value := null;
            Smeta.DisplayText := '';
            RadioButton2.Enabled := False;
            RadioButton1.Checked := True;
            RadioButton1Click(Self);
        end;

    end
    else begin
        RaiseCalcType.Caption := 'УВАГА! У довіднику типів надбавок та доплат не вибрано тип розбивки за кошторисом!';
        Id_Calc_Type := 0;
    end;

    GetRaiseCalcType.Close;
end;

procedure TfmBonusOrder.FormControlModifyRecordAfterPrepare(
  Sender: TObject);
begin
    if IsPercent.Value = 'T' then
        RadioButton1.Checked := True
    else
        RadioButton2.Checked := True;

    RadioButton1Click(Self);

    ReadBonusSmets;
end;

procedure TfmBonusOrder.ModifyItemButtonClick(Sender: TObject);
var
    Form : TfmChangeSmeta;
begin
    if SmetsViewQuery.IsEmpty then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    Form := TfmChangeSmeta.Create(Self);

    Form.Smeta.Value := SmetsViewQuery['KOD_SM'];
    Form.SmetaPps.Value := SmetsViewQuery['KOD_SM_PPS'];
    Form.Smeta.DisplayText := SmetsViewQuery['TITLE_SM'];
    Form.SmetaPps.DisplayText := SmetsViewQuery['TITLE_SM_PPS'];

    if VarIsNull(SmetsViewQuery['KOD_SM_PPS']) or (SmetsViewQueryKOD_SM_PPS.Value = 0) then begin
        Form.SmetaPps.Required := False;
        Form.SmetaPps.Blocked := True;
    end;

    if Form.ShowModal = mrOk then begin
        SmetsViewQuery.Edit;
        SmetsViewQuery['KOD_SM'] := Form.Smeta.Value;
        SmetsViewQuery['KOD_SM_PPS'] := Form.SmetaPps.Value;
        SmetsViewQuery['TITLE_SM'] := Form.Smeta.DisplayText;
        SmetsViewQuery['TITLE_SM_PPS'] := Form.SmetaPps.DisplayText;
        SmetsViewQuery.Post;
    end;

    Form.free;
end;

procedure TfmBonusOrder.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['Actual_Date'] := DateBeg.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmBonusOrder.PostSalaryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    dmShtatUtils.GetSalaryFilter(Value, DisplayText, Department.Value);
end;

procedure TfmBonusOrder.FormControlAfterPrepare(Sender: TObject;
  Form: TForm; Mode: TFormMode);
begin
    PageControl.ActivePageIndex := 0;

    if (not VarIsNull(DateEnd.Value)) and
       (DateEnd.Value = StrToDate('31.12.2150'))
    then
        IsForever.Value := True;

    IsForeverChange(Self);
end;

procedure TfmBonusOrder.SmNumberEditChange(Sender: TObject);
begin
    if SmNumberEdit.Text = '' then
        exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(SmNumberEdit.Text);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then begin
            Smeta.Value := PubSprSmetID_SMETA.Value;
            Smeta.DisplayText := PubSprSmetSMETA_KOD.AsString +
                                 '. ' + PubSprSmetSMETA_TITLE.Value;
        end;
    except
    end;
end;

procedure TfmBonusOrder.CalcPercentClick(Sender: TObject);
begin
    if VarIsNull(Summa.Value) then
        exit;

    // считаем сумарный оклад по всем сметам
    SelectMovSmetSum.Close;

    if SpType = 1 then
        SelectMovSmetSum.SelectSQL.Text := 'SELECT sum(oklad) FROM ASUP_GET_CUR_MOV_SMET2(:Id_Man_Moving, :CUR_DATE)';

    if SpType = 0 then
        SelectMovSmetSum.SelectSQL.Text := 'SELECT sum(oklad) FROM ASUP_GET_CUR_MOV_SMET(:Id_Man_Moving, :Cur_Date)';

    SelectMovSmetSum.ParamByName('ID_MAN_MOVING').AsInteger := WorkPlace.Value;

    //if SpType = 0 then
        SelectMovSmetSum.ParamByName('CUR_DATE').AsDate := DateBeg.Value;

    //if SpType = 1 then
    //    SelectMovSmetSum.ParamByName('ID_ORDER').AsInteger := IdOrder;

    SelectMovSmetSum.Open;

    Percent.Value := Summa.Value / SelectMovSmetSumSUM.Value * 100;
end;

procedure TfmBonusOrder.IsForeverChange(Sender: TObject);
begin
    if VarIsNull(IsForever.Value) then
        exit;

    DateEnd.Visible := not (IsForever.Value);

    if IsForever.Value then
        DateEnd.Value := StrToDate('31.12.2150');
end;

procedure TfmBonusOrder.ShowExistBonusButtonClick(Sender: TObject);
begin
    if VarIsNull(WorkPlace.Value) then
    begin
        qFErrorDialog('Спочатку треба вибрати працівника та місце роботи!');
        exit;
    end;

    SelectCurBonus.Close;
    SelectCurBonus.ParamByName('Id_Man_Moving').AsInteger := WorkPlace.Value;
    SelectCurBonus.Open;
    SelectCurBonus.FetchAll;

    qSelect(SelectCurBonus, 'Існуючі надбавки та доплати');
end;

end.
