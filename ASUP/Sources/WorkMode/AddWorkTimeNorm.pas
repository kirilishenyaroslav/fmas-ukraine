
{ -$Id: AddWorkTimeNorm.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Ввод нормы рабочего времени"                     }
{          Ввод нормы рабочего времени для данного месяца и года               }
{                                                  ответственный: Олег Волков  }

unit AddWorkTimeNorm;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Mask, CheckEditUnit, Db, IBCustomDataSet, IBQuery,
    FieldControl, EditControl, PersonalCommon, SpCommon, Variants, DateUtils;

type
    TAddWorkTimeForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        YearLabel: TLabel;
        MonthLabel: TLabel;
        Kol_HoursLabel: TLabel;
        YearBox: TComboBox;
        MonthBox: TComboBox;
        KolHoursEdit: TCheckEdit;
        DetailsQuery: TIBQuery;
        DetailsQueryWTYEAR: TIntegerField;
        DetailsQueryWTMONTH: TIntegerField;
        DetailsQueryKOL_HOURS: TIBBCDField;
        FC_Year: TFieldControl;
        FC_Month: TFieldControl;
        FC_KolHours: TFieldControl;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FC_YearGet(Sender: TObject);
        procedure FC_YearShow(Sender: TObject);
        procedure MonthBoxChange(Sender: TObject);

    private
        FormControl: TEditControl;
        Mode: TEditMode;
    public
        procedure Prepare(Year, Month: Integer; Mode: TEditMode);
    end;

var
    AddWorkTimeForm: TAddWorkTimeForm;

implementation

{$R *.DFM}

procedure TAddWorkTimeForm.Prepare(Year, Month: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати норму робочого часу'
    else Caption := 'Змінити норму робочого часу';

    if Mode = emModify then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['wtYear'] := Year;
            Params.ParamValues['wtMonth'] := Month;
            Open;
        end;
    FormControl.Prepare(Mode);
    YearBox.TabStop := (Mode <> emModify);
    MonthBox.TabStop := (Mode <> emModify);
end;

procedure TAddWorkTimeForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
    FormControl.Free;
end;

procedure TAddWorkTimeForm.FormActivate(Sender: TObject);
begin
    if YearBox.TabStop then YearBox.SetFocus
    else KolHoursEdit.SetFocus;

    if Mode = emNew then
        YearBox.ItemIndex := YearOf(Date) - 2003;
end;

procedure TAddWorkTimeForm.FormCreate(Sender: TObject);
begin
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Year, FC_Month, FC_KolHours]);
end;

procedure TAddWorkTimeForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
        if Mode = emNew then
            FormControl.ExecProc('dt_WorkTimeNorm_Insert', [])
        else FormControl.ExecProc('dt_WorkTimeNorm_Update', [])
    else ModalResult := 0;
end;

procedure TAddWorkTimeForm.FC_YearGet(Sender: TObject);
begin
    FC_Year.Value := StrToInt(YearBox.Text);
end;

procedure TAddWorkTimeForm.FC_YearShow(Sender: TObject);
begin
    if VarIsNull(FC_Year.Value) then YearBox.ItemIndex := 0
    else YearBox.ItemIndex := FC_Year.Value - StrToInt(YearBox.Items[0]);
end;

procedure TAddWorkTimeForm.MonthBoxChange(Sender: TObject);
begin
    if (Sender as TWinControl).TabStop = False then
    begin
        MessageDlg('Можно змінювати лише норму рабочого часу',
            mtWarning, [mbOk], 0);
        KolHoursEdit.SetFocus;
    end;
end;

end.
