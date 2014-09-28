
{ -$Id: SpWorkMode.pas,v 1.7 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник режимов работы"                      }
{                     Работа со справочником режимов работы                    }
{                                                  ответственный: Олег Волков  }

unit SpWorkMode;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, Buttons,
    StdCtrls, ExtCtrls, WorkReg, Buffer, PersonalCommon, SpCommon,
    SpWorkExc, uSearchFrame;

type
    TSpWorkModeForm = class(TSpForm)
        BufQuery: TIBQuery;
        WorkRegButton: TSpeedButton;
        ResultQueryID_WORK_MODE: TIntegerField;
        ResultQueryNOMER: TIntegerField;
        ResultQueryNAME: TIBStringField;
        ResultQueryNAME_SHORT: TIBStringField;
        ResultQueryNIGHT_BEG: TTimeField;
        ResultQueryNIGHT_END: TTimeField;
        ExcButton: TSpeedButton;
        ResultQueryIS_SMENA: TIBStringField;
        procedure DeleteButtonClick(Sender: TObject);
        procedure WorkRegButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ExcButtonClick(Sender: TObject);
        procedure ResultQueryIS_SMENAGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
    private
    { Private declarations }
    public
     { Public declarations }
    end;

var
    SpWorkModeForm: TSpWorkModeForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TSpWorkModeForm.DeleteButtonClick(Sender: TObject);
var
    First_PBKey, Last_PBKey: Integer;
    BufTran2: TBufferTransaction2;
begin
    if not GPP_Check then Exit;

    if ResultQuery.IsEmpty then Exit;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' +
        ResultQuery['Name'] + '"?', mtConfirmation,
        [mbYes, mbNo], 0) = mrNo) then Exit;

    BufTran2 := nil;
    try
        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;
          // удаление из базы
        WorkQuery.Transaction := WriteTransaction;
        with WorkQuery do
        begin
            Close;
            SQL.Text := 'EXECUTE PROCEDURE Dt_Work_Mode_Delete ' +
                IntToStr(ResultQuery['Id_Work_Mode']);
            ExecQuery(WorkQuery);
        end;

        if not DontWriteToDbf then
        begin
            BufQuery.Transaction := WriteTransaction;
            BufQuery.Close;
            BufQuery.ParamByName('Id_Work_Mode').AsInteger := ResultQuery['Id_Work_Mode'];
            BufQuery.Open;

            First_PBKey := BufQuery['First_PBKey'];
            Last_PBKey := BufQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('SP_TIME,DT_TIME', 'BUFF_SP_TIME,BUFF_DT_TIME', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            ShowError(e);
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;
        end;
    end;
    if BufTran2 <> nil then BufTran2.Free;
    Refresh;
end;

procedure TSpWorkModeForm.WorkRegButtonClick(Sender: TObject);
var
    Params: TSpParams;
    form: TWorkRegForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        IdField := 'Id_Day_Week';
        SpFields := 'Work_Beg, Work_End, Break_Beg, Break_End';
        ColumnNames := 'День, Початок роботи, Кінець роботи, Початок перерви, Кінець перерви,-,-';
        SelectProcName := 'Dt_WorkReg_Select(:Id_Work_Mode)';
        DontHideFirstColumn := True;
        Title := 'Розшифровка режимів праці';
    end;

    if not ResultQuery.IsEmpty then
    begin
        form := TWorkRegForm.Create(Self);
        form.Init(Params);
        form.WorkModeBox.Prepare(ResultQuery['Id_Work_Mode']);
        form.Night_Beg := ResultQuery['Night_Beg'];
        form.Night_End := ResultQuery['Night_End'];
        form.ShowModal;
        form.Free;
    end;
end;


procedure TSpWorkModeForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

procedure TSpWorkModeForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

procedure TSpWorkModeForm.ExcButtonClick(Sender: TObject);
var
    form: TSpWorkExcForm;
    Params: TSpParams;
begin
    form := TSpWorkExcForm.Create(Self);
    Params := TSpParams.Create;
    with Params do
    begin
        Title := 'Винятки режиму праці «' + ResultQuery['Name'] + '»';
        IdField := 'Exc_Date';
        SpFields := 'Type_Char,Exc_Type,Hours';
        ColumnNames := 'Дата,-,Тип,Час';
        SelectProcName := 'Work_Exc_Select_2(' + IntToStr(ResultQuery['Id_Work_Mode']) + ')';
    end;
    form.Init(Params);
    form.Id_Work_Mode := ResultQuery['Id_Work_Mode'];
    form.ShowModal;
    form.Free;
end;

procedure TSpWorkModeForm.ResultQueryIS_SMENAGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ResultQuery['Is_Smena'] = 'T' then Text := 'Так'
    else Text := 'Ні';
end;

initialization
    RegisterClass(TSpWorkModeForm);

end.
