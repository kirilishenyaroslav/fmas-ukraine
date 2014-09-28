unit SpWorkExc;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, AddExc, SpCommon, SpTimeUtils, DateUtils,
    uSearchFrame;

type
    TSpWorkExcForm = class(TSpForm)
        CopyButton: TSpeedButton;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure CopyButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Work_Mode: Integer;
    end;

var
    SpWorkExcForm: TSpWorkExcForm;

implementation

{$R *.dfm}

uses WorkModeCentral, SpWorkMode, uWorkExcCopy;

procedure TSpWorkExcForm.AddButtonClick(Sender: TObject);
var
    form: TAddExcForm;
begin
    form := TAddExcForm.Create(Self);
    form.Id_Work_Mode := Id_Work_Mode;
    form.Mode := emNew;
    if form.ShowModal = mrOk then
    begin
        Refresh;
        ResultQuery.Locate('Id_Work_Mode;Exc_Date', VarArrayOf([Id_Work_Mode,
            form.ExcDate.DateTime]), []);
    end;
    form.Free;
end;

procedure TSpWorkExcForm.ModifyButtonClick(Sender: TObject);
var
    form: TAddExcForm;
begin
    if ResultQuery.IsEmpty then Exit;

    form := TAddExcForm.Create(Self);
    form.Id_Work_Mode := Id_Work_Mode;
    form.Mode := emModify;

    form.ExcDate.DateTime := ResultQuery['Exc_Date'];
    form.ExcType.ItemIndex := ResultQuery['Exc_Type'] + 1;
    form.HoursEdit.Text := EncodeTimeString(ResultQuery['Hours'], False);
    form.ExcDate.Enabled := False;

    if form.ShowModal = mrOk then
    begin
        Refresh;
        ResultQuery.Locate('Id_Work_Mode;Exc_Date', VarArrayOf([Id_Work_Mode,
            form.ExcDate.DateTime]), []);
    end;
    form.Free;
end;

procedure TSpWorkExcForm.DeleteButtonClick(Sender: TObject);
begin
    if MessageDlg('Ви справді бажаєте вилучити цей запис?', mtConfirmation,
        [mbYes, mbNo], 0) = mrNo then Exit;

    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Work_Exc_Delete ' +
        IntToStr(Id_Work_Mode) + ',''' + DateToStr(ResultQuery['Exc_Date']) + ''',' + '0';
    ExecQuery(WorkQuery);
    Refresh;
    WorkModeCenter.ReLoad;
end;


procedure TSpWorkExcForm.CopyButtonClick(Sender: TObject);
var
    form: TfmCopyExc;
begin
    form := TfmCopyExc.Create(Self);
    form.TargetWorkMode.Prepare(Id_Work_Mode);
    if form.ShowModal = mrOk then
        RefreshButton.Click;
    form.Free;
end;

end.
