unit AddItemUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Mask, CheckEditUnit, SpComboBox, Buttons, PersonalCommon, SpCommon,
    DB, IBCustomDataSet, IBQuery, ActnList, TextShablonsUnit, uFControl,
    uLabeledFControl, uSpravControl, FIBDataSet, pFIBDataSet, uSelectForm,
    ExtCtrls, uMemoControl, qfTools, Clipbrd;

type
    TAddItemForm = class(TForm)
        GetMaxNumItemQuery: TIBQuery;
        OutputQuery: TIBQuery;
        ActionList: TActionList;
        Cancel: TAction;
        Ok: TAction;
        GetMaxNumItemQueryMAX_NUM_ITEM: TIntegerField;
        GetMaxNumItemQueryMAX_SUB_ITEM: TIntegerField;
        ItemTypeQuery: TpFIBDataSet;
        ItemTypeQueryID_ORDER_TYPE: TFIBIntegerField;
        ItemTypeQueryNAME_TYPE: TFIBStringField;
        TopPanel: TPanel;
        MiddlePanel: TPanel;
        BottomPanel: TPanel;
        Label1: TLabel;
        NumItem: TCheckEdit;
        SubItem: TCheckEdit;
        SubItemBox: TCheckBox;
        ItemType: TqFSpravControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        IntroMemo: TqFMemoControl;
        Panel1: TPanel;
        ExistIntroButton: TButton;
        constructor Create(aOwner: TComponent; aFMode: TEditMode; aId_Order_Group, aId_Order, aNum_Item, aId_Order_Type: Integer; aName_Type: string; aSubItem: Integer; aIntro: string); reintroduce;
        procedure OkButtonClick(Sender: TObject);
        procedure OkExecute(Sender: TObject);
        procedure CancelExecute(Sender: TObject);
        procedure SubItemBoxClick(Sender: TObject);
        procedure ItemTypeChange(Sender: TObject);
        procedure ItemTypeOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ExistIntroButtonClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
        FMode: TEditMode;
        Id_Order_Group, Id_Order: Integer;
        Date_Order: TDate;
    end;

var
    AddItemForm: TAddItemForm;

implementation

uses GoodFunctionsUnit;

{$R *.dfm}

constructor TAddItemForm.Create(aOwner: TComponent; aFMode: TEditMode; aId_Order_Group, aId_Order, aNum_Item, aId_Order_Type: Integer; aName_Type: string; aSubItem: Integer; aIntro: string);
begin
    inherited Create(aOwner);

    FMode := aFMode;
    Id_Order_Group := aId_Order_Group;
    Id_Order := aId_Order;

    GetMaxNumItemQuery.Transaction := ReadTransaction;
    OutputQuery.Transaction := WriteTransaction;

    if FMode = emNew then begin
        GetMaxNumItemQuery.Close;
        GetMaxNumItemQuery.Params.ParamValues['ID_ORDER_GROUP'] := Id_Order_Group;
        GetMaxNumItemQuery.Open;

        if (not GetMaxNumItemQuery.IsEmpty) and (GetMaxNumItemQueryMAX_NUM_ITEM.Value <> 0)
            then
            NumItem.Text := IntToStr(GetMaxNumItemQueryMAX_NUM_ITEM.Value)
        else
            NumItem.Text := '1';

        if (not GetMaxNumItemQuery.IsEmpty) and (GetMaxNumItemQueryMAX_NUM_ITEM.Value <> 0)
            then
            SubItem.Text := IntToStr(GetMaxNumItemQueryMAX_SUB_ITEM.Value + 1)
        else
            SubItem.Text := '1';

        qFAutoLoadFromRegistry(Self, nil);
        MiddlePanel.Visible := (ItemType.Value = 20);
    end
    else begin
        ItemType.Blocked := True;
        NumItem.Text := IntToStr(aNum_Item);
        SubItem.Text := IntToStr(aSubItem);
        SubItemBox.Checked := (SubItem.Text <> '0');
        IntroMemo.Value := aIntro;

        ItemType.Value := aId_Order_Type;
        ItemType.DisplayText := aName_Type;

        MiddlePanel.Visible := (ItemType.Value = 20);
    end;

    case FMode of
        emNew: Caption := 'Створення нового пункту';
        emModify: Caption := 'Редагування пункту';
        emView: Caption := 'Перегляд пункту';
    end;

    if FMode = emView then begin
        ItemType.Enabled := False;
        NumItem.Enabled := False;
    end;
end;

procedure TAddItemForm.OkButtonClick(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self, nil);

    if not MiddlePanel.Visible then
        IntroMemo.Value := null;

    if FMode = emView then begin
        ModalResult := mrOk;
        exit;
    end;

    if VarIsNull(ItemType.Value) then begin
        ErrMsg('Треба вибрати тип пункту!');
        ItemType.Highlight(True);
        exit;
    end;

    if NumItem.Text = '' then begin
        ErrMsg('Треба ввести номер пункту!');
        NumItem.SetFocus;
        exit;
    end;

    if FMode = emNew then begin
        if (ShowOrder(-1, ItemType.Value, StrToInt(NumItem.text), emNew, OutputQuery, Self, Date_Order, id_order, '', '', StrToInt(SubItem.Text), Id_Order_Group, IntroMemo.Value)) and (id_order > 0) then
            ModalResult := mrOk;
    end;

    if FMode = emModify then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_ITEM_AFTER_ADD(' + IntToStr(Id_Order_Group) + ',' +
            IntToStr(id_order) + ',' +
            QuotedStr(NumItem.Text) + ',' +
            QuotedStr(SubItem.Text) + ',' +
            QuotedStr(IntroMemo.Value) + ')';
        ExecQuery(OutputQuery);
        ModalResult := mrOk;
    end;
end;

procedure TAddItemForm.OkExecute(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TAddItemForm.CancelExecute(Sender: TObject);
begin
    CancelButton.Click;
end;

procedure TAddItemForm.SubItemBoxClick(Sender: TObject);
begin
    if not SubItemBox.Checked then begin
        SubItem.Text := '0';
        SubItem.Enabled := False;
    end else
        SubItem.Enabled := True;
end;

procedure TAddItemForm.ItemTypeChange(Sender: TObject);
begin
    if (Visible) and (ItemType.Value = 20) then begin
        SubItemBox.Checked := False;
        SubItemBoxClick(Self);
    end;
end;

procedure TAddItemForm.ItemTypeOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if uSelectForm.qSelect(ItemTypeQuery, 'Виберіть тип пункту...') then begin
        Value := ItemTypeQueryID_ORDER_TYPE.Value;
        DisplayText := ItemTypeQueryNAME_TYPE.Value;

        MiddlePanel.Visible := (Value = 20);
        SubItemBox.Checked := not (Value = 20);

        try
            if Value = 20 then begin
                GetMaxNumItemQuery.Close;
                GetMaxNumItemQuery.Params.ParamValues['ID_ORDER_GROUP'] := Id_Order_Group;
                GetMaxNumItemQuery.Open;

                if (not GetMaxNumItemQuery.IsEmpty) and (GetMaxNumItemQueryMAX_NUM_ITEM.Value <> 0)
                    then
                    NumItem.Text := IntToStr(GetMaxNumItemQueryMAX_NUM_ITEM.Value + 1)
                else
                    NumItem.Text := '1';
            end;
        except
        end;

    end;
end;

procedure TAddItemForm.ExistIntroButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(17);

    if Form.ShowModal = mrOk
        then begin
        IntroMemo.Value := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TAddItemForm.SpeedButton1Click(Sender: TObject);
begin
    Clipboard.AsText := '<b>' + IntroMemo.Memo.SelText + '</b>';
    IntroMemo.Memo.PasteFromClipboard;
end;

end.
