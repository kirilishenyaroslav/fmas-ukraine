
{ -$Id: AddTarNet.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление тарифной сетки"                      }
{                 Добавление и изменение тарифной сетки                        }
{                                                  ответственный: Олег Волков  }

unit AddTarNet;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, Mask, CheckEditUnit,
    FieldControl, EditControl, PersonalCommon, SpCommon, ComCtrls, DateUtils;

type
    TAddTarNetForm = class(TForm)
        DetailsQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DetailsQueryNAME_TAR_NET: TIBStringField;
        DetailsQueryFIRST_DIGIT: TIBBCDField;
        NameLabel: TLabel;
        FirstDigitLabel: TLabel;
        NameEdit: TCheckEdit;
        FirstDigitEdit: TCheckEdit;
        FC_Name: TFieldControl;
        FC_FirstDigit: TFieldControl;
        Label1: TLabel;
        Label2: TLabel;
        DateBegPicker: TDateTimePicker;
        FC_DateBeg: TFieldControl;
        Label3: TLabel;
        DateEndPicker: TDateTimePicker;
        FC_DateEnd: TFieldControl;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Tar_Plan: Integer;
        Id_Tar_Net: Integer;

        procedure Prepare(id: Integer; Mode: TEditMode);
    end;

var
    AddTarNetForm: TAddTarNetForm;

implementation

{$R *.DFM}

procedure TAddTarNetForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати тарифну сітку'
    else Caption := 'Змінити тарифну сітку';

    if Mode = emModify then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Tar_Net'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
    if Mode = emNew then
    begin
        DateBegPicker.DateTime := EncodeDate(YearOf(Date), 1, 1);
        DateEndPicker.DateTime := EncodeDate(2050, 12, 31);
    end;
    FC_FirstDigit.Value := FC_FirstDigit.Value * 100;
    FC_FirstDigit.Show;

    Id_Tar_Net := Id;
end;

procedure TAddTarNetForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddTarNetForm.FormActivate(Sender: TObject);
begin
    NameEdit.SetFocus;
end;

procedure TAddTarNetForm.FormCreate(Sender: TObject);
begin
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name, FC_FirstDigit, FC_DateBeg, FC_DateEnd]);
end;

procedure TAddTarNetForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FC_DateBeg.Value >= FC_DateEnd.Value then
    begin
        MessageDlg('Невірний період функціонування!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;

    if FormControl.CheckFill then
    begin
        FC_FirstDigit.Value := FC_FirstDigit.Value / 100;
        if Mode = emNew then
        begin
            FormControl.ExecProc('Sp_Tar_Net_Insert', [Id_Tar_Plan], True);
            Id_Tar_Net := LastId;
        end
        else FormControl.ExecProc('Sp_Tar_Net_Update',
                [DetailsQuery.Params.ParamValues['Id_Tar_Net']])
    end
    else ModalResult := 0;
end;

end.
