
{ -$Id: SpTarNetUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Справочник тарифных сеток"                       }
{                   Работа со справочником тарифных сеток                      }
{                                                  ответственный: Олег Волков  }

unit SpTarNetUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, ComCtrls,
    Buttons, ToolWin, Grids, DBGrids, EditControl, PersonalCommon, TarDigits,
    SpCommon, SpComboBox, uSearchFrame;

type
    TSpTarNetForm = class(TSpForm)
        DigitsButton: TSpeedButton;
        Panel2: TPanel;
        SRLabel1: TLabel;
        TarPlanBox: TSpComboBox;
        ActualBox: TCheckBox;
        ResultQueryID_TAR_NET: TIntegerField;
        ResultQueryNAME_TAR_NET: TIBStringField;
        ResultQueryFIRST_DIGIT: TIBBCDField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ShowChangeForm(Mode: TEditMode);
        procedure DigitsButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ActualBoxClick(Sender: TObject);
        procedure TarPlanBoxChange(Sender: TObject);
        procedure TarPlanBoxEnter(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        Actual: Boolean;
    public
        Id_Tar_Plan: Integer;
    end;

var
    SpTarNetForm: TSpTarNetForm;

implementation

{$R *.DFM}

uses AddTarNet;

procedure TSpTarNetForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddTarNetForm;
    id: Integer;
begin
    form := TAddTarNetForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_Tar_Net']
    else id := -1;
    form.Prepare(id, Mode);
    form.Id_Tar_Plan := Id_Tar_Plan;
    if form.ShowModal = mrOk then
    begin
        Refresh;
        ResultQuery.Locate('Id_Tar_Net', form.Id_Tar_Net, [])
    end;
    form.Free;
end;

procedure TSpTarNetForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    ShowChangeForm(emNew);
end;

procedure TSpTarNetForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    if not ResultQuery.IsEmpty then
        ShowChangeForm(emModify);
end;

procedure TSpTarNetForm.DigitsButtonClick(Sender: TObject);
var
    Params: TSpParams;
    form: TSpTarDigitsForm;
begin
    if ResultQuery.IsEmpty then
    begin
        MessageDlg('Нема сітки для прогляду розрядів', mtError, [mbOk], 0);
        Exit;
    end;
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Tar_Nets';
        IdField := 'Num_Digit';
        SpFields := 'Num_Digit';
        ComboField := 'Num_Digit';
        ColumnNames := 'Розряд,Коментар,Коефіцієнт,Ставка';
        Title := 'Розряди тарифних сіток';
    end;
    form := TSpTarDigitsForm.Create(Self);
    form.Init(Params);
    form.Prepare(ResultQuery['Id_Tar_Net']);
    form.ShowModal;
end;

procedure TSpTarNetForm.FormActivate(Sender: TObject);
begin
    inherited;
    DigitsButton.Align := alLeft;
    Actual := False;
    ActualBox.Checked := True;
    TarPlanBox.Prepare(Curr_Tar_Plan);
end;

procedure TSpTarNetForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    inherited;
end;

procedure TSpTarNetForm.ActualBoxClick(Sender: TObject);
var
    actualSQL: string;
    p: Integer;
begin
    if (ResultQuery = nil) or (ResultQuery.Transaction = nil) or
        (ResultQuery.SQl.Text = '') then Exit;

    actualSQL := 'WHERE CURRENT_DATE BETWEEN Date_Beg AND Date_End';


    if ActualBox.Checked and not Actual then
    begin
        ResultQuery.SQL.Text := ResultQuery.SQL.Text + #13#10 + actualSQL;
        Actual := True;
        Refresh;
    end;

    if not ActualBox.Checked and Actual then
    begin
        p := Pos(actualSQL, ResultQuery.SQL.Text);
        ResultQuery.SQL.Text := Copy(ResultQuery.SQL.Text, 1, p - 1);
        Actual := False;
        Refresh;
    end;
end;

procedure TSpTarNetForm.TarPlanBoxChange(Sender: TObject);
begin
    inherited;
    if (ResultQuery <> nil) and (ResultQuery.Transaction <> nil) then
    begin
        ResultQuery.Close;
        Id_Tar_Plan := TarPlanBox.GetId;
        ResultQuery.SQL.Text := 'SELECT * FROM Sp_Tar_Net_Select_2(' +
            IntToStr(Id_Tar_Plan) + ')';
        ResultQuery.Open;
        GridResize(SpGrid);
    end;
end;

procedure TSpTarNetForm.TarPlanBoxEnter(Sender: TObject);
begin
    if spfCantRemoveFilter in Params.SpMode then
        SpGrid.SetFocus;
end;


procedure TSpTarNetForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    inherited;
    TarPlanBox.SaveIntoRegistry;
end;

initialization
    RegisterClass(TSpTarNetForm);

end.
