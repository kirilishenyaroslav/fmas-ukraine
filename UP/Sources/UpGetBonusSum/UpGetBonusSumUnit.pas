unit UpGetBonusSumUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs, UpGetBonusSumForm;

type
    TUP_ChangeBonusInterface = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
 exports CreateSprav;

implementation

uses DB;

function CreateSprav: TSprav;
begin
    Result := TUP_ChangeBonusInterface.Create;
end;

constructor TUP_ChangeBonusInterface.Create;
begin
    inherited Create;
    //Параметр по которому передается идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    PrepareMemoryDatasets;
end;


procedure TUP_ChangeBonusInterface.Show;
//var Print: TfmChagePremia;
begin
     with TfmChangeBonus.Create(Application.MainForm,
                               TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                               Input['ID_ORDER']) do
     begin
          
          ShowModal;
          Free;
     end;
end;

end.
