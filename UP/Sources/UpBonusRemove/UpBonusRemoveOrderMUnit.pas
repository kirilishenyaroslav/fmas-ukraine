unit UpBonusRemoveOrderMUnit;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs;

type
    TUP_RemoveBonusOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        function GetFrame:TFrame;override;
    end;

function CreateSprav: TSprav;stdcall;
 exports CreateSprav;

implementation

uses DB,  UpBonusRemoveMainForm;

function CreateSprav: TSprav;
begin
    Result := TUP_RemoveBonusOrder.Create;
end;

constructor TUP_RemoveBonusOrder.Create;
begin
    inherited Create;
    //ѕараметр по которому передаетс€ идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    //ѕараметр по которому передаетс€ идентификатор типа приказа
    Input.FieldDefs.Add('id_order_type', ftInteger);

    //ѕараметр по которому передаетс€ идентификатор пункта приказа дл€ редактировани€
    Input.FieldDefs.Add('id_item', ftInteger);

    //ѕараметр по которому передаетс€ идентификатор режим запуска модул€
    //0-добавление, 1-редактирование, 3-просмотр
    Input.FieldDefs.Add('mode', ftInteger);

    //ѕараметр по которому передаетс€ базовый номер пункта приказа дл€ добавлени
    Input.FieldDefs.Add('num_item', ftInteger);

    //ѕараметр по которому передаетс€ базовый номер под пункта приказа дл€ добавлени
    Input.FieldDefs.Add('num_sub_item', ftInteger);

    Input.FieldDefs.Add('outer_hwnd', ftInteger);

    PrepareMemoryDatasets;
end;

function TUP_RemoveBonusOrder.GetFrame: TFrame;
begin
     Result:=TFrame(TfrmRemoveBonus.Create(Application.MainForm,
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

procedure TUP_RemoveBonusOrder.Show;
begin
     with TfrmRemoveBonus.Create(Application.MainForm,
                               TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                               Input['ID_ORDER'],
                               Input['ID_ORDER_TYPE'],
                               Input['NUM_ITEM'],
                               Input['NUM_SUB_ITEM'],
                               Input['ID_ITEM'],
                               Input['MODE'],
                               true,0) do
     begin
          ShowModal;
          Free;
     end;
end;

end.
