unit AddAttrUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpCommon, StdCtrls, Buttons, FieldControl, EditControl, PersonalCommon,
    DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit;

type
    TAddAttrForm = class(TAddForm)
        Label1: TLabel;
        AttrTypeBox: TComboBox;
        Label2: TLabel;
        FC_ATTR_NAME: TFieldControl;
        FC_ATTR_TYPE: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DetailsQuery: TIBQuery;
        DetailsQueryID_PROPERTY: TIntegerField;
        DetailsQueryNAME_PROPERTY: TIBStringField;
        NameAttrEdit: TCheckEdit;
        DetailsQueryPROPERTY_TYPE: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);

    private
    { Private declarations }
    public

        Mode: TEditMode;
        Id_Attribute: Integer;
        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddAttrForm: TAddAttrForm;
    AttrEditControl: TEditControl;

implementation

{$R *.dfm}

function TAddAttrForm.GetId: Integer;
begin
    Result := Id_Attribute;
end;


procedure TAddAttrForm.Prepare(Mode: TEditMode; id: Integer);
begin
    inherited;
    Self.Mode := Mode;
    Self.Id_Attribute := id;
    if Mode = emNew then Caption := 'Додати атрибут'
    else Caption := 'Змінити атрибут';

    if Mode <> emNew then
    begin
        with DetailsQuery do
        begin
            close;
            Params.ParamValues['Id_Property'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    end;


    AttrEditControl.Prepare(Mode);
end;


procedure TAddAttrForm.FormCreate(Sender: TObject);
begin
    inherited;
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    AttrEditControl := TEditControl.Create;
    AttrEditControl.Add([FC_ATTR_NAME, FC_ATTR_TYPE]);
end;

procedure TAddAttrForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin

    AttrEditControl.Read;
    if AttrEditControl.CheckFill then
    begin
        if Mode = emNew then
        begin

            PersonalCommon.WriteTransaction.StartTransaction;
            ok := AttrEditControl.ExecProc('PCard_Properties_Insert', [], True);

            if not ok then
            begin
                PersonalCommon.WriteTransaction.Rollback;
                Exit;
            end;
            PersonalCommon.WriteTransaction.Commit;
            Id_Attribute := LastId;
        end;

        if Mode = emModify then
        begin
            PersonalCommon.WriteTransaction.StartTransaction;
            ok := AttrEditControl.ExecProc('PCard_Properties_Update', [Id_Attribute]);

            if not ok then
            begin
                PersonalCommon.WriteTransaction.Rollback;
                Exit;
            end;
            PersonalCommon.WriteTransaction.Commit;
        end;

    end;

end;

procedure TAddAttrForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    AttrEditControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;

end;

initialization
    RegisterClass(TAddAttrForm);
end.
