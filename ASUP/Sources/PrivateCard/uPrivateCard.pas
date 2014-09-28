{*******************************************************************************
* uPrivateCard                                                                 *
*                                                                              *
* Загрузочный модуль личной карточки                                           *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uPrivateCard;

interface

uses    uCommonSp, DB, Forms, Dialogs, Controls, IBase;

type
    TPrivateCard = class(TSprav)
    public
          constructor Create;
          procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
 exports CreateSprav;

implementation

uses Variants, SysUtils, uPrivateCardForm;

function CreateSprav: TSprav;
begin
     Result := TPrivateCard.Create;
end;

constructor TPrivateCard.Create;
begin
     inherited Create;

     // создание входных/выходных полей
     Input.FieldDefs.Add('Id_PCard', ftVariant);
     Input.FieldDefs.Add('CreatePCard', ftInteger);
     Input.FieldDefs.Add('Modify', ftInteger);
     Input.FieldDefs.Add('Actual_Date', ftDate);
     Input.FieldDefs.Add('FIO', ftString, 255);
     Input.FieldDefs.Add('AdminMode', ftBoolean);

     Output.FieldDefs.Add('TN', ftInteger);
     // подготовить параметры
     PrepareMemoryDatasets;
end;

procedure TPrivateCard.Show;
var F:Boolean;
    I:Integer;
begin
    f:=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfmPrivateCard)
         then begin
                   if TfmPrivateCard(Application.MainForm.MDIChildren[i]).Id_Pcard=Input['Id_PCard']
                   then begin
                             f:=false;
                             Application.MainForm.MDIChildren[i].BringToFront;
                             Break;
                   end;
         end;
    end;

    if f then TfmPrivateCard.Create(Application.MainForm,
                          TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                          Input['Id_PCard'],
                          Input['CreatePCard'],
                          Input['Modify'],
                          Input['Actual_Date'],
                          Input['FIO'],
                          Input['AdminMode'],
                          Input['ShowStyle']);
end;

end.
