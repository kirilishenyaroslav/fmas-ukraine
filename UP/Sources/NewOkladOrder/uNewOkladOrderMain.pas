unit uNewOkladOrderMain;

interface

uses uCommonSp, Forms;

type
    TNewOkladOrder = class(TSprav)
    public
        constructor Create;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses DB, uNewOkladForm;

function CreateSprav: TSprav; stdcall;
begin
    Result := TNewOkladOrder.Create;
end;

constructor TNewOkladOrder.Create;
begin
    inherited Create;

         // создание входных/выходных полей
    Input.FieldDefs.Add('mode', ftInteger);
    Input.FieldDefs.Add('Id_order', ftVariant);
    Input.FieldDefs.Add('Id_Item', ftVariant);
    Input.FieldDefs.Add('Id_order_type', ftVariant);
    Input.FieldDefs.Add('num_item', ftVariant);
    Input.FieldDefs.Add('num_sub_item', ftVariant);
    Input.FieldDefs.Add('outer_hwnd', ftInteger);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

function TNewOkladOrder.GetFrame: TFrame;
begin
    Result := TFrame(TfmNewOklad.Create(Application.MainForm, Input));
end;

end.

