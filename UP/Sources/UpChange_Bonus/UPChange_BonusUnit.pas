unit UpChange_BonusUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs, UpChange_BonusForm;

type
    TUP_PrintOrder = class(TSprav)
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
    Result := TUP_PrintOrder.Create;
end;

constructor TUP_PrintOrder.Create;
begin
    inherited Create;
    //Параметр по которому передается идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    PrepareMemoryDatasets;
end;


procedure TUP_PrintOrder.Show;
//var Print: TfmChage_Bonus;
begin
     with TfmChange_Bonus.Create(Application.MainForm,
                               TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                               Input['ID_ORDER']) do
     begin
          
          ShowModal;
          Free;
     end;
end;

end.
