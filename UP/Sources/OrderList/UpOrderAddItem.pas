unit UpOrderAddItem;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, FIBDataSet, pFIBDataSet, ActnList, uMemoControl, StdCtrls,
    Buttons, uFormControl, uInvisControl, uCharControl, uIntControl, qFTools,
    uFControl, uLabeledFControl, uSpravControl, ExtCtrls, AccMgmt;

type
    TUpOrderAddItemForm = class(TForm)
        TopPanel: TPanel;
        ItemType: TqFSpravControl;
        qFIC_NumItem: TqFIntControl;
        qFIC_NumSubItem: TqFIntControl;
        ActionList: TActionList;
        Cancel: TAction;
        Ok: TAction;
        pFIBDS_GetNums: TpFIBDataSet;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        BplName: TqFCharControl;
        procedure OkButtonClick(Sender: TObject);
        procedure OkExecute(Sender: TObject);
        procedure CancelExecute(Sender: TObject);
        procedure ItemTypeOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
    public
        Id_Order: Int64;
        constructor Create(aOwner: TComponent; aFMode: TFormMode; aId_Order: Int64); reintroduce;
    end;

implementation

{$R *.dfm}
uses RxMemDS, uUnivSprav, uCommonSP, ClipBrd, UpOrderList, HSDialogs, UpKernelUnit;

constructor TUpOrderAddItemForm.Create(aOwner: TComponent; aFMode: TFormMode; aId_Order: Int64);
begin
    inherited Create(aOwner);

    Id_Order := aId_Order;

  //Загрузка из реестра последнего выбранного типа приказа
    AutoLoadFromRegistry(Self, nil);

  //Получение информации об номере пункта/подпункта по умолчанию
    Caption := 'Створення нового пункту';
    pFIBDS_GetNums.Database := TUpOrderListForm(owner.owner).WorkDatabase;
    pFIBDS_GetNums.Transaction := TUpOrderListForm(owner.owner).WriteTransaction;
    TUpOrderListForm(owner.owner).WriteTransaction.StartTransaction;
    pFIBDS_GetNums.ParamByName('id_order').AsInt64 := aId_Order;
    pFIBDS_GetNums.Open;
    qFIC_NumItem.Value := pFIBDS_GetNums['num_item'];
    qFIC_NumSubItem.Value := pFIBDS_GetNums['num_sub_item'];
    pFIBDS_GetNums.Close;
    TUpOrderListForm(owner.owner).WriteTransaction.Commit;
end;

procedure TUpOrderAddItemForm.OkButtonClick(Sender: TObject);
begin
    AutoSaveIntoRegistry(Self, nil);

    if VarIsNull(ItemType.Value)
        then begin
        HSDialogs.HSShowWarning('Треба вибрати тип пункту!', ItemType, ItemType.Interval, 0);
        exit;
    end;

    if VarIsNull(qFIC_NumItem.Value)
        then begin
        HSDialogs.HSShowWarning('Треба ввести номер пункту!', qFIC_NumItem, qFIC_NumItem.Interval, 0);
        qFIC_NumItem.SetFocus;
        exit;
    end;

    if VarIsNull(qFIC_NumSubItem.Value)
        then begin
        HSDialogs.HSShowWarning('Треба ввести номер підпункту!', qFIC_NumSubItem, qFIC_NumSubItem.Interval, 0);
        qFIC_NumSubItem.SetFocus;
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TUpOrderAddItemForm.OkExecute(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TUpOrderAddItemForm.CancelExecute(Sender: TObject);
begin
    CancelButton.Click;
end;

procedure TUpOrderAddItemForm.ItemTypeOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL(' + IntToStr(GetUserId) + ')';
    Params.Fields := 'id_type,type_name,bpl_name';
    Params.FieldsName := 'Тип,Назва';
    Params.KeyField := 'id_type';
    Params.ReturnFields := 'id_type,type_name,bpl_name';
    Params.DBHandle := Integer(TUpOrderListForm(owner.owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut)
        then begin
        value := output['id_type'];
        DisplayText := VarToStr(output['type_name']);
        BplName.Value := output['bpl_name'];
    end;
end;

end.
