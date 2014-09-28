unit UpPremiaFOrderMUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs;

type
    TUP_PrintOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        function GetFrame:TFrame; override;
    end;

function CreateSprav: TSprav;stdcall;
 exports CreateSprav;

implementation

uses DB, UpPremiaFOrderForm;

function CreateSprav: TSprav;
begin
    Result := TUP_PrintOrder.Create;
end;

constructor TUP_PrintOrder.Create;
begin
    inherited Create;
    //Параметр по которому передается идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    //Параметр по которому передается идентификатор типа приказа
    Input.FieldDefs.Add('id_order_type', ftInteger);

    //Параметр по которому передается идентификатор пункта приказа для редактирования
    Input.FieldDefs.Add('id_item', ftInteger);

    //Параметр по которому передается идентификатор режим запуска модуля
    //0-добавление, 1-редактирование, 3-просмотр
    Input.FieldDefs.Add('mode', ftInteger);

    //Параметр по которому передается базовый номер пункта приказа для добавлени
    Input.FieldDefs.Add('num_item', ftInteger);

    //Параметр по которому передается базовый номер под пункта приказа для добавлени
    Input.FieldDefs.Add('num_sub_item', ftInteger);

    //Взаимосвязь с главным окном
    Input.FieldDefs.Add('outer_hwnd', ftInteger);

    //Параметры специфичные для типа приказа
    Input.FieldDefs.Add('ViewKeySession'   ,ftLargeint);
    Input.FieldDefs.Add('only_save_in_buff',ftInteger);
    Input.FieldDefs.Add('linkto'           ,ftInteger);
    PrepareMemoryDatasets;
end;

function TUP_PrintOrder.GetFrame: TFrame;
begin
     Result:=TFrame(TfmPremiaOrder.Create(Application.MainForm,
                                         TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                         Input['ID_ORDER'],
                                         Input['ID_ORDER_TYPE'],
                                         Input['NUM_ITEM'],
                                         Input['NUM_SUB_ITEM'],
                                         Input['ONLY_SAVE_IN_BUFF'],
                                         Input['LINKTO'],
                                         Input['ID_ITEM'],
                                         Input['MODE'],
                                         Input['ViewKeySession'],
                                         true,
                                         Input['outer_hwnd']));
end;

procedure TUP_PrintOrder.Show;
begin
     with TfmPremiaOrder.Create(Application.MainForm,
                               TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                               Input['ID_ORDER'],
                               Input['ID_ORDER_TYPE'],
                               Input['NUM_ITEM'],
                               Input['NUM_SUB_ITEM'],
                               Input['ONLY_SAVE_IN_BUFF'],
                               Input['LINKTO'],
                               Input['ID_ITEM'],
                               Input['MODE'],
                               Input['ViewKeySession'],
                               false,0) do
     begin
          IdRaise.Visible:=False;
          ShowModal;
          Free;
     end;
end;

end.
