Unit UpGetHolidayMUnit;

Interface

Uses uCommonSp, Forms, Ibase, Variants, Dialogs, Classes;

Type
    TUP_PrintOrder = Class(TSprav)
    public
        Constructor Create;
        Procedure Show; override;
        Function GetFrame: TFrame; override;
    End;

Function CreateSprav: TSprav; stdcall;
Exports CreateSprav;

Implementation

Uses DB, UpGetHolidayForm;

Function CreateSprav: TSprav;
Begin
    Result := TUP_PrintOrder.Create;
End;

Constructor TUP_PrintOrder.Create;
Begin
    Inherited Create;

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
End;

Function TUP_PrintOrder.GetFrame: TFrame;
Begin
    Result := TFrame(TfmGetHolidayOrder.Create(Application.MainForm,
        TISC_DB_HANDLE(Integer(Input['DBHandle'])),
        Input['ID_ORDER'],
        Input['ID_ORDER_TYPE'],
        Input['NUM_ITEM'],
        Input['NUM_SUB_ITEM'],
        Input['ID_ITEM'],
        Input['MODE'],
        true,
        Input['outer_hwnd']));
End;

Procedure TUP_PrintOrder.Show;
Begin
    With TfmGetHolidayOrder.Create(Application.MainForm,
        TISC_DB_HANDLE(Integer(Input['DBHandle'])),
        Input['ID_ORDER'],
        Input['ID_ORDER_TYPE'],
        Input['NUM_ITEM'],
        Input['NUM_SUB_ITEM'],
        Input['ID_ITEM'],
        Input['MODE'],
        false,
        0) Do
    Begin
        ShowModal;
        Free;
    End;
End;

End.
