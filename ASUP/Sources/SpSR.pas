
{ -$Id: SpSR.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник штатных расписаний"                  }
{                  Работа со справочником штатных расписаний                   }
{                                                  ответственный: Олег Волков  }

unit SpSR;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, FormPlanShtat, SpCommon, PersonalCommon,
    uSearchFrame;

type
    TSpSRForm = class(TSpForm)
        FormPlanButton: TSpeedButton;
        MakeActiveButton: TSpeedButton;
        AcceptQuery: TIBQuery;
        procedure FormActivate(Sender: TObject);
        procedure SpGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure FormPlanButtonClick(Sender: TObject);
        procedure MakeActiveButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    SpSRForm: TSpSRForm;

implementation

uses Math;

{$R *.dfm}

procedure TSpSRForm.FormActivate(Sender: TObject);
begin
    inherited;
    FormPlanButton.Align := alLeft;
    MakeActiveButton.Align := alLeft;

    if not GPP then FormPlanButton.Caption := 'Прийняти проект';

    if CheckAccess('/ROOT/Plan_Shtat_Ras', 'Edit') <> 0 then
    begin
        Params.SpMode := Params.SpMode - [spfAdd, spfModify, spfDelete];
        AddButton.Visible := False;
        ModifyButton.Visible := False;
        DeleteButton.Visible := False;
        FormPlanButton.Visible := False;
        MakeActiveButton.Visible := False;
    end;
end;

procedure TSpSRForm.SpGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    inherited;
    with SpGrid.Canvas.Brush do
        if gdSelected in State then Color := clBlack
        else
            if (ResultQuery['Date_Beg'] < Now) and (ResultQuery['Date_End'] > Now) then
                Color := clWhite;
    SpGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TSpSRForm.FormPlanButtonClick(Sender: TObject);
var
    form: TFormPlanShtatRasForm;
begin
    if ResultQuery.IsEmpty then Exit;

    if not GPP then
    begin
        if MessageDlg('Ви справді бажаєте прийняти новий штатний розпис?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            AcceptQuery.Transaction := WriteTransaction;
            AcceptQuery.ParamByName('Id_SR').AsInteger := ResultQuery['Id_SR'];
            ExecQuery(AcceptQuery);
        end;
        Exit;
    end;

    form := TFormPlanShtatRasForm.Create(Self);
    form.OldNameEdit.Text := ResultQuery['Name'];
    form.OldDateBeg.Caption := DateToStr(ResultQuery['Date_Beg']);
    form.OldDateEnd.Caption := DateToStr(ResultQuery['Date_End']);
    form.FC_SR.Value := ResultQuery['Id_SR'];
    form.ShowModal;
    form.Free;
    Refresh;
end;

procedure TSpSRForm.MakeActiveButtonClick(Sender: TObject);
begin
    if not (spfModify in Params.SpMode) then Exit;

    if ResultQuery['Is_Plan'] <> 'Так' then
    begin
        MessageDlg('Затвердити можна тільки проект штатного розкладу!',
            mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Ви справді бажаєте затвердити вибраний штатний розклад?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Make_Active_Shtat ' +
        IntToStr(ResultQuery['Id_SR']);
    ExecQuery(WorkQuery);
    Refresh;
    ReadCurrSR;
end;

initialization
    RegisterClass(TSpSRForm);

end.
