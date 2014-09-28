unit UpPochasChangeOrderMUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs;

type
    TUP_PochasChangeOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses DB, UpPochasChangeMain;

function CreateSprav: TSprav;
begin
    Result := TUP_PochasChangeOrder.Create;
end;

constructor TUP_PochasChangeOrder.Create;
begin
    inherited Create;
    //Параметр по которому передается идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    //Параметр по которому передается идентификатор типа приказа
    Input.FieldDefs.Add('id_order_type', ftInteger);

    //Параметр по которому передается идентификатор пункта приказа для редактирования
    Input.FieldDefs.Add('id_item', ftInteger);

    //Параметр по которому передается идентификатор режим запуска модуля
    //0-добавление, 1-редактирование, 2-просмотр
    Input.FieldDefs.Add('mode', ftInteger);

    //Параметр по которому передается базовый номер пункта приказа для добавлени
    Input.FieldDefs.Add('num_item', ftInteger);

    //Параметр по которому передается базовый номер под пункта приказа для добавлени
    Input.FieldDefs.Add('num_sub_item', ftInteger);

    //Взаимосвязь с главным окном
    Input.FieldDefs.Add('outer_hwnd', ftInteger);

    PrepareMemoryDatasets;
end;

function TUP_PochasChangeOrder.GetFrame: TFrame;
begin
    Result := TFrame(TFormPochasChangeMain.Create(Application.MainForm,
        TISC_DB_HANDLE(Integer(Input['DBHandle'])),
        Input['ID_ORDER'],
        Input['ID_ORDER_TYPE'],
        Input['NUM_ITEM'],
        Input['NUM_SUB_ITEM'],
        Input['ID_ITEM'],
        Input['MODE'],
        true,
        Input['outer_hwnd']));
end;

procedure TUP_PochasChangeOrder.Show;
begin
    with TFormPochasChangeMain.Create(Application.MainForm,
        TISC_DB_HANDLE(Integer(Input['DBHandle'])),
        Input['ID_ORDER'],
        Input['ID_ORDER_TYPE'],
        Input['NUM_ITEM'],
        Input['NUM_SUB_ITEM'],
        Input['ID_ITEM'],
        Input['MODE'],
        false, 0) do
    begin
        ShowModal;
        Free;
    end;
end;

end.
