unit uPochasDisAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uSpravControl, uDateControl, uFControl,
    uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
    uBoolControl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    uMemoControl;

type
    TfrmAddPochasDis = class(TForm)
        GroupBox1: TGroupBox;
        DateDismission: TqFDateControl;
        DismissionReason: TqFCharControl;
        NameDismission: TqFSpravControl;
        cbAll: TqFBoolControl;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        NoteEdit: TqFMemoControl;
        ManEdit: TqFSpravControl;
        procedure NameDismissionOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure ManEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation
uses uCommonSp, uPochasDis, qfTools, uSelPochas;
{$R *.dfm}

procedure TfrmAddPochasDis.NameDismissionOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\SpDismission');
    if sp <> nil then
    begin
        // заполнить входные параметры
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasDisOrder(owner).Database.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.Post;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Dismission'];
            DisplayText := sp.Output['Name_Dismission'];

            if not VarIsNull(sp.Output['Kzot_St']) then
                DisplayText := DisplayText + ' ' + sp.Output['Kzot_St'];
        end;
        sp.Free;
    end;
end;

procedure TfrmAddPochasDis.FormCreate(Sender: TObject);
begin
    DateDismission.Value := date;
end;

procedure TfrmAddPochasDis.FormShow(Sender: TObject);
begin
    DismissionReason.SetFocus;
end;

procedure TfrmAddPochasDis.btnOkClick(Sender: TObject);
begin
    if TfrmPochasDisOrder(Owner).Input['mode'] = 3 then Close;
    if qFCheckAll(Self) then ModalResult := mrOk;
end;

procedure TfrmAddPochasDis.ManEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    frm: TSelPochasForm;
begin
    try
        frm := TSelPochasForm.Create(self);
        frm.date_search := DateDismission.Value;
        frm.DSetPochas.Close;
        frm.DSetPochas.SQLs.SelectSQL.Text := 'select * from UP_DT_POCHAS_PLAN_S(:IN_DATE)';
        frm.DSetPochas.parambyname('IN_DATE').AsDate := frm.date_search;
        frm.DSetPochas.Open;
    except on e: exception do
            showmessage(e.message);
    end;
    if frm.ShowModal = mrOk then
    begin
        Value := frm.DSetPochas['ID_POCHAS_PLAN'];
        if VarIsNull(frm.DSetPochas['NUM_ORDER']) then
            DisplayText := frm.DSetPochas['FIO']
        else
            DisplayText := '№ ' + frm.DSetPochas['NUM_ORDER'] + ', ' + frm.DSetPochas['FIO'];
    end;
    frm.DSetPochas.Close;
    frm.Free;
end;

end.

