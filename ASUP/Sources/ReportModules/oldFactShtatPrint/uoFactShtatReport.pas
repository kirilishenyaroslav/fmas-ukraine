{*******************************************************************************
* uoFactShtatReport                                                            *
*                                                                              *
* Печать фактического штатного (старая)                                        *
* Copyright ©  2006, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uoFactShtatReport;

interface

uses uCommonSp, DB, Forms, Dialogs, Controls, IBase, IBDatabase, IBQuery;

type
    ToFactShtatReport = class(TSprav)
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;

    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

var
    DB: TIBDatabase;
    ReadTransaction: TIBTransaction;
    DepNameQuery: TIBQuery;
    Version: Integer;
    ProgramPath: String;
    sDesignReport: Boolean;

implementation

uses Variants, SysUtils, RealShtatReportUnit, RealShtatReport3Unit;

function CreateSprav: TSprav;
begin
    Result := ToFactShtatReport.Create;
end;

constructor ToFactShtatReport.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('DesignReport', ftBoolean);
    Input.FieldDefs.Add('Version', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor ToFactShtatReport.Destroy;
begin
    DepNameQuery.Free;
    ReadTransaction.Free;
    DB.Free;
    inherited Destroy;
end;

procedure ToFactShtatReport.Show;
var
    Form: TRealShtatReportForm;
    Form3: TRealShtatReport3Form;
    hnd: Integer;
begin
        // создать базу и транзакции
    DB := TIBDatabase.Create(nil);
    ReadTransaction := TIBTransaction.Create(DB);
    ReadTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := ReadTransaction;
    DB.SQLDialect := 3;
    hnd := Input['DBHandle'];
    DB.SetHandle(Pointer(hnd));

    DepNameQuery := TIBQuery.Create(DB);
    DepNameQuery.Database := DB;
    DepNameQuery.Transaction := ReadTransaction;
    DepNameQuery.SQL.Text := 'SELECT C.Local_Department, D.Name_Full, C.Firm_Name'+
        ', C.Hidden_Id_Post FROM Sp_Department D INNER JOIN Ini_Asup_Consts C' +
        ' ON D.Id_Department = C.Local_Department AND CURRENT_TIMESTAMP BETWEEN D.Use_Beg AND D.Use_End';
    DepNameQuery.Open;

    Version := Input['Version'];

    ProgramPath := ExtractFilePath(Application.ExeName);
    if ProgramPath = Application.ExeName then
        ProgramPath := '';

    sDesignReport := Input['DesignReport'];


    if (Version = 1) {and Test} then
    begin
        Form3 := TRealShtatReport3Form.Create(Application.MainForm);
        Form3.ShowModal;
        Form3.Free;
    end
    else
    begin
        Form := TRealShtatReportForm.Create(Application.MainForm);
        Form.ShowModal;
        Form.Free;
    end;
end;

end.

