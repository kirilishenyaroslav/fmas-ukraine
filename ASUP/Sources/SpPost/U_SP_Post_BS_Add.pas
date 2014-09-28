{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления/изменения базового оклада                  }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_BS_Add;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ComCtrls, Mask, CheckEditUnit, FieldControl,
    U_SPPost_DataModule, SpCommon, EditControl, RxMemDS, Grids, DBGrids,
    ExtCtrls, DB, uActionControl, ActnList, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
    cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, uCharControl,
    uFloatControl, uFControl, uLabeledFControl, uSpravControl;

type
    TSP_PBS_Add = class(TForm)
        FC_Name: TFieldControl;                         
        CE_Name: TCheckEdit;
        Label5: TLabel;
        Label1: TLabel;
        CE_Min: TCheckEdit;
        FC_Min: TFieldControl;
        Label2: TLabel;
        CE_Max: TCheckEdit;
        FC_Max: TFieldControl;
        Label8: TLabel;
        Label7: TLabel;
        DT_DateBeg: TDateTimePicker;
        Label6: TLabel;
        DT_DateEnd: TDateTimePicker;
        SbOk: TBitBtn;
        SbCancel: TBitBtn;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        Panel1: TPanel;
        SpeedButton7: TSpeedButton;
        SpeedButton8: TSpeedButton;
        SpeedButton9: TSpeedButton;
        DigitsSource: TDataSource;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        DigitsView: TcxGridDBTableView;
        DigitsGridLevel1: TcxGridLevel;
        DigitsGrid: TcxGrid;
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
        DigitsData: TRxMemoryData;
        DigitsDataId_Jn_Post_Digits: TIntegerField;
        DigitsDataId_Post_Base_Salary: TIntegerField;
        DigitsDataNum_Digit: TIntegerField;
        DigitsDataDate_Beg: TDateField;
        DigitsDataDate_End: TDateField;
        DigitsViewId_Jn_Post_Digits: TcxGridDBColumn;
        DigitsViewId_Post_Base_Salary: TcxGridDBColumn;
        DigitsViewNum_Digit: TcxGridDBColumn;
        DigitsViewDate_Beg: TcxGridDBColumn;
        DigitsViewDate_End: TcxGridDBColumn;
        Old_Oklad: TCheckBox;
        Ref_Base_Salary: TqFSpravControl;
        Koeff: TqFFloatControl;
        StatusPanel: TPanel;
        AcceptAction: TAction;
        CancelAction: TAction;
        Panel2: TPanel;
        RBRozryad: TRadioButton;
        RBTarif: TRadioButton;
        DigitsViewStavka: TcxGridDBColumn;
        TarifSource: TDataSource;
        TarifData: TRxMemoryData;
        IntegerField1: TIntegerField;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        TarifDataID_CAT_TARIF_GRID: TIntegerField;
        TarifDataStavka: TCurrencyField;
        TarifDataNUM: TIntegerField;
        TarifDataName_tarif: TStringField;
    TarifDataId_category_tarif: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure SbOkClick(Sender: TObject);
        procedure CE_MinKeyPress(Sender: TObject; var Key: Char);
        procedure RadioButton1Click(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure AddActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure Ref_Base_SalaryChange(Sender: TObject);
        procedure Ref_Base_SalaryOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure KoeffChange(Sender: TObject);
        procedure DT_DateBegChange(Sender: TObject);
        procedure DigitsViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CE_NameExit(Sender: TObject);
        procedure CE_NameEnter(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure RBRozryadClick(Sender: TObject);
        procedure RBTarifClick(Sender: TObject);
    private
        FormControl: TEditControl;

        procedure RecalcOklad;
        function CheckDigits: String;
    public
        Id_Bs: Integer;
        DBeg, DEnd: TDate;
        Use_Digit: Variant;
        Digit_STR: string;
        DM: TDMSPPost;
        Ref_Salary_Val: Variant;

        procedure Prepare;
    end;

var
    SP_PBS_Add: TSP_PBS_Add;

implementation

{$R *.dfm}

uses uAddJnPostDigit, qFTools, uFormControl, DateUtils, uSelectForm, Math,
     uAddJnPostTarif;

procedure TSP_PBS_Add.FormCreate(Sender: TObject);
begin
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name, FC_Min, FC_Max]);
    FormControl.Prepare(emNew);
    DT_DateEnd.Date := Infinity_Date;
    RBTarif.Enabled := False;
    //RBTarif.Visible := False;
    if DigitsData.IsEmpty then
    begin
        RBTarif.Enabled := True;
        RBTarif.Visible := True;
    end;
    
end;

procedure TSP_PBS_Add.SbOkClick(Sender: TObject);
var
    err: String;
begin

    FormControl.Read;

    err := CheckDigits;

    if err <> '' then
    begin
        qFErrorDialog(err);
        ModalResult := 0;
        Exit;
    end;

    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if (DT_DateBeg.Date > DT_DateEnd.Date) then
    begin
        MessageDlg('Дата початку має бути меншою за дату кінця', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

    if (StrToFloat(CE_Min.Text) > StrToFloat(CE_Max.Text)) then
    begin
        MessageDlg('Мінімум має бути меншим за максимум', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

  {if not TextOk(CE_Name.Text)then
   begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     ModalResult := 0;
     Exit;
   end;}

    if CE_Name.Text = '' then CE_Name.Text := ' ';

end;

procedure TSP_PBS_Add.CE_MinKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;
end;

procedure TSP_PBS_Add.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked then
    begin
        DT_DateBeg.Date := DBeg;
        DT_DateEnd.Date := DEnd;
    end;
    if RadioButton2.Checked then
    begin
        if (DEnd <> Infinity_Date) then
            DT_DateBeg.Date := DEnd + 1
        else
            DT_DateBeg.Date := Date();
        DT_DateEnd.Date := Infinity_Date;
    end;
end;

procedure TSP_PBS_Add.DeleteActionExecute(Sender: TObject);
begin
    if (Use_Digit = 1) then
    begin
        if not DigitsData.IsEmpty and qFConfirm('Чи справді ви бажаєте вилучити цей запис?') then
            DigitsData.Delete;
        RBTarif.Enabled := True;
        RBTarif.Visible := True;
        Use_Digit := 0;
    end
    else
    begin
        if not TarifData.IsEmpty and qFConfirm('Чи справді ви бажаєте вилучити цей запис?') then
            TarifData.Delete;
        RBRozryad.Enabled := True;
        RBRozryad.Visible := True;
        Use_Digit := 0;
    end;
    RecalcOklad;
end;

procedure TSP_PBS_Add.AddActionExecute(Sender: TObject);
var
    fm: TfmAddJnPostDigit;
    fm2: TfmAddJnPostTarif;
begin
    if RBRozryad.Checked then
    begin
        fm := TfmAddJnPostDigit.Create(Self);
        fm.DigitsDS.CopyStructure(DigitsData);
        fm.Id_BS := Id_Bs;
        fm.Id_Jn_Post_Digits := -1;
        fm.Date_Beg.Value := DT_DateBeg.Date;
        fm.Date_End.Value := Infinity_Date;
        if fm.ShowModal = mrOk then
        begin
            DigitsData.LoadFromDataSet(fm.DigitsDS, 1, lmAppend);
            Use_Digit := 1;
            RBTarif.Enabled := False;
        end;
        fm.Free;
        RecalcOklad;
        if DigitsData.IsEmpty then
        begin
            RBTarif.Enabled := True;
            RBTarif.Visible := True;
        end;
    end
    else
    begin
        try
        fm2 := TfmAddJnPostTarif.Create(Self, Dm.FIBDatabase.Handle);
        fm2.TarifDS.CopyStructure(TarifData);
        except on E:Exception do Showmessage(E.Message);
   end;
        fm2.Id_BS             := Id_Bs;
        fm2.Id_Jn_Post_Tarif  := -1;
        fm2.Date_Beg.Value    := DT_DateBeg.Date;
        fm2.Date_End.Value    := DT_DateEnd.Date;
        if fm2.ShowModal = mrOk then
        begin
            TarifData.LoadFromDataSet(fm2.TarifDS, 1, lmAppend);
            Use_Digit := 2;
            RBRozryad.Enabled := False;
            DT_DateBeg.Date := fm2.Date_Beg.Value;
            DT_DateEnd.Date := fm2.Date_End.Value;
        end;
        try
        fm2.free;
        except on E:Exception do ShowMessage(E.Message);
        end;
        RecalcOklad;
        if TarifData.IsEmpty then
        begin
            RBRozryad.Enabled := True;
            RBRozryad.Visible := True;
        end;
    end;
end;

procedure TSP_PBS_Add.ModifyActionExecute(Sender: TObject);
var
    fm: TfmAddJnPostDigit;
    fm2: TfmAddJnPostTarif;
begin
    if RBRozryad.Checked then
    begin
        if DigitsData.IsEmpty then Exit;

        fm := TfmAddJnPostDigit.Create(Self);
        fm.DigitsDS.CopyStructure(DigitsData);
        fm.Id_BS             := Id_Bs;
        fm.Id_Jn_Post_Digits := DigitsData['Id_Jn_Post_Digits'];
        fm.Num_Digit.Value   := DigitsData['Num_Digit'];
        fm.Date_Beg.Value    := DigitsData['Date_Beg'];
        fm.Date_End.Value    := DigitsData['Date_End'];

        if fm.ShowModal = mrOk then
        begin
            DigitsData.Delete;
            DigitsData.Append;
            DigitsData['Num_Digit']           := fm.DigitsDS['Num_Digit'];
            DigitsData['Date_Beg']            := fm.DigitsDS['Date_Beg'];
            DigitsData['Date_End']            := fm.DigitsDS['Date_End'];
            DigitsData['Id_Post_Base_Salary'] := fm.DigitsDS['Id_Post_Base_Salary'];
            DigitsData['Id_Jn_Post_Digits']   := fm.DigitsDS['Id_Jn_Post_Digits'];
            DigitsData.Post;
        end;
        fm.Free;
        RecalcOklad;
    end
    else
    begin
        if TarifData.IsEmpty then Exit;

        fm2 := TfmAddJnPostTarif.Create(Self, Dm.FIBDatabase.Handle);
        fm2.TarifDS.CopyStructure(TarifData);
        fm2.Id_BS                 := Id_Bs;
        fm2.Id_Jn_Post_Tarif      := TarifData['Id_Jn_Post_Tarif'];
        fm2.Date_Beg.Value        := TarifData['Date_Beg'];
        fm2.Date_End.Value        := TarifData['Date_End'];
        fm2.Id_Cat_Tarif_Grid     := TarifData['Id_Cat_Tarif_Grid'];
        fm2.Name_Tarif            := TarifData['Name_Tarif'];
        fm2.TarifSpr.Value        := TarifData['Id_Cat_Tarif_Grid'];
        fm2.TarifSpr.DisplayText  := TarifData['Name_Tarif'];
        fm2.Id_Category_tarif     := TarifData['Id_Category_tarif'];
        //fm2.Rate_Out          := TarifData['Stavka'];

        if fm2.ShowModal = mrOk then
        begin
            TarifData.Delete;
            TarifData.Append;
           // TarifData['Name_Tarif']          := fm2.TarifDS['Name_Tarif'];
            TarifData['Date_Beg']            := fm2.TarifDS['Date_Beg'];
            TarifData['Date_End']            := fm2.TarifDS['Date_End'];
            TarifData['Id_Post_Base_Salary'] := fm2.TarifDS['Id_Post_Base_Salary'];
            TarifData['Id_Jn_Post_Tarif']    := fm2.TarifDS['Id_Jn_Post_Tarif'];
            TarifData['Name_tarif']          := fm2.TarifDS['Name_tarif'];
            TarifData['Id_Cat_Tarif_Grid']   := fm2.TarifDS['Id_Cat_Tarif_Grid'];
            TarifData['Id_Category_tarif']   := fm2.TarifDS['Id_Category_tarif'];
            TarifData.Post;
        end;
        try
        fm2.free;
        except on E:Exception do ShowMessage(E.Message);
        end;
        RecalcOklad;
        RBRozryad.Enabled := False;
        //RBRozryad.Visible := False;
        if DigitsData.IsEmpty then
        begin
          //  RBRozryad.Enabled := True;
            //RBRozryad.Visible := True;
        end;
    end
end;

procedure TSP_PBS_Add.Ref_Base_SalaryChange(Sender: TObject);
begin
    Koeff.Blocked := VarIsNull(Ref_Base_Salary.Value);
    Koeff.Required := not VarIsNull(Ref_Base_Salary.Value);
    if VarIsNull(Ref_Base_Salary.Value) then
       {* if (DigitsData.IsEmpty and TarifData.IsEmpty) then
            Use_Digit := 0
        else*} if TarifData.IsEmpty then Use_Digit := 1
                else Use_Digit := 2;
    if VarIsNull(Ref_Base_Salary.Value) then
    begin
        RBRozryad.Enabled := True;
        RBTarif.Visible := True;
        RBTarif.Enabled   := True;
        SpeedButton7.Enabled := True;
        SpeedButton8.Enabled := True;
        SpeedButton9.Enabled := True;
    end;
end;

procedure TSP_PBS_Add.Ref_Base_SalaryOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.RefSalarySelect.Close;
    DM.RefSalarySelect.ParamByName('Cur_Date').AsDate := DT_DateBeg.Date;

    if qSelect(DM.RefSalarySelect) then
    begin
        Value := DM.RefSalarySelect['Id_Post_Base_Salary'];
        DisplayText := DM.RefSalarySelect['Base_Salary_Name'];
        Ref_Salary_Val := DM.RefSalarySelect['Base_Oklad'];
        Use_Digit := DM.RefSalarySelect['Use_Digit'];
        DigitsData.Close;
        DigitsData.Open;
        TarifData.Close;
        TarifData.Open;
        RBRozryad.Enabled := False;
        RBTarif.Enabled   := False;
        SpeedButton7.Enabled := False;
        SpeedButton8.Enabled := False;
        SpeedButton9.Enabled := False;
        RecalcOklad;
    end;
end;

procedure TSP_PBS_Add.KoeffChange(Sender: TObject);
begin
    RecalcOklad;
end;

procedure TSP_PBS_Add.DT_DateBegChange(Sender: TObject);
begin
    RecalcOklad;
end;

procedure TSP_PBS_Add.DigitsViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_Delete then DeleteAction.Execute;
end;

procedure TSP_PBS_Add.RecalcOklad;
begin
    if not VarIsNull(Koeff.Value) and (Koeff.Value <> 0) then
    begin
        if Use_Digit = 0 then
            CE_Min.Text := FloatToStr(SimpleRoundTo((Koeff.Value * Ref_Salary_Val) / 100, 0))
        else CE_Min.Text := FloatToStr(SimpleRoundTo((Koeff.Value * Ref_Salary_Val) / 100, -2));
        CE_Max.Text := CE_Min.Text;
        Digit_STR := FormatFloat('###.00', Koeff.Value) + '%';
    end;

    if Use_Digit = 1 then
    begin
        if not DigitsData.IsEmpty then
        begin
            DigitsData.First;
            while not DigitsData.Eof do
            begin
                if (Dt_DateBeg.Date >= DigitsData['Date_Beg'])
                    or (Dt_DateEnd.Date <= DigitsData['Date_End']) then
                begin
                    DM.DigitSalary.Close;
                    DM.DigitSalary.ParamByName('Num_Digit').AsInteger := DigitsData['Num_Digit'];
                    DM.DigitSalary.ParamByName('Cur_Date').AsDate := Dt_DateBeg.Date;
                    DM.DigitSalary.Open;

                    if (not DM.DigitSalary.IsEmpty) and (not VarIsNull(DM.DigitSalary['Base_Salary'])) then
                    begin
                        CE_Min.Text := FloatToStr(DM.DigitSalary['Base_Salary']);
                        CE_Max.Text := CE_Min.Text;
                        Use_Digit := 1;
                        Digit_Str := IntToStr(DigitsData['Num_Digit']);
                    end;
                end;
                DigitsData.Next;
            end;
        end;
    end else if Use_Digit = 2 then
    begin
        if not TarifData.IsEmpty then
        begin
            TarifData.First;
            while not TarifData.Eof do
            begin
                if (Dt_DateEnd.Date >= TarifData['Date_Beg'])
                    or (Dt_DateBeg.Date <= TarifData['Date_End']) then
                begin
                   // Showmessage('111');
                    DM.TarifSalary.Close;
                    DM.TarifSalary.ParamByName('Id_Category_tarif').AsInteger := TarifData['Id_Category_tarif'];
                    DM.TarifSalary.ParamByName('Cur_Date').AsDate := TarifData['Date_Beg'];
                    DM.TarifSalary.Open;
                  //  Showmessage('222');
                    if (not DM.TarifSalary.IsEmpty) and (not VarIsNull(DM.TarifSalary['Base_Salary'])) then
                    begin
                        CE_Min.Text := FloatToStr(DM.TarifSalary['Base_Salary']);
                        CE_Max.Text := CE_Min.Text;
                        Use_Digit := 2;

                        Digit_Str := DM.TarifSalary['Name_Tarif'];
                       // ShowMessage('Digit_Str = ' + Digit_Str);
                       // ShowMessage(DateToStr(TarifData['Date_Beg']));
                    end;
                end;
                TarifData.Next;
            end;
        end;
    end;

end;

procedure TSP_PBS_Add.CE_NameExit(Sender: TObject);
begin
    DeleteAction.Enabled := True;
end;

procedure TSP_PBS_Add.CE_NameEnter(Sender: TObject);
begin
    DeleteAction.Enabled := False;
end;

procedure TSP_PBS_Add.AcceptActionExecute(Sender: TObject);
begin
    SbOk.Click;
end;

procedure TSP_PBS_Add.CancelActionExecute(Sender: TObject);
begin
    SbCancel.Click;
end;

procedure TSP_PBS_Add.Prepare;
begin
    DT_DateBeg.Date := DM.Base_Date;
end;


function TSP_PBS_Add.CheckDigits: String;
var
    DBeg: TDate;
    bookmark: TBookmark;
    RNO: Integer;
begin
    Result := '';

    if ((Use_Digit = 0) or (Use_Digit = 4)) then
    begin
        if VarIsNull(Ref_Base_Salary.Value) then
        begin
            if VarIsNull(Koeff.Value) then
            begin
                Result := 'Помилка: не обрано оклад!';
                Exit;
            end
            else
            begin
                Result := 'Помилка: не обрано базовий оклад, від якого обичслюється відсоток!';
                Exit;
            end
        end
        else if VarIsNull(Koeff.Value) then
            begin
                Result := 'Помилка: не вказано відсоток від базового окладу!';
                Exit;
            end;
    end;

    if Use_Digit = 1 then
    begin
        if not DigitsData.Active then
        begin
            Result := 'Помилка: не обрано розряд!';
            Exit;
        end;

        DigitsData.First;
        while not DigitsData.Eof do
        begin
            if not TarifData.IsEmpty then
            begin
                Result := 'Помилка: встановлено одночасно тарифи і розряди !';
                Exit;
            end;
            DBeg := DigitsData['Date_Beg'];
            RNo := DigitsData.RecNo;
            bookmark := DigitsData.GetBookmark;
            DigitsData.First;
            while not DigitsData.Eof do
            begin
                if ( RNo <> DigitsData.RecNo ) and ( DBeg >= DigitsData['Date_Beg'] ) and ( DBeg <= DigitsData['Date_End']) then
                begin
                    Result := 'Помилка: встановлено більше за один розряд на дату ' +
                        DateToStr(DBeg) + '!';
                    Exit;
                end;
                DigitsData.Next;
            end;
            DigitsData.GotoBookmark(bookmark);
            DigitsData.Next;
        end;
    end;

    if Use_Digit = 2 then begin
        if not TarifData.Active then Exit;

        TarifData.First;
        while not TarifData.Eof do
        begin
            DBeg := TarifData['Date_Beg'];
            RNo := TarifData.RecNo;
            bookmark := TarifData.GetBookmark;
            TarifData.First;
            while not TarifData.Eof do
            begin
                if ( RNo <> TarifData.RecNo ) and ( DBeg >= TarifData['Date_Beg'] ) and ( DBeg <= TarifData['Date_End']) then
                begin
                    Result := 'Помилка: встановлено більше за один тариф на дату ' +
                        DateToStr(DBeg) + '!';
                    Exit;
                end;
                TarifData.Next;
            end;
            TarifData.GotoBookmark(bookmark);
            TarifData.Next;
        end;
    end;
end;

procedure TSP_PBS_Add.RBRozryadClick(Sender: TObject);
begin
    if RBRozryad.Checked then
    begin
        DigitsView.DataController.DataSource := DigitsSource;
        DigitsViewId_Jn_Post_Digits.DataBinding.FieldName := 'Id_Jn_Post_Digits';
        DigitsViewId_Post_Base_Salary.DataBinding.FieldName := 'Id_Post_Base_Salary';
        DigitsViewNum_Digit.DataBinding.FieldName := 'Num_Digit';
        DigitsViewDate_Beg.DataBinding.FieldName := 'Date_Beg';
        DigitsViewDate_End.DataBinding.FieldName := 'Date_End';
        DigitsViewNum_Digit.Caption := 'Розряд';
        DigitsViewStavka.Visible := False;
        Use_Digit := 1;
    end;
end;

procedure TSP_PBS_Add.RBTarifClick(Sender: TObject);
begin
    if RBTarif.Checked then
    begin
        DigitsView.DataController.DataSource := TarifSource;
        DigitsViewId_Jn_Post_Digits.DataBinding.FieldName := 'Id_Jn_Post_Tarif';
        DigitsViewId_Post_Base_Salary.DataBinding.FieldName := 'Id_Post_Base_Salary';
        DigitsViewNum_Digit.DataBinding.FieldName := 'Name_tarif';
        DigitsViewDate_Beg.DataBinding.FieldName := 'Date_Beg';
        DigitsViewDate_End.DataBinding.FieldName := 'Date_End';
        DigitsViewNum_Digit.Caption := 'Тариф';
        DigitsViewStavka.Visible := False;
        DigitsViewStavka.Caption := 'Ставка';
        Use_Digit := 2;
    end
end;

end.

