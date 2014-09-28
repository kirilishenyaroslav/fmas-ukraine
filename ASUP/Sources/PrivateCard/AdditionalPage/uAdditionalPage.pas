{*******************************************************************************
* upcAdditionalPage                                                                  *
*                                                                              *
* Дополнительная информация личной карточки                                          *
* Copyright ©  2005, Тимофеев Антон, Донецкий Национальный Университет         *
*******************************************************************************}


unit uAdditionalPage;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase, uAdditionalPageData,
        uFormControl;

type
    TpcAdditionalPage = class(TSprav)
    private
        DM: TdmPCAdditionalPage;
    public
        constructor Create;
        destructor Destroy; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses Variants, SysUtils, uAdditionalPageFrame;

function CreateSprav: TSprav;
begin
    Result := TpcAdditionalPage.Create;
end;

constructor TpcAdditionalPage.Create;
begin
    inherited Create;

        // создание входных/выходных полей
    Input.FieldDefs.Add('Id_PCard', ftInteger);
    Input.FieldDefs.Add('Modify', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

destructor TpcAdditionalPage.Destroy;
begin
    DM.Free;
    inherited Destroy;
end;

function TpcAdditionalPage.GetFrame: TFrame;
var
    hnd: Integer;
  	Mode:TFormMode;
begin
    DM := TdmPCAdditionalPage.Create(Application.MainForm);
    hnd := Input['DBHandle'];
    DM.DB.Handle := TISC_DB_Handle(hnd);
    if (Input['Modify']=0) then
     Mode:=fmInfo
    else
     Mode:=fmModify;
    Result := TfmPCardAdditionalPage.Create(Application.MainForm, DM, Mode, Input['Id_PCard']);
end;

end.
