unit PCardAttrEditUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, Mask, CheckEditUnit, ComCtrls, Buttons,
    DB, IBCustomDataSet, IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon;

type
    TEditPCardAttrForm = class(TForm)
        MainGroup: TGroupBox;
        GroupComboBox: TSpComboBox;
        AttrComboBox: TSpComboBox;
        Label1: TLabel;
        Label2: TLabel;
        TextNumBox: TGroupBox;
        NumTextEdit: TCheckEdit;
        DateGroupBox: TGroupBox;
        DateBegPicker: TDateTimePicker;
        DateEndPicker: TDateTimePicker;
        Label3: TLabel;
        Label4: TLabel;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        WorkQuery: TIBQuery;
        FC_GROUP: TFieldControl;
        FC_ATTR: TFieldControl;
        FC_TEXT: TFieldControl;
        FC_DATE_BEG: TFieldControl;
        FC_DATE_END: TFieldControl;
        GetAttrTypeQuery: TIBQuery;
        GetAttrTypeQueryPROPERTY_TYPE: TIntegerField;
        InfoLabel: TLabel;
        FC_NUM: TFieldControl;
        DetailsQuery: TIBQuery;
        DetailsQueryID_PCARD: TIntegerField;
        DetailsQueryID_PROP: TIntegerField;
        DetailsQueryINT_VAL: TIntegerField;
        DetailsQuerySTR_VAL: TIBStringField;
        DetailsQueryDATE_VAL: TDateField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        DetailsQueryID_GROUP: TIntegerField;
        FakeEdit: TEdit;
        procedure FormCreate(Sender: TObject);
        procedure AttrComboBoxChange(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
        Mode: TEditMode;
        IdPCard: Integer;
        IdGroup: Integer;
        IdAttr: Integer;
        FirstTime: Boolean;
        procedure Prepare(Mode: TEditMode; Id_PCard, Id_Prop, Id_Group: Integer);
    end;

var
    EditPCardAttrForm: TEditPCardAttrForm;
    FormControl: TEditControl;

implementation

{$R *.dfm}

procedure TEditPCardAttrForm.Prepare(Mode: TEditMode; Id_PCard, Id_Prop, Id_Group: Integer);
begin

    Self.Mode := Mode;
    IdPCard := Id_PCard;
    IdGroup := Id_Group;
    IdAttr := Id_Prop;


    if Mode = emNew then
    begin
        Caption := 'Нова додаткова інформація';
    end;

    if Mode = emModify then
    begin
        Caption := 'Змінити додаткову інформацію';
        DetailsQuery.Params.ParamByName('ID_PCARD').Value := ID_PCARD;
        DetailsQuery.Params.ParamByName('ID_PROP').Value := ID_PROP;
        DetailsQuery.Params.ParamByName('ID_GROUP').Value := ID_GROUP;
        DetailsQuery.Open;
        FC_GROUP.Prepare;
        FC_ATTR.Prepare;
        DetailsQuery.Close;


    end;


end;


procedure TEditPCardAttrForm.FormCreate(Sender: TObject);
begin
    FirstTime := True;
    if not AdminMode then
    begin
        GroupComboBox.SpParams.SpMode := spmReadOnly;
        AttrComboBox.SpParams.SpMode := spmReadOnly;
    end;

    FormControl := TEditControl.Create;
    GetAttrTypeQuery.Transaction := PersonalCommon.ReadTransaction;
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl.Add([FC_GROUP, FC_ATTR, FC_NUM, FC_TEXT, FC_DATE_BEG, FC_DATE_END]);
end;

procedure TEditPCardAttrForm.AttrComboBoxChange(Sender: TObject);
var
    Id_Type: Integer;
begin

    TextNumBox.Visible := False;
    DateGroupBox.Visible := False;
    Id_Type := -1;

    GetAttrTypeQuery.Params.ParamByName('ID_PROP').Value := AttrComboBox.GetId;
    GetAttrTypeQuery.Open;
    Id_Type := GetAttrTypeQuery['Property_Type'];
    GetAttrTypeQuery.Close;

    InfoLabel.Visible := False;

    if Id_Type = 1 then
    begin
        TextNumBox.Visible := True;
        TextNumBox.Top := 67;
        TextNumBOx.Caption := 'Число';
        TextNumBox.Enabled := True;
        NumTextEdit.InputSet := isDigits;
        FC_NUM.Control := NumTextEdit;
        FC_TEXT.Control := FakeEdit;
        FC_NUM.Prepare;
        if not FirstTime then
            NumTextEdit.SetFocus;
    end;

    if Id_Type = 2 then
    begin
        TextNumBox.Visible := True;
        TextNumBox.Top := 67;
        TextNumBOx.Caption := 'Текст';
        TextNumBox.Enabled := True;
        NumTextEdit.InputSet := isAll;
        FC_NUM.Control := FakeEdit;
        FC_TEXT.Control := NumTextEdit;
        FC_TEXT.Prepare;
        if not FirstTime then
            NumTextEdit.SetFocus;
    end;

    if Id_Type = 3 then
    begin
        DateGroupBox.Visible := True;
        DateGroupBox.Top := 50;
        DateGroupBox.Enabled := True;
        DateGroupBox.Caption := 'Дата';
        DateEndPicker.Enabled := False;
        if not FirstTime then
            DateBegPicker.SetFocus;
        FC_DATE_BEG.Control := DateBegPicker;
    end;

    if Id_Type = 4 then
    begin
        DateGroupBox.Visible := True;
        DateGroupBox.Top := 50;
        DateGroupBox.Enabled := True;
        DateGroupBox.Caption := 'Період';
        DateEndPicker.Enabled := True;
        if not FirstTime then
            DateBegPicker.SetFocus;
        FC_DATE_BEG.Control := DateBegPicker;
        FC_DATE_END.Control := DateEndPicker;

    end;

    FirstTime := False;

end;

procedure TEditPCardAttrForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin

    FormControl.Read;

    if Mode = emNew then
    begin
        PersonalCommon.WriteTransaction.StartTransaction;
        ok := FormControl.ExecProc('PCARD_AND_PROP_INSERT', [IDPCARD]);

        if not ok then
        begin
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrCancel;
            Exit;
        end;

    end;

    if Mode = emModify then
    begin
        PersonalCommon.WriteTransaction.StartTransaction;
        ok := FormControl.ExecProc('PCARD_AND_PROP_UPDATE', [IDPCARD, IDGROUP, IDATTR]);

        if not ok then
        begin
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrCancel;
            Exit;
        end;
    end;

    PersonalCommon.WriteTransaction.Commit;
    ModalResult := mrOk;

end;



procedure TEditPCardAttrForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    GroupComboBox.SaveIntoRegistry;
    AttrComboBox.SaveIntoRegistry;
end;

end.
