
{ -$Id: TarDigits.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Разряды тарифных сеток"                         }
{       Отображение списка разрядов тарифной сетки и их коэффициентов          }
{                                                  ответственный: Олег Волков  }

unit TarDigits;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, ComCtrls,
    Buttons, ToolWin, Grids, DBGrids, SpComboBox, AddTarDigit, EditControl,
    PersonalCommon, SpCommon, uSearchFrame;

type
    TSpTarDigitsForm = class(TSpForm)
        ResultQueryNUM_DIGIT: TIntegerField;
        ResultQueryKOEFICIENT: TIBBCDField;
        ResultQuerySTAVKA: TIBBCDField;
        Panel1: TPanel;
        TarNetLabel: TLabel;
        TarNetBox: TSpComboBox;
        ResultQueryNAME_TAR_NET: TIBStringField;
        ResultQueryCOMMENT: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ShowChangeForm(Mode: TEditMode);
        procedure TarNetBoxChange(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure TarNetBoxEnter(Sender: TObject);
    private
        Tar_Net: Integer;
    public
        procedure Prepare(Id_Tar_Net: Integer);
    end;

var
    SpTarDigitsForm: TSpTarDigitsForm;
    LastTarNet: Integer;

implementation

{$R *.DFM}

procedure TSpTarDigitsForm.Prepare(Id_Tar_Net: Integer);
begin
    Tar_Net := Id_Tar_Net;
    TarNetBox.Prepare(Id_Tar_Net, '');
    ResultQuery.Params.ParamValues['Id_Tar_Net'] := Tar_Net;
    Refresh;
end;

procedure TSpTarDigitsForm.TarNetBoxChange(Sender: TObject);
begin
    if (ResultQuery <> nil) and (ResultQuery.Transaction <> nil)
        and (TarNetBox.ItemIndex > 0) then
    begin
        Tar_Net := TarNetBox.GetId;
        ResultQuery.Params.ParamValues['Id_Tar_Net'] := Tar_Net;
        Refresh;
    end;
end;

procedure TSpTarDigitsForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddTarDigitForm;
    id: Integer;
begin
    if Tar_Net = 0 then
    begin
        MessageDlg('Треба вибрати тарифну сітку!', mtError, [mbOk], 0);
        Exit;
    end;
    if ResultQuery.IsEmpty and (Mode = emModify) then
    begin
        MessageDlg('Нема чого змінювати - пустий довідник',
            mtError, [mbOk], 0);
        Exit;
    end;

    form := TAddTarDigitForm.Create(Self);

    if Mode = emModify then id := ResultQuery['Num_Digit']
    else id := -1;

    form.Prepare(Tar_Net, id, Mode);

    if form.ShowModal = mrOk then Refresh;
    form.Free;
end;

procedure TSpTarDigitsForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emNew);
end;

procedure TSpTarDigitsForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emModify);
end;

procedure TSpTarDigitsForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    if ResultQuery.IsEmpty then
    begin
        MessageDlg('Нема чого вилучати - пустий довідник',
            mtError, [mbOk], 0);
        Exit;
    end;

    if ResultQuery['Num_Digit'] = 1 then
    begin
        MessageDlg('Неможливо вилучити перший розряд', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити цей розряд?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Tar_Nets_Delete ' +
        IntToStr(ResultQuery['Num_Digit']) + ',' + IntToStr(Tar_Net);
    ExecQuery(WorkQuery);
    Refresh;
end;

procedure TSpTarDigitsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    inherited;
    TarNetBox.SaveIntoRegistry;
    LastTarNet := ResultQuery.Params.ParamValues['Id_Tar_Net'];
end;

procedure TSpTarDigitsForm.FormActivate(Sender: TObject);
begin

    SpGrid.SetFocus;
end;

procedure TSpTarDigitsForm.FormCreate(Sender: TObject);
begin
    inherited;
    TarNetBox.ItemIndex := -1;
end;

procedure TSpTarDigitsForm.TarNetBoxEnter(Sender: TObject);
begin
    if spfCantRemoveFilter in Params.SpMode then SpGrid.SetFocus;
end;

initialization
    RegisterClass(TSpTarDigitsForm);

end.
