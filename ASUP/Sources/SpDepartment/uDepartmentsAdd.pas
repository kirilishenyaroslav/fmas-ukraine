{*******************************************************************************
* uDepartmentsAdd                                                              *
*                                                                              *
* Добавление подразделения                                                     *
* Copyright ©  2002-2005, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uDepartmentsAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uDateControl, uSpravControl, uFControl, uLabeledFControl,
    uCharControl, ExtCtrls, StdCtrls, Buttons, uLogicCheck, uSimpleCheck,
    uFormControl, ActnList, uDepartmentsData;

type
    TfmDepartmentAdd = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        MainPanel: TPanel;
        NameFull: TqFCharControl;
        NameShort: TqFCharControl;
        DepType: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        qFSimpleCheck1: TqFSimpleCheck;
        ActionList1: TActionList;
        Accept: TAction;
        CancelAction: TAction;
        FormControl: TqFFormControl;
        Department_Code: TqFCharControl;
    Name_Full_Rus: TqFCharControl;
    Name_Full_Eng: TqFCharControl;
        procedure CancelActionExecute(Sender: TObject);
        procedure AcceptExecute(Sender: TObject);
        procedure DepTypeOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormActivate(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    private
        { Private declarations }
    public
        DM: TdmDepartments;
    end;

var
    fmDepartmentAdd: TfmDepartmentAdd;

implementation

uses uDepartmentsConsts;

{$R *.dfm}

procedure TfmDepartmentAdd.CancelActionExecute(Sender: TObject);
begin
    Exit;
end;

procedure TfmDepartmentAdd.AcceptExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmDepartmentAdd.DepTypeOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetDepType(Value, DisplayText);
end;

procedure TfmDepartmentAdd.FormActivate(Sender: TObject);
begin
    NameFull.ShowFocus;
end;

procedure TfmDepartmentAdd.FormControlNewRecordAfterPrepare(
    Sender: TObject);
begin
    DM.DepTypesSelect.Close;
    DM.DepTypesSelect.Open;
    DM.DepTypesSelect.Locate('Id_Dep_Type', DefaultDepType, []);
    DepType.Value := DM.DepTypesSelect['Id_Dep_Type'];
    DepType.DisplayText := DM.DepTypesSelect['Name_Dep_Type'];
end;

initialization
    RegisterClass(TfmDepartmentAdd);

end.
