{*******************************************************************************
* upcMainPage                                                                  *
*                                                                              *
* Основная информация личной карточки                                          *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uMainInfo;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase, uMainInfoData,
        uFormControl;

type
    TpcMainPage = class(TSprav)
    private
        DM: TdmPCMainInfo;
    public
        constructor Create;
        destructor Destroy; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uMainInfoFrame;

function CreateSprav: TSprav;
begin
    Result := TpcMainPage.Create;
end;

constructor TpcMainPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TpcMainPage.Destroy;
begin
    DM.Free;
    inherited Destroy;
end;

function TpcMainPage.GetFrame: TFrame;
var
    hnd: Integer;
  	Mode:TFormMode;
begin
    DM := TdmPCMainInfo.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    if (Input['Modify']=0) then
     Mode:=fmInfo
    else
     Mode:=fmModify;
    Result := TfmPCardMainInfo.Create(Application.MainForm, DM, Mode, Input['Id_PCard']);
end;

end.
