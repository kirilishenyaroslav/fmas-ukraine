unit uRenameOrder;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uRenameOrderForm, uFormControl,
    FIBDataSet, pFIBDataSet, ibase;

type
    TRenameOrder = class(TSprav)
    private
        IsConnected : Boolean;
        Form : TfmRenameOrder;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

procedure TRenameOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmRenameOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1: Mode := fmAdd;
        2: Mode := fmModify;
        3: Mode := fmInfo;
    end;

    fmRenameOrder := Form;

    Form.IdOrder.Value := Input['Id_Order'];
    Form.DateOrder.Value := Input['Date_Order'];

    Form.IdOrderType.Value := Input['Id_Order_Type'];
    Form.NumItem.Value  := Input['Num_Item'];
    Form.SubItem.Value := Input['Sub_Item'];
    Form.IdOrderGroup.Value := Input['Id_Order_Group'];
    Form.Intro.Value := Input['Intro'];

    Form.FormControl.Prepare(Form.LocalDatabase, Mode, Form.IdOrder.Value, 0);

    Form.ShowModal;

    if not VarIsNull(Form.IdOrder.Value) then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder.Value;
        Output.Post;
    end;

    Form.Free;
end;

function CreateSprav: TSprav;
begin
    Result := TRenameOrder.Create;
end;

constructor TRenameOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TRenameOrder.Destroy;
begin
    inherited Destroy;
end;


end.
