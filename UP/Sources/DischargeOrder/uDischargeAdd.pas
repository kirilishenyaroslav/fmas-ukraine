unit uDischargeAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uSpravControl, uDateControl, uFControl,
    uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
    uBoolControl, AccMgmt, BaseTypes, FIBDatabase, pFIBDatabase, DB,
    FIBDataSet, pFIBDataSet;

type
    TfrmAddDischarge = class(TForm)
        GroupBox1: TGroupBox;
        DateDismission: TqFDateControl;
        DismissionReason: TqFCharControl;
        NameDismission: TqFSpravControl;
        ProfkomNote: TqFCharControl;
        cbAll: TqFBoolControl;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        NotUsedEdit: TqFIntControl;
        notWorkedEdit: TqFIntControl;
        DataSet: TpFIBDataSet;
        NoteEdit: TqFCharControl;
        procedure NameDismissionOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation
uses uCommonSp, uDischarge, qfTools, uUnivSprav, RXMemDS;
{$R *.dfm}

procedure TfrmAddDischarge.NameDismissionOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
{    Params.FormCaption := 'Довідник підстав роботи';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'SP_DISMISSION';
    Params.Fields := 'NAME_DISMISSION,KZOT_ST,ID_DISMISSION';
    Params.FieldsName := 'Назва підстави,Статья КЗОТ';
    Params.KeyField := 'ID_DISMISSION';
    Params.ReturnFields := 'NAME_DISMISSION,ID_DISMISSION,KZOT_ST';
    Params.DBHandle := Integer(TfrmDischargeOrder(owner).Database.Handle);
    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_DISMISSION'];
        DisplayText := VarToStr(output['Name_Dismission']);
    end;    }

    // создать справочник
    sp := GetSprav('asup\SpDismission');
    if sp <> nil then
    begin
        // заполнить входные параметры
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmDischargeOrder(owner).Database.Handle);
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

procedure TfrmAddDischarge.FormCreate(Sender: TObject);
begin
    DateDismission.Value := date;
end;

procedure TfrmAddDischarge.FormShow(Sender: TObject);
var
    CheckHolDays, CheckNotWorkDays: Integer;
    IdServer: Integer;
begin
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select id_server from pub_sys_data';
    DataSet.Open;
    IdServer := DataSet['Id_Server'];

    if ((IdServer = 99) or (IdServer = 91)) then
    begin
        CheckHolDays := fibCheckPermission('/ROOT/Up_order_system/DISMIS_COMPENS_DAYS', 'Edit');
        CheckNotWorkDays := fibCheckPermission('/ROOT/Up_order_system/DISM_NOT_WORK_DAYS', 'Edit');
    end;

    if ((IdServer = 95) or (IdServer = 97) or (IdServer = 93)) then
    begin
        CheckHolDays := fibCheckPermission('/ROOT/UP_VER2_ORDERS/DISMIS_COMPENS_DAYS', 'Edit');
        CheckNotWorkDays := fibCheckPermission('/ROOT/UP_VER2_ORDERS/DISM_NOT_WORK_DAYS', 'Edit');
    end;

    case CheckHolDays of
        0: NotUsedEdit.Blocked := False;
        -1: NotUsedEdit.Blocked := True;
    end;

    case CheckNotWorkDays of
        0: notWorkedEdit.Blocked := False;
        -1: notWorkedEdit.Blocked := True;
    end;

    DismissionReason.SetFocus;
end;

procedure TfrmAddDischarge.btnOkClick(Sender: TObject);
begin
    if TfrmDischargeOrder(Owner).Input['mode'] = 3 then Close;
    if qFCheckAll(Self) then ModalResult := mrOk;
end;

end.

