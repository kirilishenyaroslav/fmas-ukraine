{*******************************************************************************
* uDepartmentsData                                                             *
*                                                                              *
* Модуль данных справочника подразделений                                      *
* Copyright ©  2002-2005, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uDepartmentsData;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    cxClasses, cxStyles, cxGridTableView, FIBQuery, pFIBQuery, frxClass,
    frxDBSet, frxDesgn, ExtCtrls, frxExportPDF, frxExportRTF, frxExportHTML,
    frxExportXLS, frxExportTXT, Controls;

type
    TdmDepartments = class(TDataModule)
        Database: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        SelectDepartments: TpFIBDataSet;
        MoveQuery: TpFIBQuery;
        GetRoot: TpFIBDataSet;
        DepTypesSelect: TpFIBDataSet;
        DepTypesSelectID_DEP_TYPE: TFIBIntegerField;
        DepTypesSelectNAME_DEP_TYPE: TFIBStringField;
        SelectDepartmentsID_DEPARTMENT: TFIBIntegerField;
        SelectDepartmentsID_PARENT: TFIBIntegerField;
        SelectDepartmentsNAME_SHORT: TFIBStringField;
        SelectDepartmentsDISPLAY_ORDER: TFIBIntegerField;
        SelectDepartmentsDISPLAY_ORDER2: TFIBIntegerField;
        SelectDepartmentsNAME_FULL: TFIBStringField;
        SelectDepartmentsPATH: TFIBStringField;
        SelectDepartmentsDEPARTMENT_CODE: TFIBStringField;
        SelectDepartmentsDISPLAY_NAME: TStringField;
        frxDesigner1: TfrxDesigner;
        DepartmentsDS: TfrxDBDataset;
        DepPropDS: TpFIBDataSet;
        DepPropDSID_PROPERTY: TFIBIntegerField;
        DepPropDSNAME_PROPERTY: TFIBStringField;
        DepPropDSDATE_BEG: TFIBDateField;
        DepPropDSDATE_END: TFIBDateField;
        DepPropDataSource: TDataSource;
        SpDepProp: TpFIBDataSet;
        DeleteProp: TpFIBQuery;
        SpDepPropID_PROPERTY: TFIBIntegerField;
        SpDepPropNAME_PROPERTY: TFIBStringField;
        Timer1: TTimer;
        SelectDepartmentsIs_Deleted: TIntegerField;
        SelectDepartmentsUse_End: TDateTimeField;
        RestoreQuery: TpFIBQuery;
        TeleportDepartment: TpFIBQuery;
        PrintProp: TpFIBDataSet;
    ReportDBSet: TfrxDBDataset;
    DepartmentsReport: TfrxReport;
        procedure SelectDepartmentsCalcFields(DataSet: TDataSet);
        procedure SelectDepartmentsAfterScroll(DataSet: TDataSet);
        procedure Timer1Timer(Sender: TObject);

    private
        { Private declarations }
    public
        InputActDate: TDate;
        procedure GetDepType(var Value: Variant; var DisplayText: string);
    end;

implementation

uses uSelectForm, Variants;

{$R *.dfm}

procedure TdmDepartments.GetDepType(var Value: Variant; var DisplayText: string);
begin
    if qSelect(DepTypesSelect) then
    begin
        Value := DepTypesSelect['Id_Dep_Type'];
        DisplayText := DepTypesSelect['Name_Dep_Type'];
    end;
end;

procedure TdmDepartments.SelectDepartmentsCalcFields(DataSet: TDataSet);
begin
    if SelectDepartments.IsEmpty then Exit;
    if Trim(SelectDepartments['Name_Short']) = '' then
        SelectDepartments['Display_Name'] := SelectDepartments['Name_Full']
    else SelectDepartments['Display_Name'] := SelectDepartments['Name_Full'] +
        '(' + SelectDepartments['Name_Short'] + ')';
    if SelectDepartments['Is_Deleted'] = 1 then
        SelectDepartments['Display_Name'] := SelectDepartments['Display_Name'] +
            ' [вилучено ' + DateToStr(SelectDepartments['Use_End']) + ']';
end;

procedure TdmDepartments.SelectDepartmentsAfterScroll(DataSet: TDataSet);
begin
    SelectDepartmentsCalcFields(DataSet);
    {    if not DataSet.IsEmpty then
        begin
            DepPropDS.Close;
            DepPropDS.ParamByName('Id_Department').AsInteger := DataSet['Id_Department'];
            DepPropDS.Open;
        end;}
end;

procedure TdmDepartments.Timer1Timer(Sender: TObject);
var
    id_prop: Variant;
begin
    if not SelectDepartments.IsEmpty then
    begin
        id_prop := Null;
        if not DepPropDS.IsEmpty then
            id_prop := DepPropDS['Id_Property'];

        DepPropDS.Close;
        DepPropDS.ParamByName('Id_Department').AsInteger :=
            SelectDepartments['Id_Department'];
        DepPropDS.Open;
        if not VarIsNull(id_prop) then
            DepPropDS.Locate('Id_Property', id_prop, [])
    end;
end;

end.

