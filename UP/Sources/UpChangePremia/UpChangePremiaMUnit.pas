unit UpChangePremiaMUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs, UpChangePremiaForm;

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
//var Print: TfmChagePremia;
begin
     with TfmChangePremia.Create(Application.MainForm,
                               TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                               Input['ID_ORDER']) do
     begin
          
          ShowModal;
          Free;
     end;
end;

end.
