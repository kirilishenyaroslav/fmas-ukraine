{*******************************************************************************
* uHalfTimeMain                                                                *
*                                                                              *
* Главный модуль приказа о неполном рабочем дне                                *
* Copyright ©  2007, Олег Г. Волков, Донецкий национальный университет         *
*******************************************************************************}


unit uHalfTimeMain;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    THalfTimeSprav = class(TSprav)
    private
    public
        constructor Create;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uHalfTimeForm;

function CreateSprav: TSprav;
begin
    Result := THalfTimeSprav.Create;
end;

constructor THalfTimeSprav.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);
    Input.FieldDefs.Add('Note_Order', ftString, 255);
    Input.FieldDefs.Add('Num_Order', ftString, 10);


    Output.FieldDefs.Add('New_Id_Order', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

procedure THalfTimeSprav.Show;
var
    form: TfmHalfTimeOrderForm;
    hnd: Integer;
begin
    form := TfmHalfTimeOrderForm.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    form.Prepare(Input['Id_Order'], Input['Date_Order'], Input['Id_Order_Type'],
        Input['Num_Order'], Input['Note_Order'], TISC_DB_HANDLE(hnd));

    form.ShowModal;
    form.Free;
end;

end.

